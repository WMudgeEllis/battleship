require 'pry'
class Board
    attr_reader :cells#remeber to put back cells
    Rows = ['A', 'B', 'C', 'D']

    Columns = [1, 2, 3, 4]

  def initialize
    @cells = {}
  end

  def cell_generator
    cell_count = 0
    while cell_count != Rows.length
      Columns.each do |num| #needs columns to be int
        coordinate = Rows[cell_count] + num.to_s #produces string that eq (rownum)
        @cells[coordinate.to_sym] = Cell.new(coordinate)
      end
      cell_count += 1
    end
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate.to_sym) && get_cells_not_fired_upon.include?(coordinate)
  end

  def valid_column_range(ship)
    ('A1'..'D4').each_cons(ship.length).map do |poss_arr| # Will always regenrate possible postion array (Memory intensive)
      poss_arr
    end
  end


  def valid_column?(ship, arr)
    valid_column_range(ship).any? do |poss_arr|
      poss_arr == arr
    end
  end

  def split_array(arr)
    arr.map do |x|
      x.split("")
    end
  end

  def letter_array(arr)
    split_array(arr).map do |x|
      x.shift
    end
  end

  def reversed_and_sorted_coords
    reversed = []

    ('A1'..'D4').each do |x|
      reversed << x.reverse!
    end
    reversed.sort
  end

  def row_possible_range(ship)
    sorted = []
    reversed_and_sorted_coords.each do |x|
      sorted << x.reverse
    end
    x = sorted.each_cons(ship.length).map do |poss_arr|
      poss_arr
    end
    # binding.pry
  end

  def valid_row?(ship, arr)
    all_possible_valid_rows(ship).include?(arr)
  end

  def valid_length?(ship, arr)
    ship.length == arr.length
  end


  def valid_placement?(ship, arr)
    # valid_length?(ship, arr) && valid_column?(ship, arr) && valid_row?(ship,arr) && !overlapping?(arr)

    if !valid_length?(ship, arr)
      return false
    elsif overlapping?(arr) == true
      return false
    elsif !valid_column?(ship, arr) && !valid_row?(ship, arr)
      return false
    elsif valid_column?(ship,arr) || valid_row?(ship, arr)
      return true
    # elsif !valid_row?(ship, arr)
      # return false
    # elsif valid_row?(ship, arr)
      # return true
    else
      nil
    end
  end

  def cell_values
    @cells.values
  end

  def cell_keys
    @cells.keys
  end

  def get_cells_not_empty
    cell_values.find_all do |cells|
      !cells.empty?
    end
  end

  def get_cells_not_fired_upon
    x = cell_values.find_all do |cells|
      !cells.fired_upon?
    end
    x.map do |x|
      x.coordinate
    end
  end

  def filled_cell_coords_array
    get_cells_not_empty.flat_map do |cell|
      cell.coordinate
    end
  end

  def overlapping?(arr)
    x = filled_cell_coords_array + arr
    x.length != x.uniq.length # Rename x to total_coords
  end

  def place(ship, array)
    if valid_placement?(ship, array)
      array.each do |x|#Rename x to coords
        @cells[x.to_sym].place_ship(ship)
      end
    elsif !valid_placement?(ship, array)
      return false
    end

  end

  def row_output(range, show_ship=false)
    cell_values[range].map do |cell|
      cell.render(show_ship)
    end.join(' ')

  end

  def render(show_ship=false)
    # binding.pry
    "  1 2 3 4 \nA #{row_output(0..3, show_ship)} \nB #{row_output(4..7, show_ship)} \nC #{row_output(8..11, show_ship)} \nD #{row_output(12..15, show_ship)} \n"
  end

  def all_possible_valid_columns(ship)
    all_valid_columns = []
    # require "pry"; binding.pry
    if ship.length == 3
      x = 0
      y = 1
      while x != 40
        all_valid_columns << valid_column_range(ship)[x..y]
        x += 10
        y += 10
      end
    elsif ship.length == 2
      x = 0
      y = 2
      while x != 40
        all_valid_columns << valid_column_range(ship)[x..y]
        x += 10
        y += 10
      end
    end
    all_valid_columns.flatten(1)
  end

  def all_possible_valid_rows(ship)
    all_valid_columns = []
    if ship.length == 2
      all_valid_columns << row_possible_range(ship)[3..5]
      all_valid_columns << row_possible_range(ship)[7..9]
      all_valid_columns << row_possible_range(ship)[11..13]
      all_valid_columns << row_possible_range(ship)[15..17]
    elsif ship.length == 3
       all_valid_columns << row_possible_range(ship)[3..4]
       all_valid_columns << row_possible_range(ship)[7..8]
       all_valid_columns << row_possible_range(ship)[11..12]
       all_valid_columns << row_possible_range(ship)[15..16]
    end
    all_valid_columns.flatten(1)

  end

  def all_valid_placements(ship)
      # require "pry"; binding.pry
    all_possible_valid_columns(ship) + all_possible_valid_rows(ship)

  end







end
