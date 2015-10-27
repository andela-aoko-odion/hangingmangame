require "colorize"

module HangmanAndrew

  class Message

    def won
      "Congratulation You won"
    end

    def gameover(gen)
      "Game Over! you losed!"
      "you are hanged, the word was #{gen}"
    end



    def play_msg
      "Press (p) to play, (c) to continue where you left off, (q) to quit the game".green
    end

    def instructions
      "\tHangman Game in Ruby\n \t(p) to play\n \t(c) to continue saved game\n \t(i) to show this help\n".blue
    end

    def saved
      "Your Game data was saved Successfully!"
    end

    def banner
      "\t\t#######################################################\n" \
      "\t\t#                                                     #\n" \
      "\t\t#                    Hangman Game                     #\n" \
      "\t\t#                                                     #\n" \
      "\t\t#                         In                          #\n" \
      "\t\t#                        Ruby                         #\n" \
      "\t\t#######################################################\n" \
        .blue
    end

  end
end
