class Ship
  attr_reader :name,
              :length,
              # :health,
              :number_of_hits

  def initialize(name, length)
    @name = name
    @length = length
    @number_of_hits = 0
    # @health = @length - @number_of_hits

  end

  def health
    @length - @number_of_hits

  end

  def sunk?
    @health == 0

  end

  def hit
    @number_of_hits += 1
    
  end
end
