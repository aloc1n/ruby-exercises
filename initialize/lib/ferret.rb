require 'pry'

class Ferret
  attr_reader :name

  def initialize(name="")
    @name = name
  end

  def give_name(name)
    @name = name
  end

  def name
    if @name == ""
      p "a ferret has no name"
    else
      p "a ferret's name is #{@name}"
    end
  end
end
