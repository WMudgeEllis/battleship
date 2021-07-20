class Turn
  attr_reader :shots
  attr_accessor :game
  def initialize(game)
    @game = game
    @cells_shot = []
  end

  def record_shot(cell_object)
    @cells_shot << cell_object
  end

  def feedback
    x = @cells_shot[-2..-1]
    puts_feedback(x)
  end

  def puts_feedback(cell)
    if cell.render == 'M'
      "That shot was a miss."
    elsif cell.render == 'H'
      "That shot was a hit."
    elsif cell.render == 'X'
      "That shot sunk a ship"
    end
  end

end
