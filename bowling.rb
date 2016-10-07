class Frame
  def initialize(score: 0)
    @score = score
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)

    # open frame all the time
    if @rolls.first == 10
      return Frame.new(score: @score + @rolls.reduce(0, :+) + @rolls.drop(1).reduce(0, :+)) if @rolls.count == 3
    else
      return Frame.new(score: @score + @rolls.reduce(0, :+)) if @rolls.count == 2
    end

    self
  end

  def score
    @score
  end
end

class Game
  def initialize
    @last_frame = Frame.new
  end

  def roll(pins)
    @last_frame = @last_frame.roll(pins)
  end

  def score
    @last_frame.score
  end
end