#1
loop do
  puts 'Just keep printing...'
  break
end

#2
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  
  break
end

puts 'This is outside all loops.'

#3
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

#4
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts "yes to stop."
end

#5
say_hello = 0 

while say_hello < 5
  puts 'Hello!'
  say_hello += 1
end

#6
numbers = []

while numbers.length < 5
  numbers << rand(10..100)
end

puts numbers

#7
count = 1

until count > 10
  puts count
  count += 1
end

#8
numbers = [7, 9, 13, 25, 18]
count = 0

until count == numbers.length
  puts numbers[count]
  count += 1
end

#9
for i in 1..100
  puts i if i.odd?
end

#10
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends do
  puts "Hello, #{friend}!"
end 
