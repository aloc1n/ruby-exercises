require 'pry'

class Eel
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name
    p "just another eel"
  end
end
