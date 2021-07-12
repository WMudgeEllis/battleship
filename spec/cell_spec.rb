require './lib/ship'
require './lib/cell'


RSpec.describe Cell do

  context 'initialize' do
    it 'exits' do
      cell = Cell.new('B4')

      expect(cell).to be_a(Cell)
    end

    it 'can take a coordinate' do
      cell = Cell.new('B4')

      expect(cell.coordinate).to eq('B4')
    end
  end

  context 'methods' do

    it 'can place a ship' do
      cell = Cell.new('B4')
      cruiser = Ship.new('Cruiser', 3)

      expect(cell.ship).to eq(nil)
      expect(cell.empty?).to eq(true)

      cell.place_ship(cruiser)

      expect(cell.empty?).to eq(false)
      expect(cell.ship).to eq(cruiser)
    end

  end






end
