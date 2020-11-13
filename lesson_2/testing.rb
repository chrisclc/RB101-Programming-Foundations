VALID_CHOICES = %w(rock paper scissors lizard spock)

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
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

prompt('Welcome to Rock Paper Scissors Lizard Spock.')

user_score = 0
comp_score = 0
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

  if win?(user_input, computer_choice)
    user_score += 1
  elsif win?(computer_choice, user_input)
    comp_score += 1
  end

  prompt("Your score is #{user_score}; Computer score is #{comp_score}.")
  break if user_score == 5 || comp_score == 5
end
prompt('Goodbye.')
