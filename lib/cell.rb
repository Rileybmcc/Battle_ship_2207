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

  def fire_upon
    @coordinates_hit = true
    if !empty?
      ship.hit

    end
  end

  def render
    if @coordinates_hit == false
      "."
    elsif !empty? && @ship.sunk?
      "X"
    elsif !empty? && fired_upon?
      "H"
    elsif @coordinates_hit == true
      "M"
    end
  end
end
