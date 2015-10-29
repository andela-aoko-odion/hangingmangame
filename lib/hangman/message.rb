require "colorize"
module Hangman
  class Message

    def wrong_input(lives)
      "wrong guess you have #{lives} lives left".green
    end

    def command
      " Quit command recieved".blue
    end

    def quiting_game
      "Quiting Game .................................done".blue
    end

    def save_game_successful
      "saving was successful".green
    end

    def game_won
      "Congratulations you Won You Got Saved".green
    end

    def game_lose(word)
      "Sorry you lose word was #{word} You are hanged".blue
    end

    def saved_header
      " id  words_left lives      player name\n".blue
    end

    def supply_save_id
      "please enter game id".blue
    end

    def invalid_game_id
      "invalid Game id".red
    end

    def invalid_name
      " invalid characters! [a-z] only".red
    end

    def guess_word(scrambled_word)
      "Whats your guess? : #{scrambled_word}"
    end

    def start_info
      " [n] new game [l] load saved game "
    end

    def loading_game
      " Loading saved game ............................done".blue
    end

    def greet_player(player)
        " Welcome back #{player}"
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
