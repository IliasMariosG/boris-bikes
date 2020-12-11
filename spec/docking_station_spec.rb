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
  
  it { is_expected.to respond_to(:bikes) }
  describe '#dock_bike' do
    it 'raises an error when trying to dock 21 bikes' do
      bike = Bike.new
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error 'Docking station full: Cannot accept more than 20 bikes'
    end
    it 'returns a docked bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
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
