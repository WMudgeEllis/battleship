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

      it 'can validate basic coordinate' do # put in valid ship placement
        board = Board.new

        board.cell_generator

        expect(board.valid_coordinate?('A1')).to eq(true)
        expect(board.valid_coordinate?('D4')).to eq(true)
        expect(board.valid_coordinate?('A5')).to eq(false)
        expect(board.valid_coordinate?('E1')).to eq(false)
        expect(board.valid_coordinate?('A22')).to eq(false)
      end
      
      it "can fetch all cels not fired upon" do
        board = Board.new

        board.cell_generator
        expect(board.get_cells_not_fired_upon).to eq(['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4'])

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

          expect(board.valid_placement?(submarine, ['A1', 'B2'])).to eq(false)
          expect(board.valid_placement?(submarine, ['C2', 'B3'])).to eq(false)
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

        it 'can reveal a ship' do
          board = Board.new
          cruiser = Ship.new('Cruiser', 3)
          submarine = Ship.new('Submarine', 2)

          board.cell_generator
          board.place(cruiser, ['A1', 'A2', 'A3'])

          cell_1 = board.cells['A1'.to_sym]
          cell_2 = board.cells['A2'.to_sym]
          cell_3 = board.cells['A3'.to_sym]

          # binding.pry
          expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")

        end

        it 'can render all' do
          board = Board.new
          cruiser = Ship.new('Cruiser', 3)
          submarine = Ship.new('Submarine', 2)

          board.cell_generator
          cell_1 = board.cells['A1'.to_sym]

          board.place(cruiser, ['A1', 'A2', 'A3'])
          # binding.pry
          cell_1.fire_upon

          expect(board.render).to eq("  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . \n")

          cell_2 = board.cells['B1'.to_sym]
          cell_2.fire_upon

          expect(board.render).to eq("  1 2 3 4 \nA H . . . \nB M . . . \nC . . . . \nD . . . . \n")

          cell_3 = board.cells[:A2]
          cell_4 = board.cells[:A3]

          cell_3.fire_upon
          cell_4.fire_upon

          expect(board.render).to eq("  1 2 3 4 \nA X X X . \nB M . . . \nC . . . . \nD . . . . \n")





        end


      end

      end

  end

end
