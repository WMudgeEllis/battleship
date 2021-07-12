require './lib/ship'

RSpec.describe Ship do
  context 'initialize' do
    it 'exists' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser).to be_a(Ship)
    end

    it 'has length' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.length).to eq(3)
    end

    it 'read length' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.health).to eq(3) 
    end

    it 'can be sunk' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.sunk?).to eq(false)
    end


  end
end
