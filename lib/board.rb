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


  def valid_column?(ship, arr)
    board_range = ('A1'..'D4')
    possible_range = board_range.each_cons(ship.length).map{|poss_arr|poss_arr}# make  methods to help readabiltiy
    possible_range.any?{|poss_arr|poss_arr == arr}# multi line versions of all iterations

  end

  def valid_row?(ship, arr)
    split_array = arr.map{|x| x.split("")}
    letters = split_array.map{|x| x.shift}
    possible_range = Rows.each_cons(ship.length).map{|poss_arr|poss_arr}
    possible_range.any?{|poss_arr|poss_arr == letters}
    # letter_range.each_cons(ship.length).map{|poss_arr|poss_arr}.any?{|poss_arr|poss_arr == letters}
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

  def get_cells_not_empty
    cell_values.find_all do |cells|
      if not cells.empty?
        true
      else
        false
      end
    end
  end

  def filled_cell_coords_array
    get_cells_not_empty.flat_map do |cell|
      cell.coordinate
    end
  end

  def overlapping?(arr)
    x = filled_cell_coords_array + arr
    x.length != x.uniq.length
  end

  def place(ship, array)
    if valid_placement?(ship, array)
      array.each do |x|
        @cells[x.to_sym].place_ship(ship)
      end
    end

  end



end
