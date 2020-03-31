require 'pry'

class Dog

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def greeting
    p "Woof, I'm #{@name} the #{@breed}!"
  end
end
