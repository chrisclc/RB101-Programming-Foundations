def prompt(message)
  puts "=> #{message}"
end

def num_valid?(number)
  number.to_i != 0
end

def operation_to_msg(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('Welcome to Calculator. Please tell me your name:')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt('Please input a valid name.')
  else
    break
  end
end

prompt("Hi, #{name}!")
loop do
  number1 = ''
  loop do
    prompt('Please input the first number.')
    number1 = gets.chomp

    if num_valid?(number1)
      break
    else
      prompt('Please input a valid number')
    end
  end

  number2 = ''
  loop do
    prompt('Please input the second number.')
    number2 = gets.chomp

    if num_valid?(number2)
      break
    else
      prompt('Please input a valid number')
    end
  end

  operation_prompt = <<-MSG
    What operation would you like to perform?
    1. add 
    2. subtract 
    3. multiply 
    4. divide
  MSG
  prompt(operation_prompt)

  operation = ''
  loop do
    operation = gets.chomp
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt('Please choose 1, 2, 3 or 4.')
    end
  end

  prompt("#{operation_to_msg(operation)} the two number...")

  result = case operation
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The answers is #{result}.")

  prompt("Another calculation?('Y' to continue)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for using the calculator. Byebye.')
