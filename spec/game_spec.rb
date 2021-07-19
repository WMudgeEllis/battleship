require "./lib/board"
require "./lib/turn"
require "./lib/ship"
require "./lib/game"
require 'pry'

RSpec.describe Game do

  context 'initialize' do

    it 'exists and has attributes' do
      game = Game.new

      expect(game).to be_a(Game)
      expect(game.computer_board).to be_a(Board)
      expect(game.user_board).to be_a(Board)
      expect(game.user_ships[0]).to be_a(Ship)
      expect(game.computer_ships[0]).to be_a(Ship)
      expect(game.user_board.cells.size).to eq(16)
    end
  end

  context 'methods' do

    it 'can place random computer ships' do
      game = Game.new
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)

      expect(game.place_comp_ships).to eq(false)
      # binding.pry


    end

  end


end
