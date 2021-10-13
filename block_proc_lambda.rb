# proc - object, block - not object
# block - it's construction
mr = Proc.new { puts "Я мистер прок!" }
ms = Proc.new { puts "Я миссис прок!" }
def hello(p1, p2)
  p1.call
  p2.call
end
hello(mr, ms)
# only one block for one method
# any number of proc can be send to method
#lambda and proc are the same class proc
proc = Proc.new { puts "Я мистер прок!" }
lam = lambda { puts "Я мисс лямбда" }
puts proc.class
puts lam.class
# Лямбда проверяет количество аргументов, которые в нее передаются, прок — нет.
lam = lambda { |x| puts x } # лямбда с одним аргументов
lam.call('Привет!')
#lam.call #- error
proc = Proc.new { |x| puts x }
proc.call # no error
# Проки и лямбды по разному обрабатывают return
def lambda_test
  lam = lambda { return }
  lam.call
  puts 'Лямбда напечатает!'
end
lambda_test #  лямбда не останвливает выполнение метода, прок как раз останавливает
# выполнение метода при вызове ретурн - в этом и есть отличие
def proc_test
  proc = Proc.new { return }
  proc.call
  puts 'Прок не напечатает :('
end
proc_test # ничего не выводит, выполнение остановлено
# Лямбда (lambda) функции — грубо говоря, методы без названия.
# Вместо объявления метода вы как бы записываете его в переменную.
function = lambda { |x| x ** 2 }
puts function.call(15)
lambda = lambda { |arg| puts "I am lambda #{arg}." }
stabby_lambda = -> (arg) { puts "I am also lambda #{arg}." }
lambda.call "Argument"
# I am lambda Argument.
stabby_lambda.call "Argument"
# I am also lambda Argument.
# Lambdas can also be called in multiple ways.
lambda = lambda { |name| puts "Hello #{name}!" }

lambda.call "Ruby"
lambda.("Ruby")
lambda["Ruby"]
lambda.=== "Ruby"
# in action
# &(ampersand) short form for
# calling the method to_proc on the
# variable we stored. Also, & is the one
# responsible for converting a lambda / proc to block.
double_it = -> (num) { num * 2}
puts [1,2,3,4,5].map(&double_it)
# proc - procedure
# Proc.new block
proc = Proc.new { puts "I am proc, New instance of Proc class." }
proc.call
