require 'docking_station'

describe DockingStation do
    it {is_expected.to respond_to :release_bike }
  context 'when a bike is released' do
    it 'is working' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end
end
