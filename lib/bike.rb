class Bike
  attr_accessor :broken
  
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
