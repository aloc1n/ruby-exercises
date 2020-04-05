class Bag
  attr_reader :candies

  def initialize
    @candies = []
  end

  def empty?
    return false if candies.size > 0
    true
  end

  def count
    @candies.size
  end

  def <<(candy)
    @candies << candy
  end

  def contains?(candy_type)
    candies.any? do |candy|
      candy.type == candy_type
    end
  end

end
