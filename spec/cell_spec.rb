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

    it 'renders S if ship is there with optional argument true' do
      cell = Cell.new('B4')
      cruiser = Ship.new('Cruiser', 3)

      cell.place_ship(cruiser)

      expect(cell.render).to eq('.')
      expect(cell.render(true)).to eq('S')
    end

    it 'renders . if cell.empty? returns true and if fired_upon false' do
      cell_1 = Cell.new('B4')
      cell_2 = Cell.new('C8')
      cruiser = Ship.new('Cruiser', 3)

      expect(cell_1.render).to eq('.')
    end

    it 'renders M if cell.empty? returns true and fired_upon returns true' do
      cell_1 = Cell.new('B4')
      cruiser = Ship.new('Cruiser', 3)
      cell_1.fire_upon

      expect(cell_1.render).to eq('M')
    end

    it 'renders H if ship is there and it has been fired_upon' do
      cell_1 = Cell.new('C3')
      cruiser = Ship.new('Cruiser', 3)
      cell_1.place_ship(cruiser)

      expect(cell_1.render).to eq('.')
      expect(cell_1.render(true)).to eq('S')
      cell_1.fire_upon

      expect(cell_1.render).to eq('H')
    end

    it 'renders X if ship is sunk' do
      cell_2 = Cell.new('C3')
      cruiser = Ship.new('Cruiser', 3)
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      cell_2.fire_upon
      cell_2.fire_upon


      expect(cell_2.ship.sunk?).to eq(true)
      expect(cell_2.render).to eq('X')
    end
  end
end
