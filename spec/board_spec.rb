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

  it 'can validate cell coordinates' do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'can place ship on valid cells' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    sub = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(sub, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(sub, ["C1", "B1"])).to eq(false)
    expect(board.valid_placement?(sub, ["B1", "C2"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["B2", "C3", "D4"])).to eq(false)

  end

  it 'can place ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    sub = Ship.new("Submarine", 2)
    board.place(cruiser, ["A1", "A2" "A3"])
    expect(board.cells["A1"].ship == board.cells["A3"].ship).to eq(true)

  end

  it 'cannot place overlapping ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    sub = Ship.new("Submarine", 2)
    board.place(cruiser, ["A1", "A2" "A3"])
    expect(board.valid_placement?(sub, ["A1", "B1"])).to eq(false)

  end

  it 'can render board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    sub = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2" "A3"])
    expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")

  end

end
