# float
a = 555/23.0
puts a # нету остатка округляется
puts 24*23
puts 1/2 # резуьтат округляется в младшую сторону
gh = 50000.0
puts gh.class
# при делении если нам важен остаток то не обходимо чтобы хотя бы один операнд был float
# если в числе есть точка значит это float, если нету, то это fixnum
puts format "%3.2f", a