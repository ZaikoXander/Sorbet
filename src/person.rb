# typed: strict

require 'sorbet-runtime'

WhoAmIReturn = T.type_alias { { name: String, age: Integer, lucky_number: Integer } }

class Person
  extend T::Sig

  sig { params(name: String, age: Integer).void }
  def initialize(name, age)
    @name = T.let(name, String)
    @age = T.let(age, Integer)
  end

  sig { params(lucky_number: Integer).returns(WhoAmIReturn) }
  def who_am_i(lucky_number)
    puts "I am #{@name} and I am #{@age} years old."
    puts "My lucky number is #{lucky_number}"

    { name: @name, age: @age, lucky_number: lucky_number }
  end
end

person = T.let(Person.new('John', 20), Person)

puts person.who_am_i(42)
