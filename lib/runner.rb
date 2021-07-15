require './board'
require './ship'
require './cell'

board = Board.new
submarine = Ship.new("Submarine", 2)
cruiser = Ship.new("Cruiser", 3)
board.generate_cells
letters = (coords[0][0]..coords[(coords.length) -1][0])

require 'pry';binding.pry
