
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

  def valid_placement?(ship, *arr)
    false if ship.length != arr.length
  end

end
