
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

  def valid_placement?(ship, coords)
    coords.map {|x| x.split("")}

    if coords.length == ship.length
      letters = (coords[0][0]..coords[(coords.length) -1][0]).to_a
      numbers = (coords[0][1]..coords[(coords.length) - 1][1]).to_a
        letters.all? {|x| x == letters[0]} && coords.each_cons(numbers[0])# returns array of consecutive nums. compare to orignal array

        numbers.all? {|x| numbers == numbers[0]}
    else
      false
    end
  end
end
# if x.include?(coords[0][0])
#   return true
# elsif x.include?(coords[0][1])
#   return true
# else
#   return false
# coords.map do |x|
#   x.split("")
# end
# for coords.length |x| do
#   letter = x[0]
#   num = x[1]
# end
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
