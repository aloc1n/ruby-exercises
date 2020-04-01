require 'pry'

class Dragon
  attr_reader :name, :rider, :color

  def initialize(name, color, rider)
    @name = name
    @rider = rider
    @color = color
    @hungry = true
    @food_count = 0
  end

  def hungry?
    @hungry
  end

  def eat
    @food_count += 1
    @hungry = false if @food_count == 3
  end

end
