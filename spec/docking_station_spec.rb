require 'docking_station'

describe DockingStation do
  context "when starting" do
    it 'responds to #release_bike' do
      expect(subject).to respond_to :release_bike
    end
  end
  context 'when bike is working' do
    it 'releases a bike' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end
end
