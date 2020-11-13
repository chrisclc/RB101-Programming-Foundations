VALID_CHOICES = %w(rock paper scissors)

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def result(user_input, computer_choice)
  if win?(user_input, computer_choice)
    prompt('You won!')
  elsif user_input == computer_choice
    prompt('Draw!')
  else
    prompt('Computer won!')
  end
end

def prompt(word)
  puts "=> #{word}"
end

prompt('Welcome to Rock Paper Scissors.')

loop do
  user_input = ''
  loop do
    prompt("Choose one : #{VALID_CHOICES.join(', ')}")
    user_input = gets.chomp
    if VALID_CHOICES.include?(user_input)
      break
    else
      prompt("Wrong input.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("Your choice is #{user_input}; Computer choice is #{computer_choice}.")

  result(user_input, computer_choice)

  prompt('Again?(Y/N)')
  response = gets.chomp.downcase

  break if response != 'y'
end
prompt('Goodbye.')
