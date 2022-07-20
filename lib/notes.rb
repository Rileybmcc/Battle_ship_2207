#Scaleable Board
#   -Input
#   -Create Cells




#Smart computer
#   -Smart shots
#   -shoot adjacent to hits but not sunks -if consecutive hits continue lines.

def comp_turn
  num_arry = ("1".."4").to_a
  lett_arry = ("A".."D").to_a
  lett_hash = {"A" => 0, "B" => 1, "C" => 2, "D" => 3 }
  wasd = @player_board.cells.keys.select { |coord| @player_board.cells[coord].render == "H" }
  # require "pry"; binding.pry


  # if wasd.count == 2
  #   @wasd_num_1 = wasd[0][1]
  #   @wasd_lett_1 = wasd[0][0]
  #   @wasd_num_2 = wasd[1][1]
  #   @wasd_lett_2 = wasd[1][0]
  #   if @wasd_num_1 == @wasd_num_2
  #     consec_lett_A = lett_arry[[lett_hash[@wasd_lett_1], lett_hash[@wasd_lett_2]].max + 1]
  #     consec_lett_1 = consec_lett_A.concat @wasd_num_1
  #
  #     consec_lett_B = lett_arry[[lett_hash[@wasd_lett_1], lett_hash[@wasd_lett_2]].max - 1]
  #     consec_lett_2 = consec_lett_B.concat @wasd_num_1
  #
  #     consec_hits_1 = [consec_lett_1, consec_lett_2].select { |cell| @player_board.cells.keys.include?(cell) }.shuffle.first
  #     olive_oyl = false
  #     until olive_oyl == true do
  #       consec_hits_1
  #       if @player_board.cells[consec_hits_1].fired_upon? == false
  #         @player_board.cells[consec_hits_1].fire_upon
  #         olive_oyl = true
  #       end
  #     end
  #
  #
  #   elsif wasd_lett_1 == wasd_lett_2
  #
  #     consec_num_1 = @wasd_lett_1.concat ([@wasd_lett_1.to_i, @wasd_lett_2.to_i].max + 1).to_s
  #     consec_num_2 = @wasd_lett_1.concat ([@wasd_lett_1.to_i, @wasd_lett_2.to_i].min - 1).to_s
  #
  #     consec_hits_2 = [consec_num_1, consec_num_2].select { |cell| @player_board.cells.keys.include?(cell) }.shuffle.first
  #     popeye_jr = false
  #     until popeye_jr == true do
  #       consec_hits_2
  #       if @player_board.cells[consec_hits_2].fired_upon? == false
  #         @player_board.cells[consec_hits_2].fire_upon
  #         popeye_jr = true
  #       end
  #     end
  #
  #
  #   end
  #

  if wasd.count == 1
    # require "pry"; binding.pry
    @wasd_num_1 = wasd[0][1]
    @wasd_lett_1 = wasd[0][0]
# require "pry"; binding.pry
    adj1 = @wasd_lett_1.concat ((@wasd_num_1.to_i - 1).to_s)
    adj2 = @wasd_lett_1.concat ((@wasd_num_1.to_i + 1).to_s)
    adj3 = lett_arry[lett_hash[@wasd_lett_1].to_i + 1].concat @wasd_num_1
    adj4 = lett_arry[lett_hash[@wasd_lett_1].to_i - 1].concat @wasd_num_1
    adj_arry = [adj1, adj2, adj3, adj4]

    # pos_adj_shot = adj_arry.select { |coord| player_board.cells.keys.include?(coord) }.shuffle.first
    @swee_pea = false
    until @swee_pea == true do
      currrent_shot = adj_arry.select { |coord| player_board.cells.keys.include?(coord) }.shuffle.first
      # require "pry"; binding.pry
      if @player_board.cells[currrent_shot].fired_upon? == false
        @player_board.cells[currrent_shot].fire_upon
        @swee_pea = true
      end
    end

  else
    keep_looping = true

    until keep_looping == false do
      @rosemary = @player_board.cells.keys.shuffle.first
      if @player_board.cells[@rosemary].fired_upon? == false
        @player_board.cells[@rosemary].fire_upon
        keep_looping = false
      end
    end
  end
end



# def comp_turn
#   keep_looping = true
#
#   until keep_looping == false do
#     @rosemary = @player_board.cells.keys.shuffle.first
#     if @player_board.cells[@rosemary].fired_upon? == false
#       @player_board.cells[@rosemary].fire_upon
#       keep_looping = false
#     end
#   end
#


#New Ships
#   -Input
#   -Add to place ship method
