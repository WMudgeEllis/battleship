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
      # binding.pry


    end

    xit 'can fire' do
      game = Game.new
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)

      game.fire(game.computer_board, 'A1')

      expect(game.computer_board.cells[:A1].fired_upon?).to eq(true)

    end

    xit 'user can fire' do
      game = Game.new

      game.user_fire('A1')
      # binding.pry
      expect(game.computer_board.cells[:A1].fired_upon?).to eq(true)
      game.user_fire('D6')
    end

    xit 'computer can fire' do
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
      require "pry"; binding.pry
      game.shots_feedback
    end
  end



end
