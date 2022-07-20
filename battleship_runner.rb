require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'


loop do #|index|
  player = Player.new
  player.start
end
