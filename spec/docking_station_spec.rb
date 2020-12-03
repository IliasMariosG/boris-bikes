require 'docking_station'

describe DockingStation do
    it {is_expected.to respond_to :release_bike }
  context 'when bike is working' do
    it 'releases a bike' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end
end
