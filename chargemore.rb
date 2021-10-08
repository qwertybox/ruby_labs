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
class SalariedEmployee < Employee
  attr_reader :salary
  def initialize(name = "Anonymous", salary = 0.0) self.name = name
   self.salary = salary
  end
  def salary=(salary)
    super
  end
  def print_pay_stub
    pay_for_period = (salary / 365.0) * 14
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end
end
class HourlyEmployee < Employee
  attr_reader :hourly_wage, :hours_per_week
  def initialize(name = "Anonymous", hourly_wage = 0.0, hours_per_week = 0.0) self.name = name
   self.hourly_wage = hourly_wage
   self.hours_per_week = hours_per_week
  end
  def hourly_wage=(hourly_wage)
    # Код проверки и присваивания @hourly_wage
  end
  def hours_per_week=(hours_per_week)
    # Код проверки и присваивания @hours_per_week
  end
  def print_pay_stub
    pay_for_period = hourly_wage * hours_per_week * 2
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end
end
amy = Employee.new
puts amy
amy.print_pay_stub #here are no cents
salaried_employee = SalariedEmployee.new
salaried_employee.name = "Jane Doe"
salaried_employee.salary = 50000
puts salaried_employee
salaried_employee.print_pay_stub

hourly_employee = HourlyEmployee.new
hourly_employee.name = "John Smith"
hourly_employee.hourly_wage = 14.97
hourly_employee.hours_per_week = 30
hourly_employee.print_pay_stub
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
