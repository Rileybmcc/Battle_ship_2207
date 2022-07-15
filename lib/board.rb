require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells

  def initialize

    @cells = { "A1" => Cell.new("A1"),
              "A2" => Cell.new("A2"),
              "A3" => Cell.new("A3"),
              "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"),
              "B2" => Cell.new("B2"),
              "B3" => Cell.new("B3"),
              "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"),
              "C2" => Cell.new("C2"),
              "C3" => Cell.new("C3"),
              "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"),
              "D2" => Cell.new("D2"),
              "D3" => Cell.new("D3"),
              "D4" => Cell.new("D4")
            }
  end

  def valid_coordinate?(data)
    @cells.keys.include?(data)
  end

  # def all_empty(input)
  #   if input.map { |cell| @cells[cell].empty? }.uniq.count == 1
  #     if input.map { |cell| @cells[cell].empty? }.uniq == true
  #       true
  #     else
  #       false
  #     end
  #   else
  #     false
  #   end
  # end
  # all_empty(input)  #

  def valid_placement?(ship_type, input)
    numz = "1234"
    letters = "ABCD"
    if ship_type.length == input.count

      if input.map { |cell| @cells[cell].empty? }.uniq.count == 1 && input.map { |cell| @cells[cell].empty? }.uniq == [true]

        if input.count == 2

          if input[0][0] == input[1][0] && numz.include?(input[0][1].concat input[1][1])
            true
          elsif input[0][1] == input[1][1] && letters.include?(input[0][0].concat input[1][0])
            true
          else
            false
          end

        elsif input.count == 3

          if input.map { |cell| cell[0] }.uniq.count == 1 && numz.include?(input[0][1].concat input[1][1].concat input[2][1])
            true
          elsif input.map { |cell| cell[1] }.uniq.count == 1 && letters.include?(input[0][0].concat input[1][0].concat input[2][0])
            true
          else
            false
          end
        end
      else
        false
      end
    else
      false
    end
  end

  def place(ship_type, input)

    if valid_placement?(ship_type, input)
      # require "pry"; binding.pry
      input.each { |coord| @cells[coord].place_ship(ship_type)}
      true

    else
      false
    end
  end

  def render(visible = false)
    # require "pry"; binding.pry
    "  1 2 3 4 \nA #{@cells["A1"].render(visible)} #{@cells["A2"].render(visible)} #{@cells["A3"].render(visible)} #{@cells["A4"].render(visible)} \nB #{@cells["B1"].render(visible)} #{@cells["B2"].render(visible)} #{@cells["B3"].render(visible)} #{@cells["B4"].render(visible)} \nC #{@cells["C1"].render(visible)} #{@cells["C2"].render(visible)} #{@cells["C3"].render(visible)} #{@cells["C4"].render(visible)} \nD #{@cells["D1"].render(visible)} #{@cells["D2"].render(visible)} #{@cells["D3"].render(visible)} #{@cells["D4"].render(visible)} \n"
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
