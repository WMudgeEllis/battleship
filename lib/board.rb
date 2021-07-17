require 'pry'
class Board
    attr_reader :cells#remeber to put back cells
    Rows = ['A', 'B', 'C', 'D']

    Columns = [1, 2, 3, 4]

  def initialize
    @cells = {}
  end


  #board.cells[this needs to be a symbol] this is potential solution below

  # def cells(*cell_tags)
  #   if cell_tags.class == String
  #     @cells[cell_tags.to_sym]
  #   else
  #     @cells
  #   end
  # end


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
    @cells.include?(coordinate.to_sym)
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

  def row_possible_range(ship)
    Rows.each_cons(ship.length).map do |poss_arr|
      poss_arr
    end
  end

  def valid_row?(ship, arr)
    row_possible_range(ship).any? do |poss_arr|
      poss_arr == letter_array(arr)
    end
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
    elsif valid_column?(ship,arr)
      return true
    elsif !valid_row?(ship, arr)
      return false
    elsif valid_row?(ship, arr)
      return true
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



end
