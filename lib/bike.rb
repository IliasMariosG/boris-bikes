class Bike
  def working?
    if broken? == nil
      true
    else
      false
    end
  end
  def report_broken
   @broken = true
  end
  def broken? 
    @broken
  end
end
