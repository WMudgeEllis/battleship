require './lib/board'
require './lib/ship'
require 'pry'

RSpec.describe Board do
  context 'initialize' do
    it 'exists' do
      board = Board.new

      expect(board).to be_a(Board)
    end

    xit 'creates empty hash cells called cells' do
      board = Board.new

      expect(board.cells).to eq({})
    end
  end

  context 'methods' do

      it 'can generate cells' do
        board = Board.new

        board.cells

        #require 'pry'; binding.pry
      end

      it 'can validate basic coordinate' do
        board = Board.new

        board.cells

        expect(board.valid_coordinate?('A1')).to eq(true)
        expect(board.valid_coordinate?('D4')).to eq(true)
        expect(board.valid_coordinate?('A5')).to eq(false)
        expect(board.valid_coordinate?('E1')).to eq(false)
        expect(board.valid_coordinate?('A22')).to eq(false)
      end

      context 'can validate ship placement' do
        it "can validate a row placement" do
          board = Board.new
          cruiser = Ship.new('Cruiser', 3)
          submarine = Ship.new('Submarine', 2)

          board.cells
          expect(board.valid_placement?(cruiser, ['A1', 'A2'])).to eq(false)
          expect(board.valid_placement?(submarine, ['A2', 'A3', 'A4'])).to eq(false)
          expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
          expect(board.valid_placement?(cruiser, ['A1', 'A2', 'A4'])).to eq(false)
          expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
          expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
          expect(board.valid_placement?(cruiser, ['A1', 'A2', 'A3'])).to eq(true)
        end
        it 'can validate a column placement' do
          board = Board.new
          cruiser = Ship.new('Cruiser', 3)
          submarine = Ship.new('Submarine', 2)

          expect(board.valid_placement?(submarine, ["D1", "C1"])).to eq(false)
          expect(board.valid_placement?(submarine, ["C2", "B2"])).to eq(false)
          expect(board.valid_placement?(cruiser, ['C1', 'B1', 'A1'])).to eq(false)
          expect(board.valid_placement?(cruiser, ['B2', 'B2', 'B2'])).to eq(false)
          expect(board.valid_placement?(submarine, ['A2', 'B2'])).to eq(true)
          expect(board.valid_placement?(cruiser, ['A4', 'B4', 'C4'])).to eq(true)

        end

      end

  end

end
