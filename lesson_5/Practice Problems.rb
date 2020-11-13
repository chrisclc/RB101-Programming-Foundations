#1
arr.sort do |a, b|
  b.to_i <=> a.to_i
end

#2
books.sort_by do |book|
  book[:published]
end

#3
arr1[1][1][3]
arr2[2][:third][0]
arr3[3][:third][0][0]
hsh1['b'][1]
hsh2[:third].key(0)

#4
arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4

#5
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

#6
munsters.each do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end

#7
a => 2
b => [3, 8]

#8
hsh.each do |_, sub_arr|
  sub_arr.each do |str|
    str.chars.each do |word|
    puts word if vowels.include?(word)
    end
  end
end

#9
arr.map do |sub_arr|
  sub_arr.sort do |a, b|
  b <=> a
  end
end

#10
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hsh = {}
  hsh.map do |k, v|
    new_hsh[k] = v + 1
  end
  new_hsh
end

#11
arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end

#12
hsh = {}
arr.each do |element|
  hsh[element[0]] = element[1]
end
hsh

#13
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

#14
hsh.map do |produce, details|
  if details[:type] == 'fruit'
    details[:colors].map do |color|
      color.capitalize 
    end
  elsif details[:type] == 'vegetable'
    details[:size].upcase
  end
end

#15
arr.select do |hsh|
  hsh.all? do |letter, sub_arr|
    sub_arr.all? do |num|
      num.even?
    end
  end
end

#16
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each do |section|
    section.times { uuid += characters.sample }
    uuid += '-' 
  end

  uuid.delete_suffix('-')
end