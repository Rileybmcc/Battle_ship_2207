require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do

  it 'can create instance of Board' do
    board = Board.new
    expect(board).to be_instance_of(Board)

  end







end
