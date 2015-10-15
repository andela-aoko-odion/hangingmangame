require "colorize"
require_relative "./engine"
require_relative "./fileop"


module Hangman

  class View

    attr_accessor :input_type, :scrambled, :lives, :words_to_guess

    def initialize
      @engine = GameEngine.new(self)
      @file_op = FileOp.new(@engine, self)
    end

    def new_game_setup
      @words_to_guess = @engine.generate_random_word
      @scrambled = "_" * @engine.length_of_word
      @lives = 5
      @engine.create_word_array
    end

    def banner
      puts  "\t\t#######################################################\n" \
            "\t\t#                                                     #\n" \
            "\t\t#         Welcome to Hangman Game (version 0.01)      #\n" \
            "\t\t#         The Interesting Version                     #\n" \
            "\t\t#                                                     #\n" \
            "\t\t#          (*) to save or quit game                   #\n" \
            "\t\t#          (n) or (new) to start a new game           #\n" \
            "\t\t#                                                     #\n" \
            "\t\t#######################################################\n" \
        .green
    end


    def begin_game
      banner
      puts "\n\n"
      puts "How would you like to start? \n(n) or new for new game, \n(l) or load for load game"
      begin
        puts "Unsupported input\n" if @input_type == :unsupported
        input = gets.chomp.downcase
      end until(@file_op.supported_actions(input))

      send(basic_allowed_actions[input])
      puts "Have fun guessing what I have in mind: #{@scrambled}.\nAfter #{@lives} wrong guesses you have lost the game."
    end

    def play_game
      begin_game
      until game_won || @lives == 0
        puts " Guess_word : #{@scrambled} "
        word = gets.chomp

        if in_game_actions.keys.include?(word)
          call_in_game_actions(word)
          break
        end
        @file_op.analyze_input(word)
      end
    end

    def call_in_game_actions(input)
    send in_game_actions[input]
  end

  def basic_allowed_actions
    {
      "n" => :new_game_setup,
      "new" => :new_game_setup,
      "l" => :setup_loaded_game,
      "load" => :setup_loaded_game
    }
  end

  def in_game_actions
    {
      "*" => :quit_game
    }
  end

  def quit_game
    puts "So you want to quit?\nTo save your game enter (s)\n or save or any other keys to completely quit"
    input = gets.chomp

    @file_op.save_game if save_game_or_quit.keys.include? input
  end

  def save_game_or_quit
  {
      "s" => :save_game,
      "save" => :save_game
    }
  end

  def decrement_count
    @lives -= 1
  end

  def game_won
    if @engine.chars_left.length == 0
      @game_has_been_won = :won
      true
    end
  end

  def request_game_id
    print "Please enter your game ID: "
    id = gets.chomp
  end

  def setup_loaded_game
    id = request_game_id
    @file_op.load_game @file_op.load_game_data(id.to_i)
  end

  end

end
