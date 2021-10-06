class Vehicle
  attr_accessor :odometer
  attr_accessor :gas_used
  def accelerate
    puts "speed up"
  end
  def sound_horn
    puts "Beep! Bepp!"
  end
  def steer
    puts "Turn front 2 wheels."
  end
  def mileage
    return @odometer / @gas_used
  end
end
class Car < Vehicle
end
class Truck < Vehicle
  attr_accessor :cargo
  def load_bed(contents)
    puts "Securing #{contents} in the truck bed."
    @cargo = contents
  end
end
class Motorcycle < Vehicle
  def steer
    puts "Turn front wheel"
  end
end
truck1 = Truck.new
truck1.accelerate
truck1.sound_horn
truck1.load_bed("balls")
car = Car.new
Motorcycle.new.sound_horn #what happens with memory here? Garbage Collection?
puts car.instance_variables
car.gas_used = 555
car.odometer = 22222
puts car.instance_variables
# наследуются методы экземпляра, а не переменные
# Следите за тем, чтобы имена переменных
# в вашей программе соответствовали именам методов доступа к атрибутам.
moto = Motorcycle.new
moto.steer
# переопределение методов
# можно наследовать от субклассов субкласс может иметь собственные субклассы
# колличество наследований неограничено
# обычно берут до 2 наследований
