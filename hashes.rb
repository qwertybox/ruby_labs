lines = []
File.open("votes.txt") do |file|
  lines = file.readlines end
votes = Hash.new(0)
lines.each do |line|
  name = line.chomp # chomp - удаляет разделитель
  name.upcase!
  votes[name] += 1
end
p votes
class Candidate
  attr_accessor :name, :age, :occupation, :hobby, :birthplace
  def initialize(name, options ={}) # options = {} - означает использовать пустой хеш, если ни один аргумент не передается.
    self.name = name
    self.age = options[:age]
    self.occupation = options[:occupation]
    self.hobby = options[:hobby]
    self.birthplace = options[:birthplace]
  end
end
# обьект хеша можно пропускать, тогда отсутвующему будет назначен обьект хеша по умолчанию nil
candidate = Candidate.new("Amy Nguyen", age: 37, occupation: "Engineer", hobby: "Lacrosse")
p candidate
# Если хеш использует символические имена в качестве ключей,
# литералы хешей позволяют опускать двоеточия (:)
# в символических именах и заменять «ракету» (=>) двоеточием.
# еслм опустить все ключи хеша тогда руби выдаст сообщение об ошибке
# если ни один ключ хеша не передается тогда для руби это означает что аргумент с хешем вообще
# не переадется
p Candidate.new("Amy Nguyen")
p Candidate.new("Carl Barnes", occupation: "Attorney")
# BUT BETTER TO DO LIKE:
class Candidatee
  attr_accessor :name, :age, :occupation, :hobby, :birthplace
  def initialize(name, age:, occupation:, hobby: nil, birthplace: "Sleepy Creek")
    self.name = name
    self.age = age
    self.occupation = occupation
    self.hobby = hobby
    self.birthplace = birthplace
  end
end
p Candidatee.new("Carl Barnes", age: 49, occupation: "Attorney")
#p Candidatee.new("Carl Barnes") # error
Carl = Candidatee.new("Carl Barnes", age: 49, occupation: "Attorney")
Lucy = Candidatee.new("Lucy Barnes", age: 45, occupation: "Attorney")
Carlo = Carl # here we just shared the link to the Carl object in the heap
Carlo.name = "Carlo"
puts Carl.object_id # SAME AS CARLO
puts Lucy.object_id
puts Carlo.object_id # SAME as Carl bc they are the same object