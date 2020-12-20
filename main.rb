

#Tuesday work -- 
#Break up code setting into two separate classes.
#Print instructions with color for each of the 8 possibilities.
#Write into game class hwo to take player guesses
#Make class for printing game board after each round with feedback about guesses
#Write algorithm to producess feedback
#Write algorithm to check for winning board
#Write winning method with text
#Write loss method with text

#starts game and takes input whether or not player will be writing the code or solving


require_relative 'game.rb'
require_relative 'instructions.rb'

new_game = Game.new.play

def formatting(type, words)
    {
        'underline' => "\e[4;1m#{words}\e[0m",
        'red' => "\e[31;1m#{words}\e[0m",
        'italics' => "\e[3;1m#{words}\e[0m",
        'white' => "\e[1;1m#{words}\e[0m"
    }[type]
end

if new_game == "2"
    code = Game.new.code_make_game
    puts "Your code is:"
    puts code
    puts "The computer will now attempt to crack the code in 15 guesses."

    i = 0
    num_correct_space = 0
    num_correct_color = 0
    while i < 15
        feedback = []
        puts "The computers is on guess number #{i+1}:"
        code_guess = Game.new.comp_guess(num_correct_space,num_correct_color)
        puts code_guess
        feedback = Game.new.guess_checker
        num_correct_space = feedback[0]
        num_correct_color = feedback[1]
        puts "The computer's feedback is:"
        if num_correct_space == 4
            puts "The computer has cracked the code!"
            exit


        else
           j = 0
           k = 0
           while j < num_correct_space 
                puts formatting('red', '(.)')
                j += 1
            end 


            while k < num_correct_color 
                puts formatting('white', '(.)')
                k += 1
            end
        end


        i += 1
    end

    puts "The computer has exhausted all of its guess attempts.  You win!"
    
elsif new_game == "1"
    code = Game.new.random_code_generator
    i = 0 
    while i < 15
        feedback = []
        puts "You are on guess number #{i+1} out of 15."
        code_guess = Game.new.code_guess_game
        if code_guess == 0
            i -= 1
        else
        puts "You have guessed:"
        puts code_guess
        puts "Your feedback is:"
        feedback = Game.new.guess_checker
        num_correct_space = feedback[0]
        num_correct_color = feedback[1]
            if num_correct_space == 4
                puts "CONGRATULATIONS YOU HAVE CRACKED THE CODE!  WOO!  YAY!  HURRAH!"
                exit
            elsif num_correct_color == 0 && num_correct_space == 0
                puts "There are no matches.  Sorry!  Guess again."
            else
               j = 0
               k = 0
                while j < num_correct_space 
                    puts formatting('red', '(.)')
                    j += 1
                end 

                while k < num_correct_color 
                    puts formatting('white', '(.)')
                    k += 1
                end 
            end
        end
        i += 1
    end

    puts "Unfortunately you have exhausted all of your guess attempts!  Please play again."
    exit

end

