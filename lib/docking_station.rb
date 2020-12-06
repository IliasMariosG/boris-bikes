require './lib/bike'

class DockingStation
  attr_reader :bike
  
  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end
  # DockingStation instance docks a Bike instance
  def dock_bike(bike)
    @bike = bike
  end
end
