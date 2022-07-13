require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do

  it 'can create instance of Board' do
    board = Board.new
    expect(board).to be_instance_of(Board)

  end

  it 'has a hash with 16 key/ value pairs' do
    board = Board.new
    # p board.cells
    # require "pry"; binding.pry
    expect(board.cells.count).to eq(16)
    expect(board.cells.keys.include?("C4")).to eq(true)

  end





end
