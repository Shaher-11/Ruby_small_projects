# Only accepts user input 1-9
module Validate
  def number?(obj)
    obj = obj.to_s unless obj.is_a? String
    x = /\A[+-]?\d+(\.\d+)?\z/.match(obj)
    # sets input numbers outside 1-9 to nil to reject
    x = nil if obj.to_i < 1 || obj.to_i > 9
    return obj.to_i unless x.nil?

    x
  end
end

# Structure supporting both players and their actions
class Player
  include Validate    
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def turn
    puts "#{name}, Enter the number of the square you'd like to occupy"
    turn = gets.chomp
    # checks if user inputs a number. if not it restarts this method
    x = number?(turn)
    while x.nil?
      puts "Sorry. That's an invalid entry. Please try again."
      x = self.turn
    end
    x
  end

  attr_reader :name, :symbol
end

# represenation of tic-tac-toe board
class Board
  # if any one of these variables is true the relevant space ((0-8) + 1) is occupied
  def initialize
    @occupied = []
    (0..8).each do |_i|
      @occupied.push(false)
      @one_row = '   |   |   '
      @two_row = +' 1 | 2 | 3 '
      @three_row = '___|___|___'
      @four_row = '   |   |   '
      @five_row = +' 4 | 5 | 6 '
      @six_row = '___|___|___'
      @seven_row = '   |   |   '
      @eight_row = +' 7 | 8 | 9 '
      @nine_row = '   |   |   '
    end
  end

  def stalemate
    unless @occupied.include?(false)
      puts 'Looks like a stalemate. Please, play again.'
      exit!
    end
  end

  def change(num, symb)
    # converts user input to array counting style
    num = (num - 1)
    if @occupied[num] == false
      @occupied[num] = true
      alter_board(num, symb)
    else
      puts "That selection (#{num + 1}) is not available. Please try again."
      false
    end
  end

  def alter_board(num, symb)
    case num
    when 0
      @two_row[1] = symb
    when 1
      @two_row[5] = symb
    when 2
      @two_row[9] = symb
    when 3
      @five_row[1] = symb
    when 4
      @five_row[5] = symb
    when 5
      @five_row[9] = symb
    when 6
      @eight_row[1] = symb
    when 7
      @eight_row[5] = symb
    when 8
      @eight_row[9] = symb

    end
  end

  def display
    puts @one_row
    puts @two_row
    puts @three_row
    puts @four_row
    puts @five_row
    puts @six_row
    puts @seven_row
    puts @eight_row
    puts @nine_row
  end

  # checks all 8 possible win variations for indentical characters
  def check_winner(symb, name)
    counter = 0
    win_var_one = []
    win_var_one.push(@two_row[1], @two_row[5], @two_row[9])
    win_var_one.each do |x|
      counter += 1 if x == symb
    end
    winner(counter, name)

    counter = 0
    win_var_two = []
    win_var_two.push(@five_row[1], @five_row[5], @five_row[9])
    win_var_two.each do |x|
      counter += 1 if x == symb
    end
    winner(counter, name)

    counter = 0
    win_var_three = []
    win_var_three.push(@eight_row[1], @eight_row[5], @eight_row[9])
    win_var_three.each do |x|
      counter += 1 if x == symb
    end
    winner(counter, name)

    counter = 0
    win_var_four = []
    win_var_four.push(@two_row[1], @five_row[1], @eight_row[1])
    win_var_four.each do |x|
      counter += 1 if x == symb
    end
    winner(counter, name)

    counter = 0
    win_var_five = []
    win_var_five.push(@two_row[5], @five_row[5], @eight_row[5])
    win_var_five.each do |x|
      counter += 1 if x == symb
    end
    winner(counter, name)

    counter = 0
    win_var_six = []
    win_var_six.push(@two_row[9], @five_row[9], @eight_row[9])
    win_var_six.each do |x|
      counter += 1 if x == symb
    end
    winner(counter, name)

    counter = 0
    win_var_seven = []
    win_var_seven.push(@two_row[1], @five_row[5], @eight_row[9])
    win_var_seven.each do |x|
      counter += 1 if x == symb
    end
    winner(counter, name)

    counter = 0
    win_var_eight = []
    win_var_eight.push(@two_row[9], @five_row[5], @eight_row[1])
    win_var_eight.each do |x|
      counter += 1 if x == symb
    end
    winner(counter, name)

    false
  end

  def winner(counter, name)
    name = name.upcase
    if counter == 3
      puts "CONGRATULATIONS #{name}. YOU WIN!"
      display
      exit!
    end
  end
end
puts 'Hi, welcome to Tic Toe, Ready!'
puts 'Player One: Enter your name please'
name_one = gets.chomp
player_one = Player.new(name_one, 'X')
puts 'Player Two: Enter your name please'
name_two = gets.chomp
player_two = Player.new(name_two, 'O')

board = Board.new

victory = false
counter = 0
while victory == false
  counter += 1
  checker = false
  if counter.odd?
    while checker == false
      board.stalemate
      board.display
      turn = player_one.turn
      symb = player_one.symbol
      checker = board.change(turn, symb)
    end
    victory = board.check_winner('X', name_one)
  else
    while checker == false
      board.stalemate
      board.display
      turn = player_two.turn
      symb = player_two.symbol
      checker = board.change(turn, symb)
    end
    victory = board.check_winner('O', name_two)
  end
end
