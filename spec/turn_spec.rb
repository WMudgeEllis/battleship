require "./lib/board"
require "./lib/turn"


RSpec.describe Turn do


  context 'initailze' do
    xit 'exists' do
      turn = Turn.new

      expect(turn).to be_a(Turn)
    end

    it 'can take board as parameter' do
      board = Board.new
      turn = Turn.new(board)


    end


  end

  context 'methods' do

    xit 'can register hit to a cell' do
      board = Board.new
      turn = Turn.new(board)


    end

  end









end
