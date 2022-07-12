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

  it 'can place ship on cell' do
    @cell.place_ship(@cruiser)
    expect(@cell.ship.name).to eq("cruiser")
    expect(@cell.empty?).to eq(false)
  end

  it 'can tell if it has been fired upon' do
    @cell.place_ship(@cruiser)
    expect(@cell.fired_upon?).to eq(false)
  end

  it 'cell can be fired upon' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)
  end

  it 'can render cell' do
    expect(@cell.render).to eq('.')

  end

  it 'can render a miss' do
    @cell.fire_upon
    expect(@cell.render).to eq('M')

  end

  it 'can render a hit' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.render).to eq('H')

  end

  it 'can render sunk ship' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    @cell.fire_upon
    @cell.fire_upon
    expect(@cell.ship.sunk?).to eq(true)
    expect(@cell.render).to eq('X')

  end
end
