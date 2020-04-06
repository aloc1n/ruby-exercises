class Baby
  attr_reader :tired

  def initialize
    @tired = tired
  end

  def tired?
    @tired
  end

  def nap
    @tired = "Naps help combat drowsiness."
  end
end
