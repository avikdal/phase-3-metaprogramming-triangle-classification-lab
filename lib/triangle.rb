class Triangle
  attr_reader :l1, :l2, :l3

  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def kind
    valid_triangle
    if l1 == l2 && l2 == l3
      :equilateral
    elsif l1 == l2 || l2 == l3 || l1 == l3
      :isosceles
    else
      :scalene
    end
  end

  def sides_positive_numbers?
    [l1, l2, l3].all? { |num| num > 0 }
  end

  def triangle_inequality?
    l1 + l2 > l3 && l1 + l3 > l2 && l2 + l3 > l1
  end

  def valid_triangle
    raise TriangleError unless sides_positive_numbers? && triangle_inequality?
  end

  class TriangleError < StandardError
  end

end
