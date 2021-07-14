require './lib/board'
require './lib/cell'

RSpec.describe Board do
  context 'initialize' do
    it 'exists' do
      board = Board.new

      expect(board).to be_a(Board)
    end

    it 'creates empty hash cells called cells' do
      board = Board.new

      expect(board.cells).to eq({})
    end
  end
  context 'methods' do
    it 'can create cells with coordinates' do
      board = Board.new
      board.generate_cells

      expect(board.cells).to eq(board.cells
        # :A1  #<Cell:0x00007ff0728a3f58...>,
        # "D4 => #<Cell:0x00007ff0728a3850...>
      )
    end
    it 'can check if valid coordinate' do
      board = Board.new
      board.generate_cells

      expect(board.valid_coordinate?('A4')).to eq(true)
      expect(board.valid_coordinate?('R6')).to eq(false)
    end
    it 'can check if placing a ship is vaild' do
      board = Board.new
      submarine = Ship.new("Submarine", 2)
      cruiser = Ship.new("Cruiser", 3)
      board.generate_cells

      expect(board.valid_placement?(cruiser, ['A1', 'A2', 'A3'])).to eq(true)
      expect(board.valid_placement?().to eq(false)
  end
end
