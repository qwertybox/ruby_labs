def twice(&my_block)
  my_block.call
  my_block.call
end
# the same as this
def twice
  yield # the same as my block call
  yield
end
def give(&my_block)
  my_block.call("2 turtle doves", "1 partridge")
end
# equal logic
def give
  yield "2 turtle doves", "1 partridge"
end
# Блоки Ruby, умещающиеся в одну строку,
# должны быть заключе- ны в фигурные скобки.
# Блоки, занимающие несколько строк,
# должны заключаться в do...end
def run_block
  yield
end
run_block do
  puts "do/end"
end
run_block { puts "braces" }