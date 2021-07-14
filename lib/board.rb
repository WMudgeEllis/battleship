
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

  def valid_placement?(ship, arr)
    row_range = (arr.first.chr)..(arr.last.chr)

    if arr.first[-1] != arr.last[-1] #make these different methods
      column_range = (arr.first[-1])..(arr.last[-1]) #make these different methdods
    end

    

    #require 'pry'; binding.pry
    if ship.length != arr.length
      return false

        #make sure they are consecutive by letter
    #elsif (arr.first.chr)..(arr.last.chr)

  elsif column_range.to_a.length != arr.length #hits
      require 'pry'; binding.pry
      return false

    else nil
    end


  end

end
