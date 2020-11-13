SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def prompt(word)
  puts "=>#{word}"
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def detect_result(dealer_cards, player_cards)
  dealer_total = total(dealer_cards)
  player_total = total(player_cards)

  if dealer_total > 21
    :dealer_busted
  elsif player_total > 21
    :player_busted
  elsif dealer_total > player_total
    :dealer
  elsif player_total > dealer_total
    :player
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :dealer_busted
    prompt "Dealer busted! You win."
  when :player_busted
    prompt "You busted! Dealer win."
  when :dealer
    prompt "Dealer win."
  when :player
    prompt "You win."
  when tie
    prompt "Tie."
  end
end

def play_again?
  prompt "Play again? (y/n)"
  answer = gets.chomp
  answer.downcase == 'y'
end

loop do
  prompt "Welcome to twenty-one!"
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You get #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  loop do
    player_move = nil
    loop do
      prompt "Hit or stay? (h/s)"
      player_move = gets.chomp.downcase
      break if ['h', 's'].include?(player_move)
      prompt "Invalid input."
    end

    if player_move == 'h'
      player_cards << deck.pop
      prompt "You hit! Your card are #{player_cards}; total is #{total(player_cards)}."
    end

    break if player_move == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You chose to stay with #{total(player_cards)}."
  end

  prompt "Dealer turn..."

  loop do
    break if total(dealer_cards) >= 17

    prompt "Deal hit."
    dealer_cards << deck.pop
    prompt "Now dealer's cards are #{dealer_cards} with total #{total(dealer_cards)}."
  end

  if busted?(dealer_cards)
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stayed with #{total(dealer_cards)}."
  end

  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="

  display_result(dealer_cards, player_cards)

  break unless play_again?
end

prompt "Goodbye!"
