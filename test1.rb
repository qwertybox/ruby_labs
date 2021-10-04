def summa (arg1, arg2)
  arg1 + arg2 #we have nbo need to use return here
end
input = summa(1,3)
puts input #returns 1+3 = 4
#return is used when we need to break code execution for example
def mileage(miles_driven, gas_used)
  if gas_used == 0 #    Если бензин еще не расходовался...
    return 0.0 # we just return this value
  end
  miles_driven / gas_used
end
puts mileage(0,0)
