require 'docking_station'

describe DockingStation do
    it {is_expected.to respond_to :release_bike }
  context 'when a bike is released' do
   it 'is working' do
     bike = subject.release_bike
     expect(bike).to be_working
   end
  end
  
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  
  it { is_expected.to respond_to(:bike) }
  it 'returns a docked bike' do
    bike = Bike.new
    # subject == #<DockingStation:0x00007ffccc1715d0 @bike=#<Bike:0x00007ffccc1715f8>>
    # subject.dock_bike(bike) == #<Bike:0x00007ff35a8b9480>
    subject.dock_bike(bike)
    # subject.bike == #<Bike:0x00007fc1129f53f0>
    expect(subject.bike).to eq bike
  end
end
