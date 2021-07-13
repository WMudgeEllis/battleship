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

    it 'determine whether a cell has been fired upon' do
      cell = Cell.new('B4')
      cruiser = Ship.new('Cruiser', 3)

      cell.place_ship(cruiser)
      expect(cell.fired_upon?).to eq(false)

      cell.fire_upon

      expect(cell.fired_upon?).to eq(true)
      expect(cell.ship.health).to eq(2)

    end

  end






end
