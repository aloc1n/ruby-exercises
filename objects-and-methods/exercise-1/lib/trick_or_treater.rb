class TrickOrTreater
  attr_reader :costume, :style, :bag

  def initialize(costume)
    @costume = costume
    @style = style
    @bag = Bag.new
  end

  def dressed_up_as
    @costume.style
  end

  def bag
    @bag
  end

  def has_candy?
    !bag.empty?
  end

  def candy_count
    bag.count
  end

  def eat
    bag.candies.pop
  end

end
