#1
10.times{|num| puts (" " * num) + "The Flintstones Rock!"}

#2
#can't use + to concatenate string and integer together
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

#3
while divisor > 0 do
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end
#bonus 1: to see if there is any remainder; bonus 2: to set factor as return value

#4
# << mutates the caller but assignment doesn't.

#5
#limit is out of the scope of fib
#use limit as argument or put it in the method.

#6
34

#7
#Pass by reference. The method mutated the caller.

#8
paper

#9
"no"
