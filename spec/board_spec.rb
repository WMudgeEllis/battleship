require './lib/board'
require './lib/ship'
require './lib/cell'
require 'pry'

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

      it 'can generate cells' do
        board = Board.new

        board.cell_generator
        board.cells

        #require 'pry'; binding.pry
      end

      it 'can validate basic coordinate' do
        board = Board.new

        board.cell_generator

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

          board.cell_generator

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
      context 'placing ships' do
        it 'can place' do
          board = Board.new
          cruiser = Ship.new('Cruiser', 3)
          board.cell_generator

          board.place(cruiser, ['A1', 'A2', 'A3'])

          cell_1 = board.cells['A1'.to_sym]
          cell_2 = board.cells['A2'.to_sym]
          cell_3 = board.cells['A3'.to_sym]

          # binding.pry

          expect(cell_1.ship).to be_a(Ship)
          expect(cell_2.ship).to be_a(Ship)
          expect(cell_3.ship).to be_a(Ship)
          expect(cell_3.ship).to eq(cell_2.ship)
        end


        it 'can exclude ships that are overlapping' do
          board = Board.new
          cruiser = Ship.new('Cruiser', 3)
          submarine = Ship.new('Submarine', 2)

          board.cell_generator

          board.place(cruiser, ['A1', 'A2', 'A3'])

          cell_1 = board.cells['A1'.to_sym]
          cell_2 = board.cells['A2'.to_sym]
          cell_3 = board.cells['A3'.to_sym]

          submarine = Ship.new('Submarine', 2)

          expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
        end
      end
      context 'render board' do
        it 'it renders empty' do
          board = Board.new

          board.cell_generator

          expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
        end
      end

      end

  end

end
