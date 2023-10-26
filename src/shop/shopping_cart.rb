# typed: strict

require 'sorbet-runtime'

require_relative 'item'

class ShoppingCart
  extend T::Sig

  sig { void }
  def initialize
    @items = T.let([], T::Array[Item])
  end

  sig { params( item: Item ).returns(Item) }
  def add_item(item)
    @items.push(item)

    item
  end

  sig { returns(Integer) }
  def calculate_total
    total = 0
    @items.each do |item|
      total += item.price
    end

    total
  end
end

item1 = T.let(Item.new('Apple', 10, 3), Item)
item2 = T.let(Item.new('Orange', 5, 1), Item)

cart = T.let(ShoppingCart.new, ShoppingCart)

cart.add_item(item1)
cart.add_item(item2)

total_cost = cart.calculate_total
puts "Total cost: #{total_cost}"
