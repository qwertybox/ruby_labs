class Employee
  attr_reader :name, :salary
  def initialize(name="Margo", salary=3000) # method automatically called after object Employee has been created
    self.name = name # нам не нужно делать проверку, так как мехнизм проверки мы уже реализовали в классе
    self.salary = salary # ключевое слово self обращется к текущему обьекту
  end
  def name=(name)
    if name == ""
      raise "Name can't be blank!" end
  @name = name
  end
  def salary=(salary)
    if salary < 0
      raise "A salary of #{salary} isn't valid!"
    end
    @salary = salary
  end
  def print_pay_stub
    puts "Name: #{self.name}" # хотя здесь можно обходиться без self
    # так как по умолчанию получателем есть текущий обьект
    pay_for_period = (self.salary / 365.0) * 14
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end

  def to_s
    "#{@name}, salary is #{@salary}"
  end
end
amy = Employee.new
puts amy
amy.print_pay_stub #here are no cents
#####
# nil in ruby its the same as null in C#
# все математические операторы передаются в виде методов
puts 6*5
puts 6. * (5)
puts 6/5.0
puts 6. / 5.0
puts 5<6
puts 5. < (6)
#####
k = Employee.new("Alice", 5030)
k.print_pay_stub
# we got error bc salary attr hasn't been initialized
# here we have a special method initialize which is called after object was created by ruby
