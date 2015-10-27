require "json"

module HangmanAndrew

  class FileOp

    def initialize(engine, game)
      @save_file = "db.json"
      @engine = engine
      @game = game
    end

    def analyze_input(char)
      if @game.words_to_guess.include? char
        @engine.correct_input(char)
      else
        @engine.invalid_input
      end
    end

    def supported_actions(input)
      return true if @game.basic_actions.keys.include? input
      @input_type = :unsupported
      false
    end

    def save_to_file
      File.open(@save_file, 'a+') do |f|
        f.puts to_h.to_json
      end
      puts my_save_id
    end

    def my_save_id
      "Your game ID is: #{File.readlines(@save_file).size - 1}.\n To continue your saved game, enter this id when prompted for a game record"
    end

     def load_saved_data(data_line)
    File.readlines('db.json')[data_line.to_i]
  end

  def load_game(json_data)
    x = JSON.parse(json_data)
    @game.lives = x["lives"]
    @game.words_to_guess = x["words_to_guess"]
    @engine.basic_array = x["basic_array"]
    @engine.game_word = x["game_word"]
    @game.scrambled = x["scrambled"]
  end

  def to_h
    {lives: @game.lives, words_to_guess: @game.words_to_guess, basic_array: @engine.basic_array, game_word: @engine.game_word, scrambled: @game.scrambled}
  end

  end

end
