class LeatherChair
  attr_reader :faded
  
  def initialize
    @faded = faded
  end

  def faded?
    @faded
  end

  def expose_to_sunlight
    @faded = "Exposed chairs are faded."
  end
end
