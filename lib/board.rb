
class Board
  attr_reader :cells, :rows, :columns
  def initialize
    @rows = ['A', 'B', 'C', 'D']
    @columns = [1, 2, 3, 4]
    @cells = {}
  end
  def generate_cells
    x = 0
    while x != @rows.length
      (@columns.last).times do |i|
        coordinate = @rows[x].to_s + @columns[i].to_s
        @cells[coordinate.to_sym] = Cell.new(coordinate)
      end
      x += 1
    end
  end
  def valid_coordinate?(coordinate)
    @cells.include?(coordinate.to_sym)
  end
  def valid_placement(coord_1, coord_2, *coord_3)

  end
end

    # @rows.each do |x|
    #   a = x * @columns.last
    #   a + @columns[0].to_s
    # end
    # make_coordinates
  # end
  # def make_coordinates
  #   @rows.each do |x|
  #     a = x * @columns[3]
  #     a + @columns[0].to_s
  #     @cells
  #   end
  # end
# end
