require 'simplecov'
SimpleCov.start

require 'docking_station'

describe DockingStation do
    it {is_expected.to respond_to :release_bike }
  
   it 'is working when it is released' do
      bk = double("Bike", :working? => true)
      
      allow(bk).to receive(:working)
      expect(bk).to be_working
      #expect(bike).to be_working
      # bike.broken? -> nil
      allow(bk).to receive(:broken?).and_return nil
      expect(bk.broken?).to eq nil    
      # or
      # expect(bk.broken?).to be_falsey    
      
      # expect(bike.broken?).to be_falsey
   end
  
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  
  #it { is_expected.to respond_to(:bikes) }
  describe '#dock_bike' do
    it 'raises an error when trying to dock 21 bikes' do
      double :bike
      
      20.times { subject.dock_bike double(:bike) }
      
      expect { subject.dock_bike double(:bike) }.to raise_error 'Docking station full: Cannot accept more than 20 bikes'
    end
    it 'returns a docked bike' do
      bke = double("Bike", :working? => true)
      
      subject.dock_bike(bke)
      
      expect(subject.release_bike).to eq bke
    end
    it 'raises an error when full' do
      double(:bike)
      
      subject.capacity.times { subject.dock_bike(double(:bike)) }
      
      expect { subject.dock_bike(double(:bike)) }.to raise_error 'Docking station full: Cannot accept more than 20 bikes'
    end
    it 'allows user to dock a returning broken bike' do
      bike_double = double("bike")
      allow(bike_double).to receive(:report_broken)
      bike_double.report_broken

      actual = subject.dock_bike(bike_double)
      expected = [bike_double]
      
      allow(bike_double).to receive(:broken?).and_return true
      expect(bike_double).to be_broken
      expect(actual).to eq expected
    end
    it 'allows user to dock a returning working bike' do
      bike_double_again = double('bike')

      allow(bike_double_again).to receive(:working?).and_return true
      expect(bike_double_again).to be_working
      allow(bike_double_again).to receive(:broken?).and_return false 
      expect(bike_double_again).not_to be_broken
      expect(subject.dock_bike(bike_double_again)).to eq [bike_double_again]
    end
  end
  describe '#release_bike' do
    it 'releases a bike after it docks one' do
      practicing_doubles = double('bike', :working? => true)
      
      subject.dock_bike(practicing_doubles)
      
      expect(subject.release_bike).to eq practicing_doubles
    end
    it 'raises an error when there are no bikes available and it tries to release one straightaway' do
      expect { subject.release_bike }.to raise_error 'No bikes available' 
    end
    
  end
  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  it 'does not release bike if broken' do
    y = double('bike', :report_broken => true)
    
    allow(y).to receive(:report_broken)
    y.report_broken
    
    subject.dock_bike(y)
    
    allow(y).to receive(:broken?).and_return true
    expect(y).to be_broken
    allow(y).to receive(:working?).and_return false
    expect(y).not_to be_working
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
