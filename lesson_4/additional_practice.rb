#1
flintstones_hash = {}

flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

#2
ages.values.sum

#3
ages.delete_if { |key, value| value > 100 }

#4
min_age = ages.values.first
ages.each_value do |age|
  if age < min_age
    min_age = age
  end
end

min_age

#5
flintstones.index { |name| name[0, 2] == "Be" }

#6
flintstones.map! { |name| name[0, 3] }

#7
statement = "The Flintstones Rock"

statement_hash = {}
statement_arr = statement.split('')

statement_arr.each do |letter|
  statement_hash[letter] = statement_arr.count(letter)
end

statement_hash.sort.to_h

#8.
1
3

1
2

#9
def titleize (word)
  word_arr = word.split(' ')
  word_arr.map{|value| value.capitalize!}
  word_arr.join(' ')
end

#10
munsters.each do |name, info|
  case info["age"]
  when 0..17
    info["age_group"] = "kid"
  when 18..64
    info["age_group"] = "adult"
  when (65..)
    info["age_group"] = "senior"
  end
end
