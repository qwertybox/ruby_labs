# '(0..5)' => array [0,1,2,3,4,5]
str = '0..5'
arr = (str[0].to_i..str[3].to_i).to_a
p arr
p (str[0]..str[3]).to_a.map(&:to_i)