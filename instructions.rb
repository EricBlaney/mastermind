

module Instructions


    #creates function for all text formatting options
    def formatting(type, words)
        {
            'underline' => "\e[4;1m#{words}\e[0m",
            'red' => "\e[31;1m#{words}\e[0m",
            'italics' => "\e[3;1m#{words}\e[0m",
            'white' => "\e[1;1m#{words}\e[0m"
        }[type]
    end

    def code_colors(number)
        {
          '1' => "\e[41m  RED  \e[0m ",
          '2' => "\e[44m  BLUE  \e[0m ",
          '3' => "\e[43m  YELLOW  \e[0m ",
          '4' => "\e[42m  GREEN  \e[0m ",
          '5' => "\e[45m  PURPLE  \e[0m ",
          '6' => "\e[101m  PINK  \e[0m ",
        }[number]
    end

    #writes out intro instructions
    def write_instructions
    <<-HEREDOC
    Welcome to #{formatting('underline', 'MASTERMIND')}
    
    In this game you will take the role of either the #{formatting('italics', 'Code Breaker')} or the #{formatting('italics', 'Code Setter.')}
    
    If you choose #{formatting('italics', 'Code Breaker')}, you will be tasked with decoding a four color code based on clues.  The order of the colors matters.
    You will have 15 turns to guess the code.
    A turn looks like this:
    1.  Choose four colors for your guess.
    2.  If any of your colors are in the correct spot, you will be shown a red dot #{formatting('red', '(.)')} for each.
    3.  If any of your colors are correct, but in an incorrect spot, you will be shown a white dot #{formatting('white', '(.)')} for each.
    4.  Repeat.

    If you choose #{formatting('italics', 'Code Setter')}, you will be tasked with creating a code of four colors out of the six options.
    The computer will then try to guess your code in 15 turns. 
    
    Now, please, choose your role by typing one of the following numbers:
    1 - Code Breaker
    2 - Code Setter
    
    HEREDOC
    
    end


    def code_maker

    <<-HEREDOC

        You are now the #{formatting('italics', 'Code Setter')}.  Great choice.  
        Please choose four of the following colors.  According to their color code.

        1 - #{code_colors('1')} 
        2 - #{code_colors('2')} 
        3 - #{code_colors('3')} 
        4 - #{code_colors('4')} 
        5 - #{code_colors('5')} 
        6 - #{code_colors('6')}

    HEREDOC
    end


    def code_breaker
        <<-HEREDOC

        You are now the #{formatting('italics', 'Code Breaker')}.  Great choice.  
        A four color code has been generated using the six colors listed below.  You have 15 turns to guess the colors in order.  
        
        Make your guesses using the numbers/color pairs below:

        1 - #{code_colors('1')} 
        2 - #{code_colors('2')} 
        3 - #{code_colors('3')} 
        4 - #{code_colors('4')}
        5 - #{code_colors('5')} 
        6 - #{code_colors('6')}

    HEREDOC
    
    end

end