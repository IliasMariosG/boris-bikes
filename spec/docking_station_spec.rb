require 'simplecov'
SimpleCov.start

require 'docking_station'

describe DockingStation do
    it {is_expected.to respond_to :release_bike }
  context 'when a bike is released' do
   it 'is working' do
     bike = Bike.new
     expect(bike).to be_working
     'to be falsey'
     # bike.broken? -> nil
     expect(bike.broken?).to be_falsey
   end
  end
  
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  
  #it { is_expected.to respond_to(:bikes) }
  describe '#dock_bike' do
    it 'raises an error when trying to dock 21 bikes' do
      bike = Bike.new
      20.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error 'Docking station full: Cannot accept more than 20 bikes'
    end
    it 'returns a docked bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when full' do
      bike = Bike.new
      subject.capacity.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error 'Docking station full: Cannot accept more than 20 bikes'
    end
  end
  describe '#release_bike' do
    it 'releases a bike after it docks one' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available and it tries to release one straightaway' do
      expect { subject.release_bike }.to raise_error 'No bikes available' 
    end
    
  end
  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  it 'does not release bike if broken' do
    bike = Bike.new
    bike.report_broken
    
    subject.dock_bike(bike)
    
    expect(bike).to be_broken
    expect(bike).not_to be_working
    expect{ subject.release_bike }.to raise_error "No working bikes available"    
  end
  describe '#initialize' do
    # The commented out lines of code are the unit test implementation of the feature test
    # for a variable capacity
    # let(:bike) { Bike.new }
    # let(:docking_station) { DockingStation.new(50)}
    # it 'has a variable capacity' do
    #   #docking_station = DockingStation.new(50)
      
    #   50.times { docking_station.dock_bike(bike) }
      
    #   expect { docking_station.dock_bike(bike) }.to raise_error 'Docking station full: Cannot accept more than 20 bikes' 
    # end
    let(:bike)  { Bike.new }
    docking_station = DockingStation.new
    it 'defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times do
        docking_station.dock_bike(bike)
      end
      
      expect { docking_station.dock_bike(bike) }.to raise_error 'Docking station full: Cannot accept more than 20 bikes'
    end
  end
end
