class TicTacToe

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i-1
    end

    def move(index, piece)
        @board[index] = piece
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{|turn| turn != " "}
    end

    def current_player
        if turn_count.even?
            "X"
        else
            "O"        
        end
        #Or Tenary operator turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Please select a square (1-9):"
        #get user input
        input = gets.strip
        # since all user input comes in as string, convert to interger
        # and subtract 1
        index = input_to_index(input)
        # check to see if valid move
        # if so, let them makes move
        if valid_move?(index)
            token = current_player
            move(index, token) 
        # if not, ask them to choose again
        else
            puts "Please select a vaid answer (1-9)"
            turn
        end    
        display_board
    end

    def won?
        # check to see if the first position in the winning
        # combition is taken
        # then check to see if first position matches the secon,
        # position martches the third
        # return combination if all conditions are met
        WIN_COMBINATIONS.any? do |winning|
            if position_taken?(winning[0]) && @board[winning[0]] == @board[winning[1]] && @board[winning[1]] == @board[winning[2]]
                return winning
        end
    end 
    end

    def full?
        @board.all?{|taken| taken != " "}
    end

    def draw?
        !(won?) && (full?)
    end

    def over?
        won? || full? || draw?
    end

    def winner
        WIN_COMBINATIONS.detect do |win_combo|
          if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
            return "X"
          elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
            return "O"
          else
            nil
          end
        end
    end
    
    def play
        while over? == false
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end
end

# Tic Tac Toe - Array (user tic tac toe):
#     1 | 2 | 3
#     4 | 5 | 6
#     7 | 8 | 9
# counting as a comupeter:
#     0 | 1 | 2
#     3 | 4 | 5
#     6 | 7 | 8
# array of arrays = ested arrays