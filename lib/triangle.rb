class Triangle
  attr_accessor :length_1, :length_2, :length_3

  def initialize (length_1, length_2, length_3)
    @length_1 = length_1
    @length_2 = length_2
    @length_3 = length_3
  end

  def kind
    has_zero_or_negative = (self.length_1 <= 0 || self.length_2 <= 0 || self.length_3 <= 0) ? true : false
    has_invalid_lengths = false

    if self.length_1 + self.length_2 <= self.length_3
      has_invalid_lengths = true
    elsif self.length_2 + self.length_3 <= self.length_1
      has_invalid_lengths = true
    elsif self.length_1 + self.length_3 <= self.length_2
      has_invalid_lengths = true
    end
    
    if has_zero_or_negative || has_invalid_lengths
      raise TriangleError
    elsif self.length_1 == self.length_2 && self.length_2 == self.length_3
      :equilateral
    elsif self.length_1 == self.length_2 || self.length_1 == self.length_3 || self.length_2 == self.length_3
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    # def message
    #   "test"
    # end
  end
end
