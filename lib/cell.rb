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

  def render(*ship) #may want to change name, is confusing as it is not a ship. Maybe

    if ship.include?(true) #as written it looks like it will pop out 'S' whenever true is entered. Add empty? to condition?
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
