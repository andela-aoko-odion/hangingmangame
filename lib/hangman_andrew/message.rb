require "colorize"

module HangmanAndrew

  class Message

    def won
      "Congratulation You won"
    end

    def lose
      "Game Over! you losed!"
    end

    def play_msg
      "Press (p) to play, (i) to read instructions, (c) to continue where you left off, (q) to qiut the game".green
    end

    def saved
      "Your Game data was saved Successfully!"
    end

    def banner
      "\t\t#######################################################\n" \
      "\t\t#                                                     #\n" \
      "\t\t#                    Hangman Game                     #\n" \
      "\t\t#                                                     #\n" \
      "\t\t#                         by                          #\n" \
      "\t\t#                  Andrew Oko-odion                   #\n" \
      "\t\t#######################################################\n" \
        .green
    end

  end
end
