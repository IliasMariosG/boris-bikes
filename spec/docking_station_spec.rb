require 'docking_station'

describe DockingStation do
    it {is_expected.to respond_to :release_bike }
  context 'when a bike is released' do
   it 'is working' do
     bike = Bike.new
     expect(bike).to be_working
   end
  end
  
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  
  it { is_expected.to respond_to(:bike) }
  describe '#dock_bike' do
    it 'docks a bike'do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to eq bike
    end
    it 'raises an error when two bikes are docked' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect { subject.dock_bike(bike) }.to raise_error 'No more than one bike'
    end
  end
  it 'returns a docked bike' do
    bike = Bike.new
    # subject == #<DockingStation:0x00007ffccc1715d0 @bike=#<Bike:0x00007ffccc1715f8>>
    # subject.dock_bike(bike) == #<Bike:0x00007ff35a8b9480>
    subject.dock_bike(bike)
    # subject.bike == #<Bike:0x00007fc1129f53f0>
    expect(subject.bike).to eq bike
  end
  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available' 
    end
    it 'releases a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
  end
end
