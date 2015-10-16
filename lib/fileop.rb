require "json"

module Hangman

  class FileOp

    def initialize(engine, view)
      @game_save_file = "crap.json"
      @engine = engine
      @view = view
    end

    def analyze_input(char)
      if @view.words_to_guess.include? char
        @engine.correct_input(char)
      else
        @engine.invalid_input
      end
    end

    def supported_actions(input)
      return true if @view.basic_allowed_actions.keys.include? input
      @input_type = :unsupported
      false
    end

    def save_game
      File.open(@game_save_file, 'a+') do |f|
        f.puts to_h.to_json
      end

      puts my_game_id
    end

    def my_game_id
    "Your game ID is: #{File.readlines(@game_save_file).size - 1}.\n To continue your saved game, enter this id when prompted for a game record"
  end

     def load_game_data(data_line)
    File.readlines('crap.json')[data_line.to_i]
  end

  def load_game(json_data)
    x = JSON.parse(json_data)
    @view.lives = x["lives"]
    @view.words_to_guess = x["words_to_guess"]
    @engine.basic_array = x["basic_array"]
    @engine.game_word = x["game_word"]
    @view.scrambled = x["scrambled"]
  end

  def to_h
    {lives: @view.lives, words_to_guess: @view.words_to_guess, basic_array: @engine.basic_array, game_word: @engine.game_word, scrambled: @view.scrambled}
  end

  end

end
