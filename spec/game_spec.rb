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

    xit 'can place random computer ships' do
      game = Game.new
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)

      expect(game.place_comp_ships).to eq(false)

      #trust us its random, pretty please
    end

    it 'can fire' do
      game = Game.new
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)

      game.fire(game.computer_board, 'A1')

      expect(game.computer_board.cells[:A1].fired_upon?).to eq(true)

    end

    it 'user can fire' do
      game = Game.new

      game.user_fire('A1')
      expect(game.computer_board.cells[:A1].fired_upon?).to eq(true)
    end

    it 'computer can fire' do
      game = Game.new

      game.computer_fire

      expect(game.user_board.get_cells_not_fired_upon.length).to eq(15)
    end

    it 'can record shots' do
      game = Game.new

      game.computer_fire

      expect(game.cells_shot.length).to eq(1)

    end

    it 'can give feedback for shots'do
      game = Game.new

      game.computer_fire
      game.computer_fire
      # require "pry"; binding.pry
      game.shots_feedback
    end

    it 'can test sunken ships'do
      game = Game.new

      expect(game.all_user_sunk?).to eq(false)

      game.user_ships[0].hit
      game.user_ships[0].hit
      game.user_ships[0].hit

      game.user_ships[1].hit
      game.user_ships[1].hit


      expect(game.all_user_sunk?).to eq(true)
    end

    it 'can test computer sunken ships' do

      game = Game.new

      expect(game.all_comp_sunk?).to eq(false)

      game.computer_ships[0].hit
      game.computer_ships[0].hit
      game.computer_ships[0].hit

      game.computer_ships[1].hit
      game.computer_ships[1].hit


      expect(game.all_comp_sunk?).to eq(true)

    end
  end



end
