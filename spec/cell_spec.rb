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






end
