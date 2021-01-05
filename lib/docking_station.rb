require './lib/bike'

class DockingStation
  attr_accessor :capacity
  attr_reader :bikes

  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  def release_bike
    raise 'No bikes available' unless not_empty?
    raise 'No working bikes available' if broken_bike?
    @bikes.pop
      #fail 'No working bikes available' if @bikes.each { |bike| return bike if !bike.broken?}.broken?
    #fail 'No bikes available' unless not_empty?
    #@bikes.pop
  end
  # DockingStation instance docks a Bike instance
  def dock_bike(bike)
    fail 'Docking station full: Cannot accept more than 20 bikes' if full?
    @bikes << bike # array of bikes
  end

 # private
  def not_empty?
    @bikes.count >= 1
  end
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end
  def broken_bike?
    p !@bikes[-1].working?
  end
end

station = DockingStation.new
bike = Bike.new
station.dock_bike(bike)
bike.report_broken
bike.broken?
station.not_empty?
station.broken_bike?