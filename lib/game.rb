require "colorize"
require_relative "./engine"
require_relative "./fileop"


module Hangman

  class Game

    attr_accessor :input_type, :scrambled, :lives, :words_to_guess

    def initialize
      @engine = Engine.new(self)
      @file_op = FileOp.new(@engine, self)
    end

    def setup
      @words_to_guess = @engine.generate_random_word
      @scrambled = "_" * @engine.word_length
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


    def start
      banner
      puts "\n\n"
      puts "How would you like to start? \n(n) or new for new game, \n(l) or load for load game"
      begin
        puts "Unsupported input\n" if @input_type == :unsupported
        input = gets.chomp.downcase
      end until(@file_op.supported_actions(input))

      send(basic_actions[input])
      puts "Have fun guessing what I have in mind: #{@scrambled}.\nAfter #{@lives} wrong guesses you have lost the game."
    end

    def play
      start
      until won || @lives == 0
        puts " Guess_word : #{@scrambled} "
        word = gets.chomp

        if save_or_quit.keys.include?(word)
          in_actions(word)
          break
        end
        @file_op.analyze_input(word)
      end
    end

    def in_actions(input)
    send save_or_quit[input]
  end

  def basic_actions
    {
      "n" => :setup,
      "new" => :setup,
      "l" => :load_setup,
      "load" => :load_setup
    }
  end

  def save_or_quit
    {
      "*" => :quit
    }
  end

  def quit
    puts "So you want to quit?\nTo save your game enter (s)\n or save or any other keys to completely quit"
    input = gets.chomp

    @file_op.save_to_file if save.keys.include? input
  end

  def save
  {
      "s" => :save_to_file,
      "save" => :save_to_file
    }
  end

  def decrement_life
    @lives -= 1
  end

  def won
    if @engine.chars_left.length == 0
      @game_has_been_won = :won
      true
    end
  end

  def save_id
    print "Please enter your game ID: "
    id = gets.chomp
  end

  def load_setup
    id = save_id
    @file_op.load_game @file_op.load_saved_data(id.to_i)
  end

  end

end
