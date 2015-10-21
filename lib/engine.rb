
module Hangman

  class Engine
    attr_accessor :game_word, :basic_array, :status

    def initialize(game)
      @game = game
    end

    def index_of(char)
    @basic_array[char]
  end

  def create_word_array
    @basic_array = Hash.new
    words_array.each_with_index { |val, index|
    @basic_array[val] ||= []
    @basic_array[val] << index
    }
  end

     def words_array
    @game_word.split('')
  end

  def chars_left
    @words_to_guess ||= words_array.uniq
    @words_to_guess
  end

  def invalid_input
    @game.decrement_life
    puts "Incorrect!".green + " guessed " + " #{@game.lives} guesses left".green
    puts "You lost, WORD was #{@game_word} " if @game.lives <= 0
    @status = :wrong
  end

  def correct_input(char)
    @words_to_guess.delete(char)

    puts "Correct! keep guessing".green unless @game.won
    puts "Congratulations. You have won" if @game.won

    index_of(char).each{ |i|
      @game.scrambled[i] = char
    }
  @status= :correct
  end

    def pick_random_word
      upper_limit = File.readlines('5desk.txt').size
      @game_word = File.readlines('5desk.txt')[rand(upper_limit)].chomp.downcase
    end

    def generate_random_word
      begin
        pick_random_word
      end until(is_word_valid?)
      game_word
    end

    def word_length
      @game_word.length
    end

    def is_word_valid?
      true if word_length >= 5 && word_length < 12
    end

  end
end
