require 'simplecov'
SimpleCov.start
require "./lib/ship"

RSpec.describe Ship do
  it 'can have instance of ship' do
    cruiser = Ship.new('cruiser', 3)

    expect(cruiser).to be_instance_of(Ship)
  end

  it 'can have a name' do
    cruiser = Ship.new('cruiser', 3)

    expect(cruiser.name).to eq("cruiser")
  end


  it 'can access length' do
    cruiser = Ship.new('cruiser', 3)

    expect(cruiser.length).to eq(3)
  end

  it 'can return ship health' do
    cruiser = Ship.new('cruiser', 3)

    expect(cruiser.health).to eq(3)
  end

  it 'can tell if ship has sunk' do
    cruiser = Ship.new('cruiser', 3)

    expect(cruiser.sunk?).to eq(false)
  end

  it 'ship can be hit and lose health' do
    cruiser = Ship.new("cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

  it 'ship can sink' do
    cruiser = Ship.new("cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
  end
end
