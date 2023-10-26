# typed: strict

require 'sorbet-runtime'

extend T::Sig

sig { params(width: Integer, height: Integer).returns(Integer) }
def calculate_rectangle_area(width, height)
  T.let(width * height, Integer)
end

width = T.let(5, Integer)
height = T.let(10, Integer)
area = T.let(calculate_rectangle_area(width, height), Integer)

puts "The area of a rectangle with width #{width} and height #{height} is #{area}"
