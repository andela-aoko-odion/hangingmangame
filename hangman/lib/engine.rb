
module Hangman

  class GameEngine

    attr_accessor :game_word, :basic_array

    def initialize(view)
      @view = view
    end

    def index_of(char)
    @basic_array[char]
  end

  def create_word_array
    @basic_array = Hash.new
    words_array.each_with_index{ |val, index|
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
  @view.decrement_count
    puts "Incorrect!".green + " guessed " + " #{@view.lives} guesses left".green
    puts "You lost, WORD was #{@game_word} " if @view.lives <= 0
    @status= :wrong
  end

  def correct_input(char)
    @words_to_guess.delete(char)

    puts "Correct! keep guessing".green unless @view.game_won
    puts "Congratulations. You have won" if @view.game_won

    index_of(char).each{ |i|
      @view.scrambled[i] = char
    }
  @status= :correct
  end

    def pick_random_word_from_dictionary
      upper_limit = File.readlines('5desk.txt').size
      @game_word = File.readlines('5desk.txt')[rand(upper_limit)].chomp.downcase
    end

    def generate_random_word
      begin
        pick_random_word_from_dictionary
      end until(word_is_valid?)
      game_word
    end

    def length_of_word
      @game_word.length
    end

    def word_is_valid?
      true if length_of_word >= 5 && length_of_word < 12
    end

  end

end
