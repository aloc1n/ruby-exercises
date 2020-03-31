require 'pry'

class Beaver
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name
    p "#{@name} the Beaver"
  end
end
