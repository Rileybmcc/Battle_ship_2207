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
    # user_cruiser = []
    # until user_cruiser.map { |data| @player_board.cells.keys.include?(data) }.uniq == [true]
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
      good_to_go = false
      until good_to_go == true do
      puts @player_board.render
      puts "Enter the squares for the Cruiser (3 spaces):"
      puts "Please enter coordinates from left to right or top to bottom"
      puts "Enter 1st coordinate:"
      user_1 = gets.chomp.upcase
      puts "Enter 2nd coordinate:"
      user_2 = gets.chomp.upcase
      puts "Enter 3nd coordinate:"
      user_3 = gets.chomp.upcase
      user_cruiser = [user_1, user_2, user_3]

        if valid_cell?(user_cruiser) && @player_board.valid_placement?(@player_cruiser, user_cruiser)
          @player_board.place(@player_cruiser, user_cruiser)
          good_to_go = true
        else
          puts "Invalid coordinates. Please try again!"
        end
      end

      good_to_go = false
        until good_to_go == true do
          puts @player_board.render(true)
          puts "Enter the squares for the Submarine (2 spaces):"
          puts "Please enter coordinates from left to right or top to bottom"
          puts "Enter 1st coordinate:"
          user_3 = gets.chomp.upcase
          puts "Enter 2nd coordinate:"
          user_4 = gets.chomp.upcase

          user_sub = [user_3, user_4]
            if valid_cell?(user_sub) && @player_board.valid_placement?(@player_sub, user_sub)
              @player_board.place(@player_sub, user_sub)
              good_to_go = true
            else
              puts "Invalid coordinates. Please try again!"
            end
        end
  end

  def valid_cell?(info)
    info.map { |data| @player_board.cells.keys.include?(data) }.uniq.count == 1 && info.map { |data| @player_board.cells.keys.include?(data) }.uniq == [true]
  end

  def comp_placement
    comp_cruiser_cells = []
    until comp_cruiser_cells.count == 3 && @comp_board.valid_placement?(@comp_cruiser, comp_cruiser_cells) do
      comp_cruiser_cells = []
      comp_cruiser_cells = @comp_board.cells.keys.shuffle.first(3)
    end
    @comp_board.place(@comp_cruiser, comp_cruiser_cells)

    comp_sub_cells = []
    until comp_sub_cells.count == 2 && @comp_board.valid_placement?(@comp_sub, comp_sub_cells) do
      comp_sub_cells = []
      comp_sub_cells = @comp_board.cells.keys.shuffle.first(2)
    end
    @comp_board.place(@comp_sub, comp_sub_cells)
    # puts @comp_board.render(true)  #For testing purposes(not actual gameplay)
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

  def show_boards
    puts "============= COMPUTER BOARD ============="
    puts @comp_board.render #(true) #for testing purposes
    puts "============= PLAYER BOARD ============="
    puts @player_board.render(true)

  end

  def player_turn

  end

  def comp_turn

  end

  def game_loop
    # puts @comp_board.render
    #
    # puts @player_board.render(true)
  end

  def end_message
    "You won"
    "I won!"
end
end
