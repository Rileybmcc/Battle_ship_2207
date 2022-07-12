require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  before :each do
    @cruiser = Ship.new('cruiser', 3)
    @cell = Cell.new("B4")
  end


  it 'can make cell instance of Cell' do
    expect(@cell).to be_instance_of(Cell)
  end

  it 'can call on coordinates' do
    expect(@cell.coordinates).to eq("B4")
  end

  it 'can tell if cell has a ship' do
    expect(@cell.ship).to eq(nil)
  end

  it 'can tell if cell is empty' do
    expect(@cell.empty?).to eq(true)
  end

end
