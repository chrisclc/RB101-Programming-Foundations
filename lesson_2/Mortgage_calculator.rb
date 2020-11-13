def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

puts 'Welcome to Mortgage / Car Loan Calculator'

loan_amount = ''
loop do
  puts 'Please input the loan amount.'
  loan_amount = gets.chomp
  if number?(loan_amount)
    break
  else
    puts 'Please input a valid number.'
  end
end

apr = ''
loop do
  puts 'Please input the Annual Percentage Rate (APR).'
  apr = gets.chomp
  if number?(apr)
    break
  else
    puts 'Please input a valid number.'
  end
end

loan_duration = ''
loop do
  puts 'Please input the loan duration in month.'
  loan_duration = gets.chomp
  if number?(loan_duration)
    break
  else
    puts 'Please input a valid number.'
  end
end

apr_m = (apr.to_f / 100) / 12

monthly_payment = loan_amount.to_f * (apr_m / (1 - (1 + apr_m)**(-loan_duration.to_f)))

puts monthly_payment
