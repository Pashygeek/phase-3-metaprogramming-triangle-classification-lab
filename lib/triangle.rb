class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    raise TriangleError, 'Sides must be larger than 0.' if [side1, side2, side3].any? { |side| side <= 0 }
  end

  def validate_triangle_inequality
    a, b, c = [side1, side2, side3].sort
    raise TriangleError, 'Invalid triangle. The sum of two sides must be greater than the third side.' unless a + b > c
  end

  class TriangleError < StandardError
  end
end
