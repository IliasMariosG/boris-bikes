require './lib/bike'

class DockingStation
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end
  def release_bike
    fail 'No bikes available' unless @bikes.count >= 1
    @bikes.pop
  end
  # DockingStation instance docks a Bike instance
  def dock_bike(bike)
    fail 'Docking station full: Cannot accept more than 20 bikes' if @bikes.count >= 20
    @bikes << bike # array of bikes
  end
end
