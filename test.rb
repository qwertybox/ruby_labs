puts "Hello, welcome to this menu" # adds new line symbol
print "enter your name: " #not adds new line symbol
input = gets #gets - get string method
puts "Welcome #{input}" #(interpolation)
# () not necessary if there are no args
# p input the same as puts input.inspect
# chomp - only for work with strings
p input
name = input.chomp
puts "Welcome #{name}" # no /n symbol at the end
p name
puts 42.class
puts "I've got a random number between 1 and 100."
puts "Can you guess it?"
target = rand(100)+1
num_guesses = 0
remaining_guesses = 10 - num_guesses
#puts remaining_guesses.to_s + " guesses left." to_s method to convert object to string
guessed_it = false
until num_guesses == 10 || guessed_it
  puts "You've got #{10 - num_guesses} guesses left."
  #to_i method to convert object to integer, other not number symbols are ignored,
  # we needn't to remove any string symbols, they will be ignored
  print "Make a guess: "
  guess = gets.to_i
  num_guesses +=1
if guess < target
  puts "Oops. Your guess was LOW."
elsif guess > target
  puts "Oops. Your guess was HIGH."
elsif guess == target
  puts "Good job, #{name}!"
  puts "You guessed my number in #{num_guesses} guesses!"
  guessed_it = true
end
end
if not guessed_it
  puts "Sorry. You didn't get my number. (It was #{target}.)"
end
str1 = "string"
puts str1.to_i
#methods
# rule1 if there are no parameters we not use brackets!
# rule2 idf there are parameters we use brackets
def sum(arg1, arg2)
  print arg1+arg2
end
#not necessary args:
def order_soda(flavor, size = "medium", quantity = 1) #here we use default parameters: size, quantity
  if quantity == 1
    plural = "soda"
  else plural = "sodas"
  end
    puts "#{quantity} #{size} #{flavor} #{plural}, coming right up!"
end
def use_headlights(brightness = "low-beam")
  puts "Turning on #{brightness} headlights"
  puts "Watch out for deer!"
end
#difference between args and params - first are to be send to a method, second are added when the method is defined
