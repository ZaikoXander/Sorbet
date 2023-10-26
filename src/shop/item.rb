# typed: strict

require 'sorbet-runtime'

class Item
  extend T::Sig

  @name = T.let(nil, T.nilable(String))
  @price = T.let(nil, T.nilable(Integer))
  @quantity = T.let(nil, T.nilable(Integer))

  sig { params( name: String, price: Integer, quantity: Integer ).void }
  def initialize(name, price, quantity)
    @name = T.let(name, String)
    @price = T.let(price, Integer)
    @quantity = T.let(quantity, Integer)
  end

  sig { returns(String) }
  attr_reader :name

  sig { returns(Integer) }
  attr_reader :price

  sig { returns(Integer) }
  attr_reader :quantity
end

=begin
item = T.let(Item.new('Apple', 10, 3), Item)

puts "Item name: #{item.name}"
puts "Item price: #{item.price}"
puts "Item quantity: #{item.quantity}"
=end
