require "./lib/board"
require "./lib/turn"
require "./lib/ship"
require "./lib/game"

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

    it 'can generate all possible valid arrays' do
      game = Game.new


      expect(game.all_valid_placements(game.computer_ships[1])).to eq(false)
    end

  end


end
