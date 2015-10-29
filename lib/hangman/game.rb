require "json"
require "colorize"
require_relative "message"
require_relative "fileop"
require_relative "engine"

module Hangman
  class Game
    attr_reader :quit, :status
    include Hangman::FileOp
    def initialize
      @msg = Message.new
      @engine = Engine.new
    end

    def find_index(word)
      word_index = {}
      word.downcase.split('').each_with_index{ |val, indx|
        word_index[val] ||= []
        word_index[val] << indx
      }
      word_index
    end

    def populate_scramble(word_index, scrambled_word, char)
      word_index[char].each{ |i|
        scrambled_word[i] = char
      }
      word_index.delete(char)
    end

    def winner(word_index)
      word_index.empty?
    end

    def loser
      @lives == 0
    end

    def incorrect_input
      @lives -= 1
      puts @msg.wrong_input(@lives)
    end

    def check_input(word_index, scrambled_word, m)
      wrong_char = []
      if word_index.keys.include? m
        populate_scramble(word_index, scrambled_word, m)
      else
        incorrect_input
      end
    end

    def actions_allowed
      {
        '#' => :quit_game,
        '*' => :save_game
      }
    end

    def quit_game
      @status = :quit
      puts @msg.command
      sleep 1
      puts @msg.quiting_game
      exit
    end

    def analyze_game_input(word_index)
      if winner(word_index)
        write_data(delete_line(@game_id)) if @game_id
        puts @msg.game_won
        start
      elsif loser
        write_data(delete_line(@game_id)) if @game_id
        puts @msg.game_lose(@word)
        start
      elsif  @status == :quit
        exit
      end
    end

    def save_game(game_id=nil)
      write_data(delete_line(@game_id)) if @game_id   # fileop
      @player = get_player_name          # fileop
      data = { word: @word, lives: @lives,
        scrambled_word: @scrambled_word,
        word_index: @word_index, player: @player }.to_json
      save_file('data.json', data)       # fileop
      puts @msg.save_game_successful   # message
      exit
    end

    def show_saved_sessions
      line_no = []
      print print @msg.saved_header
      line = File.readlines("data.json")
      line.each_with_index do |data, indx|
        ln = JSON.parse(data)
        line_no << indx
        p " #{indx}  #{ln["scrambled_word"]}     #{ln["lives"]}         #{ln["player"]}"
      end
      line_no
    end

    def continue_game
      ids = show_saved_sessions
      puts @msg.supply_save_id
      @game_id = gets.chomp
      if ids.include? @game_id.to_i
        data = load_file("data.json", @game_id.to_i)
        @word = data['word']
        @lives = data['lives']
        @word_index = data['word_index']
        @scrambled_word = data['scrambled_word']
        @status = :on
        @player = data['player']
        puts @msg.greet_player(@player)
        play_new(@word, @lives, @word_index, @scrambled_word, @player)
      elsif @game_id == 'q' || @game_id == 'quit'
        start
      else
        puts @msg.invalid_game_id
        sleep 1
        continue_game
      end
    end


    def play(char, word_index, scrambled_word)
      unless actions_allowed.include? char
        check_input(word_index, scrambled_word, char)
        puts scrambled_word
      else
        send actions_allowed[char]
      end
    end

    def play_new(word, lives, word_index, scrambled_word, player_name=nil)
      puts @msg.guess_word(scrambled_word)
      until analyze_game_input(word_index)
        char = gets.chomp
        play(char, word_index, scrambled_word)
      end
    end

    def start
      puts @msg.start_info
      input = gets.chomp
      case input
      when 'n'
        @lives = 5
        @word = @engine.pick_word
        @scrambled_word = scrambled_word = '_' * @word.length
        @status = :on
        @word_index = word_index = find_index(@word)
        play_new(@word, @lives, @word_index, @scrambled_word)
      when 'l'
        puts @msg.loading_game
        continue_game
      when 'q'
        puts @msg.quiting_game
        exit
      else
        puts "invalid entry"
        invalid
      end
    end

    def invalid
      start
    end

  end
end

