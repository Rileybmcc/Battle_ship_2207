require './lib/ship'
class Cell
  attr_reader :coordinates,
              :ship

  def initialize(coordinates)
    @coordinates = coordinates
    @ship = nil
    @coordinates_hit = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(name)
    @ship = name

  end

  def fired_upon?
    @coordinates_hit
    
  end
end
