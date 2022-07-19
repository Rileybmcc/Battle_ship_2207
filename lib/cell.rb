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

  def full_health_cell
    if !empty? && !fired_upon?
      true
    else
      false
    end
  end

  def render(input = false)
    if !empty? && @ship.sunk?
      "X"
    elsif !empty? && fired_upon?
      "H"
    elsif @coordinates_hit == true
      "M"
    elsif full_health_cell == true && input == true
      "S"
    else 
        "."
    end
  end
end
