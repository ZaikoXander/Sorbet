# typed: strict

require 'sorbet-runtime'

class Circle
  extend T::Sig

  sig { params( radius: Integer ).void }
  def initialize(radius)
    @radius = T.let(radius, Integer)
  end

  sig { returns(Float) }
  def calculate_area
    Math::PI * @radius.to_f ** 2
  end
end

circle = T.let(Circle.new(5), Circle)

area = T.let(circle.calculate_area, Float)
puts "Area of circle is #{area}"
