require 'pry'
class Cell
  attr_reader :coordinate, :ship, :fired_upon


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon == true
  end

  def fire_upon
    @fired_upon = true

    if not empty? #can change to single line syntax
      @ship.hit
    end

  end
# && !empty?
  def render(ship_present=false)
    # binding.pry
    if ship_present && !empty? # Dosent pass cell test but passes board test, optional.include? dosent pass cell test but dose pass board
      'S'
    elsif fired_upon? && empty?
      'M'
    elsif fired_upon? && !empty?
      if @ship.sunk?
        'X'
      else
        'H'
      end
    else
      '.'
    end
  end

end
