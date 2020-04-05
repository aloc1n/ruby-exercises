class Pirate
  attr_reader :name, :job, :booty

  def initialize(name, job="Scallywag")
    @name = name
    @job = job
    @count_curse = 0
    @booty = 0
  end

  def cursed?
    @count_curse >= 3
  end

  def commit_heinous_act
    @count_curse += 1
  end

  def rob_ship
    @booty = 100
  end

end
