require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

player = Player.new
until player.end_game == true do
  player = Player.new
  player.start
end
