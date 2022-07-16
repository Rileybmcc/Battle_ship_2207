require './lib/ship'
require './lib/cell'
require './lib/board'

class Player
  attr_reader :comp_board,
              :player_board,
              :comp_cruiser,
              :comp_sub,
              :player_cruiser,
              :player_sub

  def initialize
    @comp_board = Board.new
    @player_board = Board.new
    @comp_cruiser = Ship.new('cruiser', 3)
    @comp_sub = Ship.new('sub', 2)
    @player_cruiser = Ship.new('cruiser', 3)
    @player_sub = Ship.new('sub', 2)

  end

  def player_placement
    puts "I have laid out my ships on the grid.
You now need to lay out your two ships.
The Cruiser is three units long and the Submarine is two units long."
  good_to_go = false
    until good_to_go == true do
      puts @player_board.render
      puts "Enter the squares for the Cruiser (3 spaces):"
      puts "Please enter coordinates from left to right or top to bottom"
      puts "Enter 1st coordinate"
      user_1 = gets.chomp.upcase
      puts "Enter 2nd coordinate:"
      user_2 = gets.chomp.upcase
      puts "Enter 3nd coordinate:"
      user_3 = gets.chomp.upcase
      user_cruiser = [user_1, user_2, user_3]
        if @player_board.valid_placement?(@player_cruiser, user_cruiser)
          @player_board.place(@player_cruiser, user_cruiser)
          good_to_go = true
        else
          puts "Invalid coordinates...try again!"
        end
      end
      good_to_go = false
        until good_to_go == true do
          puts @player_board.render
          puts "Enter the squares for the Submarine (2 spaces):"
          puts "Please enter coordinates from left to right or top to bottom"
          puts "Enter 1st coordinate"
          user_3 = gets.chomp.upcase
          puts "Enter 2nd coordinate:"
          user_4 = gets.chomp.upcase

          user_sub = [user_3, user_4]
            if @player_board.valid_placement?(@player_sub, user_sub)
              @player_board.place(@player_sub, user_sub)
              good_to_go = true
            else
              puts "Invalid coordinates...try again!"
            end
          end
  end

  def start
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    user_input = gets.chomp
    if user_input.downcase == "q"
      p "Fine then...we didn't want to play either"
    elsif user_input.downcase =="p"
      p "Let's play!"


    end
  end
end
