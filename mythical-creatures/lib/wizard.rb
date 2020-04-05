class Wizard
  attr_reader :name, :bearded, :spell_count

  def initialize(name, bearded={:bearded => true})
    @name = name
    @bearded = bearded
    @spell_count = 0
  end

  def bearded?
    @bearded.value?(true)
  end

  def incantation(root_power)
    "sudo #{root_power}"
  end

  def rested?
    @spell_count <= 2
  end

  def cast
    @spell_count += 1
    "MAGIC MISSILE!"
  end

end
