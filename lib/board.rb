class Board
    attr_reader :cells
    Rows = ['A', 'B', 'C', 'D']
    Columns = [1, 2, 3, 4]

  def initialize
    @cells = {}
  end

  def cell_generator
    cell_count = 0
    while cell_count != Rows.length
      Columns.each do |num|
        coordinate = Rows[cell_count] + num.to_s
        @cells[coordinate.to_sym] = Cell.new(coordinate)
      end
      cell_count += 1
    end
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate.to_sym) && get_cells_not_fired_upon.include?(coordinate)
  end

  def valid_column_range(ship)
    ('A1'..'D4').each_cons(ship.length).map do |poss_arr|
      poss_arr
    end
  end

  def valid_column?(ship, arr)
    valid_column_range(ship).any? do |poss_arr|
      poss_arr == arr
    end
  end

  def reversed_and_sorted_coords
    ('A1'..'D4').map do |coordinate|
      coordinate.reverse!
    end.sort
  end

  def row_possible_range(ship)
    sorted = reversed_and_sorted_coords.map do |coordinate|
      coordinate.reverse
    end

    sorted.each_cons(ship.length).map do |poss_arr|
      poss_arr
    end
  end

  def valid_row?(ship, arr)
    all_possible_valid_rows(ship).include?(arr)
  end

  def valid_length?(ship, arr)
    ship.length == arr.length
  end


  def valid_placement?(ship, arr)
    if !valid_length?(ship, arr)
      return false
    elsif overlapping?(arr) == true
      return false
    elsif !valid_column?(ship, arr) && !valid_row?(ship, arr)
      return false
    elsif valid_column?(ship,arr) || valid_row?(ship, arr)
      return true
    end
  end


  def get_cells_not_fired_upon
    not_fired_upon_cells = @cells.values.find_all do |cells|
      !cells.fired_upon?
    end

    not_fired_upon_cells.map do |cell|
      cell.coordinate
    end
  end

  def get_cells_not_empty
    @cells.values.find_all do |cells|
      !cells.empty?
    end
  end

  def filled_cell_coords_array
    get_cells_not_empty.flat_map do |cell|
      cell.coordinate
    end
  end

  def overlapping?(arr)
    total_coords = filled_cell_coords_array + arr
    total_coords.length != total_coords.uniq.length
  end

  def place(ship, array)
    if valid_placement?(ship, array)
      array.each do |coords|
        @cells[coords.to_sym].place_ship(ship)
      end
    else
      false
    end
  end

  def row_output(range, show_ship=false)
    @cells.values[range].map do |cell|
      cell.render(show_ship)
    end.join(' ')
  end

  def render(show_ship=false)
    "  1 2 3 4 \nA #{row_output(0..3, show_ship)} \nB #{row_output(4..7, show_ship)} \nC #{row_output(8..11, show_ship)} \nD #{row_output(12..15, show_ship)} \n"
  end

  def all_possible_valid_columns(ship)
    all_valid_columns = []
    if ship.length == 3
      index_start = 0
      index_end = 1
      while index_start != 40
        all_valid_columns << valid_column_range(ship)[index_start..index_end]
        index_start += 10
        index_end += 10
      end
    elsif ship.length == 2
      index_start = 0
      index_end = 2
      while index_start != 40
        all_valid_columns << valid_column_range(ship)[index_start..index_end]
        index_start += 10
        index_end += 10
      end
    end
    all_valid_columns.flatten(1)
  end

  def all_possible_valid_rows(ship)
    all_valid_rows = []
    if ship.length == 2
      all_valid_rows << row_possible_range(ship)[3..5]
      all_valid_rows << row_possible_range(ship)[7..9]
      all_valid_rows << row_possible_range(ship)[11..13]
      all_valid_rows << row_possible_range(ship)[15..17]
    elsif ship.length == 3
       all_valid_rows << row_possible_range(ship)[3..4]
       all_valid_rows << row_possible_range(ship)[7..8]
       all_valid_rows << row_possible_range(ship)[11..12]
       all_valid_rows << row_possible_range(ship)[15..16]
    end
    all_valid_rows.flatten(1)
  end

  def all_valid_placements(ship)
    all_possible_valid_columns(ship) + all_possible_valid_rows(ship)
  end
end
