
class Animal
  attr_reader :name, :age
  def name=(value)
    if value == ""
      raise "Name can't be blank!"
    end
  @name = value
  end
  def age=(value)
    if value < 0
      raise "An age of #{value} isn't valid!"
    end
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
  def to_s #redefination of to_s method
    "#{@name} the dog, age #{age}"
  end
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
lucy = Dog.new
lucy.name = "Lucy"
lucy.age = 4
rex = Dog.new
rex.name = "Rex"
rex.age = 2
puts lucy.to_s, rex.to_s
puts lucy, rex #the same as above
puts Animal.superclass #object - superclass for all classes (C# the same)
puts rex.instance_variables # returns list of variables in this object
puts lucy.inspect # преобразует в строку для отладки
