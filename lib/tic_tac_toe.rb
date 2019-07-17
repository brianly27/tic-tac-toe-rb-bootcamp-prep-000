WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = input.to_i - 1
end


def move(board, index, value)
  board[index] = value
end

def position_taken?(board, position)
  !(board[position] == " " || board[position] == "" || board[position] == nil)
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
end


def turn(board)
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)

  until valid_move?(board, index) == true
    puts "Please enter a valid move"
    input = gets.strip
    index = input_to_index(input)
  end

  player = current_player(board)
  move(board, index, player)
  display_board(board)
end

def current_player(board)
  if turn_count(board) %2 == 0
    "X"
  else
    "O"
  end
end
