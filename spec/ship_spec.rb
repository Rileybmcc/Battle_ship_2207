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
end
