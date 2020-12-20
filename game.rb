
require './instructions'



class Game
attr_reader :play_style
    include Instructions
    

    def play
        puts write_instructions
        @play_style = gets.chomp
        
        
        if @play_style == "1"
            puts code_breaker
        elsif @play_style == "2"
            puts code_maker
        else
        puts "Invalid option."
        exit
        end
        return @play_style
    end


    def code_make_game
        @@color = []
        puts "What is your first color?"
        @@color[0] = gets.chomp.to_i
        puts "What is your second color?"
        @@color[1] = gets.chomp.to_i
        puts "What is your third color?"
        @@color[2] = gets.chomp.to_i
        puts "What is your fourth color?"
        @@color[3] = gets.chomp.to_i
        @@color.each { |val|
            next if val > 0 && val < 7
            puts "You have entered an invalid code, try again."
            exit
        }
        return "#{code_colors(@@color[0].to_s)} #{code_colors(@@color[1].to_s)} #{code_colors(@@color[2].to_s)} #{code_colors(@@color[3].to_s)}"
    end


    def code_guess_game
        @@color_guess = []
        puts "What is your first color?"
        @@color_guess[0] = gets.chomp.to_i
        puts "What is your second color?"
        @@color_guess[1] = gets.chomp.to_i
        puts "What is your third color?"
        @@color_guess[2] = gets.chomp.to_i
        puts "What is your fourth color?"
        @@color_guess[3] = gets.chomp.to_i
        @@color_guess.each { |val|
            next if val > 0 && val < 7
            puts "You have entered an invalid code, try again."
            return 0
        }
        return "#{code_colors(@@color_guess[0].to_s)} #{code_colors(@@color_guess[1].to_s)} #{code_colors(@@color_guess[2].to_s)} #{code_colors(@@color_guess[3].to_s)}"
    end

    def random_code_generator
        @@color = []
        @@color[0] = rand(6) + 1
        @@color[1] = rand(6) + 1
        @@color[2] = rand(6) + 1
        @@color[3] = rand(6) + 1
        return "#{code_colors(@@color[0].to_s)} #{code_colors(@@color[1].to_s)} #{code_colors(@@color[2].to_s)} #{code_colors(@@color[3].to_s)}"
    end

    def guess_checker
        @@color_check_array = @@color
        remaining_values = []
        correct_index_array = []
        num_correct_color = 0
        num_correct_space = 0

        #checks for perfect matches
        @@color_guess.each_with_index { |value,index|
            if value == @@color_check_array[index]
                num_correct_space += 1
                correct_index_array = correct_index_array.push(index)
            else
                remaining_values = remaining_values.push(value)
            end
        }        



        #checks for number of correct colors.  
        @@color_check_array.each_with_index { |value,index|
            next if correct_index_array.include?(index)

            if remaining_values.include?(value) == true
                num_correct_color += 1
                remaining_values.delete_at(remaining_values.index(value))
            end
            
        }




        #returns feedback based on different situations


            return [num_correct_space,num_correct_color]



    end

    def comp_guess(num_correct_space,num_correct_color)
        remaining_values = []
        correct_index_array = []
        if num_correct_space == 0 && num_correct_color == 0
            @@color_guess = []
            @@color_guess[0] = rand(6) + 1
            @@color_guess[1] = rand(6) + 1
            @@color_guess[2] = rand(6) + 1
            @@color_guess[3] = rand(6) + 1
            return "#{code_colors(@@color_guess[0].to_s)} #{code_colors(@@color_guess[1].to_s)} #{code_colors(@@color_guess[2].to_s)} #{code_colors(@@color_guess[3].to_s)}"
        elsif num_correct_space > 0
            @@color_guess.each_with_index { |value,index|
                if value == @@color_check_array[index]
                    num_correct_space += 1
                    correct_index_array = correct_index_array.push(index)
                else
                    remaining_values = remaining_values.push(value)
                end
            }       
            
            i = 0
            while i < 4
                @@color_guess[i] = rand(6) + 1 unless correct_index_array.include?(i)
                i += 1
            end
            return "#{code_colors(@@color_guess[0].to_s)} #{code_colors(@@color_guess[1].to_s)} #{code_colors(@@color_guess[2].to_s)} #{code_colors(@@color_guess[3].to_s)}"
        end



        
    end


end



