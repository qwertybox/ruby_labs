class Animal
  attr_reader :name, :age
  def name=(value) if value == ""
                     raise "Name can't be blank!" end
  @name = value end
  def age=(value) if value < 0
                    raise "An age of #{value} isn't valid!" end
  @age = value
  end
  def talk
    puts "#{@name} says Bark!"
  end
  def move(destination)
    puts "#{@name} runs to the #{destination}."
  end
  def report_age
    puts "#{@name} is #{@age} years old."
  end
end

class Dog < Animal
end
class Cat <Animal
  def talk
    puts "#{@name} says Meow!"
  end
end
class Bird < Animal
  def talk
    puts "#{@name} says Chirp! Chirp!"
  end
end
class Armadillo < Animal
  def move(destination)
    puts "#{@name} unrolls!"
    super
  end end

kittycat = Cat.new
kittycat.name = "Mike"
kittycat.talk
dillon = Armadillo.new
dillon.name = "Dillon"
dillon.move("burrow")
# super - почти тоже самое что и вызов метода
#
class Person
  def greeting
    "Hello!"
  end
end
class Friend < Person
  def greeting
    basic_greeting = super #  вызвали метод из Person
    "#{basic_greeting} Glad to see you!"
  end
end
puts Friend.new.greeting
# Но в одном отношении ключевое слово super отличается от обычного вызова метода:
# если аргументы не указаны, то метод из суперкласса автоматически вызывается
# с теми же аргументами, которые были переданы методу из субкласса.
