require './lib/player'
require './lib/ship'
require './lib/board'
require './lib/cell'

RSpec.describe Player do
  it 'does exist' do
    player1 = Player.new
    expect(player1).to be_instance_of(Player)
  end

  it 'can confirm input is a cell' do
    player1 = Player.new
    @comp_board = Board.new
    @player_board = Board.new
    expect(player1.valid_cell?(['B4', 'C1'])).to eq(true)
    expect(player1.valid_cell?(['TT', '4D', 'Cggfgwqjkghdskjl'])).to eq(false)
  end

  it 'can verify computer health' do
    player1 = Player.new
    @comp_cruiser = Ship.new('cruiser', 3)
    @comp_sub = Ship.new('sub', 2)
    expect(player1.computer_health?).to eq(false)
  end

  it 'can verify player health' do
    player1 = Player.new
    @player_cruiser = Ship.new('cruiser', 3)
    @player_sub = Ship.new('sub', 2)
    expect(player1.player_health?).to eq(false)
  end
end
