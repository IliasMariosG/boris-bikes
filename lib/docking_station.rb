require './lib/bike'

class DockingStation
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end
  def release_bike
    fail 'No bikes available' if @bikes.count < 1
    #p 'Last removed bike from the docking station:'
    @bikes.pop
    #p ' After removing last bike, bikes array becomes:'
    #p @bikes
    #p 'bikes number before releasing one='
    #p @bikes.count
  end
  # DockingStation instance docks a Bike instance
  def dock_bike(bike)
    fail 'No more than 2 bikes' if @bikes.count >= 2
    # p 'after adding to the docking station, bikes array becomes:'
    @bikes << bike # array of bikes
    # p 'bikes number='
    # p @bikes.count
  end
end
docking_station = DockingStation.new
docking_station.dock_bike("1")
docking_station.dock_bike("2")
docking_station.release_bike
docking_station.dock_bike("3")
docking_station.release_bike
docking_station.dock_bike("4")
docking_station.dock_bike("5")
# docking_station.dock_bike("6")
# docking_station.dock_bike("7")
# docking_station.dock_bike("8")
# docking_station.dock_bike("9")
# docking_station.dock_bike("10")
# docking_station.dock_bike("11")


# docking_station.release_bike
# docking_station.release_bike
# docking_station.release_bike
# docking_station.release_bike
# docking_station.release_bike
# docking_station.release_bike
# docking_station.release_bike
#docking_station.release_bike
#docking_station.release_bike
#docking_station.release_bike
#docking_station.release_bike