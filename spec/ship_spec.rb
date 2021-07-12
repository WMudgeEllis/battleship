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
      cruiser.hit
      # require 'pry';binding.pry
      expect(cruiser.health).to eq(2)
      cruiser.hit

      expect(cruiser.health).to eq(1)
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit

      expect(cruiser.health).to eq(0)
      expect(cruiser.sunk?).to eq(true)
    end




  end
end
