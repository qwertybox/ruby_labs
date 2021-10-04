#classes
class Bird
  def talk
    puts "Chirp! Chirp!" end
  def move(destination)
    puts "Flying to the #{destination}."
  end end
class Dog
  def talk
    puts "Bark!" end
  def move(destination)
    puts "Running to the #{destination}."
  end end
class Cat
  def talk
    puts "Meow!" end
  def move(destination)
    puts "Running to the #{destination}."
  end end

bird = Bird.new
dog = Dog.new
cat = Cat.new
bird.move("tree")
dog.talk
bird.talk
cat.move("house")
#local methods: if we set variable inside method it keep till method is not ended it's execution
# object variable @variable, local(method) variable - variable without @
# access methods
class Tower
  def name= (value)
    @name = value
  end
  def name
    @name
  end
  def height=(value)
    @Height = value
  end
  def height
    @Height
  end
  def report_info
    puts "The name of Tower is #{name} and Height is #{height}"
  end
end
Tower1 = Tower.new
Tower1.name = "Piza"
Tower1.height = 566
Tower1.report_info
class TowerCool
  attr_accessor :name, :height #symbolik names, here we defined 4 methods!
  def report_info
    puts "The name of Tower is #{name} and Height is #{height}"
  end
end
Tower2 = TowerCool.new
Tower2.name = "Piza"
Tower2.height = 566
Tower2.report_info
