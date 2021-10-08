class Employee
  attr_reader :name, :salary
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
    puts "Name: #{@name}"
    pay_for_period = (@salary / 365.0) * 14
    puts "Pay This Period: $#{pay_for_period}"
  end

  def to_s
    "#{@name}, salary is #{@salary}"
  end
end
amy = Employee.new
amy.name = "Amy Blake"
amy.salary = 50000
puts amy
amy.print_pay_stub #here are no cents
# nil in ruby its the same as null in C#
# все математические операторы передаются в виде методов