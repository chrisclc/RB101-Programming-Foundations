#1
nothing to happen
#return is nil

#2
{:a=>"hi there"}

#3
#3.1
one is: one
two is: two
three is: three

#3.2
one is: one
two is: two
three is: three

#3.3
one is: two
two is: three
three is: one

#4
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end