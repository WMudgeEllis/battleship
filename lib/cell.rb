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

  def render(*ship)

    if ship.include?(true)
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
