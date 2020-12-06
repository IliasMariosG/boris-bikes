require './lib/bike'

class DockingStation
  attr_reader :bike
  
  def release_bike
    Bike.new
  end
  # DockingStation instance docks a Bike instance
  def dock_bike(bike)
    @bike = bike
  end
end
