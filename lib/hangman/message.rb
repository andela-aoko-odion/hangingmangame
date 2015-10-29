require "colorize"
module Hangman
  class Message

    def wrong_input(lives)
      "wrong Guess entered ".red + " Lives Left: ".green + "#{lives}".white
    end

    def command
      "Quit recieved!!!".red
    end

    def quiting_game
      "Quiting Game ................................... done".green
    end

    def saving_command
        "Save recieved!!!".green
    end

    def save_game_successful
      "Save successful!!!".green
    end

    def game_won
      "Congratulations!!! You Got Saved".green
    end

    def game_lose(word)
      "The Word was :".yellow + " #{word} ".white + " You are hanged!\n".yellow
    end

    def saved_header
      " id Scrambled_word   Lives      Username\n".yellow
    end

    def supply_save_id
      "Enter Game id: ".yellow
    end

    def invalid_game_id
      "invalid Game id".red
    end

    def invalid_name
      "invalid characters! [a-z] only".red
    end

    def guess_word(scrambled_word)
      "Whats your guess? : " + " #{scrambled_word}".yellow
    end

    def start_info
      "[n] start new game [l] load saved game [q] quit game".yellow
    end
    def start_info_2
      "\nRemember !!!".blue + "\n[*] => save [#] => quit\n".blue
    end

    def loading_game
      " Loading saved game ...................................done".green
    end

    def greet_player(player)
      "\nWelcome back #{player}:"
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
