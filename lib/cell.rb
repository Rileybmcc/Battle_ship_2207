class Cell
  attr_reader :coordinates,
              :ship

  def initialize(coordinates)
    @coordinates = coordinates
    @ship = nil
  end

  def empty?
    @ship == nil
  end

end
