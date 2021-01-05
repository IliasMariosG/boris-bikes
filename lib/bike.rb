class Bike
  attr_accessor :broken
  
  # def initialize
  #   @broken = false
  # end
  def working?
    if !broken?
      @broken = false
      true
    else
      false
    end
  end
  def working?
   !@broken
  end
  def report_broken
   @broken = true
  end
  def broken? 
    @broken
  end
end

# bike = Bike.new
# bike.report_broken
# p bike.broken?
# p bike.working?