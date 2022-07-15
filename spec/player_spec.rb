require './lib/player'
require './lib/ship'
require './lib/board'
require './lib/cell'

RSpec.describe Player do
  it 'does exist' do
    player1 = Player.new
    expect(player1).to be_instance_of(Player)
  end
end
