require "./lib/board"
require "./lib/turn"
require "./lib/cell"
require "./lib/game"
require "./lib/ship"
require "pry"


RSpec.describe Turn do


  context 'initailze' do
    it 'exists and has attributes' do
      game = Game.new
      turn = Turn.new(game)

      expect(turn).to be_a(Turn)
      expect(turn.shots).to eq([])
      expect(turn.game).to be_a(Game)
    end



  end

  context 'methods' do

    it 'can give feedback' do
      game = Game.new
      turn = Turn.new(game)
      submarine = Ship.new('Submarine', 2)


      cell_1 = Cell.new('A1')
      cell_1.fire_upon

      expect(turn.puts_feedback(cell_1)).to eq("That shot was a miss.")

      cell_1.place_ship(submarine)

      cell_1.fire_upon

      expect(turn.puts_feedback(cell_1)).to eq("That shot was a hit.")

      cell_1.fire_upon

      expect(turn.puts_feedback(cell_1)).to eq("That shot sunk a ship")

    end

    it "can store shots that happen in the game" do
      game = Game.new
      turn = Turn.new(game)

      game.computer_fire

      expect(turn.cells_shot.length).to eq(1)

    end
  end









end
