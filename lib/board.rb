require 'pry'
class Board
  attr_reader :rows, :columns, :cells
  def initialize
    @rows = ['A', 'B', 'C', 'D']
    @columns = [1, 2, 3, 4]
    @cells = {}
  end

  def cells
    cell_count = 0
    while cell_count != @rows.length
      @columns.each do |num| #needs columns to be int
        coordinate = @rows[cell_count] + num.to_s #produces string that eq (rownum)
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
    # require "pry"; binding.pry
    board_range.each_cons(ship.length).map{|poss_arr|poss_arr}.any?{|poss_arr|poss_arr == arr}
  end

  def valid_row?(ship, arr)
    letter_range = ('A'..'D')
    split_array = arr.map{|x| x.split("")}
    letters = split_array.map{|x| x.shift}
    letter_range.each_cons(ship.length).map{|poss_arr|poss_arr}.any?{|poss_arr|poss_arr == letters}
  end

  def valid_length?(ship, arr)
    ship.length == arr.length
  end


  def valid_placement?(ship, arr)
    if !valid_length?(ship, arr)
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




end
