class Ship
  attr_reader :name, :length

  def initialize(ship_name, length)
    @name = ship_name
    @length = length
  end

  def health
    health = length
  end

  def sunk?
    is_sunk = false
  end
end
