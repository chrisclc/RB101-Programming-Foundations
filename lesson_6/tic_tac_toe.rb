

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMP_MARKER = 'O'
player_score = 0
comp_score = 0

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def display_borad(brd)
  system "clear"
  puts "Player is using #{PLAYER_MARKER}, Computer is using #{COMP_MARKER}."
  puts ""
  puts "1    |2    |3"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "----- ----- -----"
  puts "4    |5    |6"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "----- ----- -----"
  puts "7    |8    |9"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initial_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_square(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr)
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(' or ')
  else
    arr[-1] = "or #{arr.last}"
    arr.join(', ')
  end
end

def player_choice!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_square(brd))})"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Invalid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_choice!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_risky_square(line, brd, COMP_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_risky_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = empty_square(brd).sample
  end

  brd[square] = COMP_MARKER
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMP_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def find_risky_square(line, brd, marker)
  if brd.values_at(line[0], line[1], line[2]).count(marker) == 2
    brd.select {|square, marker| line.include?(square) && marker == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def board_full?(brd)
  empty_square(brd).empty?
end

loop do
  board_status = initial_board

  loop do
    display_borad(board_status)

    player_choice!(board_status)
    break if someone_won?(board_status) || board_full?(board_status)

    computer_choice!(board_status)
    break if someone_won?(board_status) || board_full?(board_status)
  end

  display_borad(board_status)

  if someone_won?(board_status)
    prompt "#{detect_winner(board_status)} won!"
  else
    prompt "Tie!"
  end

  player_score += 1 if detect_winner(board_status) == "Player"
  comp_score += 1 if detect_winner(board_status) == "Computer"

  prompt "Player score is #{player_score}, Computer score is #{comp_score}."

  if player_score == 5
    prompt "You are the final winner"
    break
  elsif comp_score == 5
    prompt "You lose."
    break
  end

  prompt "Play agian? (y/n)"
  answer = gets.chomp
  break if answer.downcase != 'y'

end

prompt "Thanks for playing. Good bye!"
