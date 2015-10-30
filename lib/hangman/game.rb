require "json"
require "colorize"
require_relative "message"
require_relative "fileop"
require_relative "engine"

module Hangman
  class Game
    attr_reader :quit, :status, :player

    def initialize
      @msg = Message.new
      @engine = Engine.new
      @fileop = FileOp.new
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

    def start_actions
      {
        'l' => :load_game,
        'n' => :new_game,
        'q' => :quit_game
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
        @fileop.write_data(@fileop.delete_line(@game_id)) if @game_id
        puts @msg.game_won
        start
      elsif loser
        @fileop.write_data(@fileop.delete_line(@game_id)) if @game_id
        puts @msg.game_lose(@word)
        start
      elsif  @status == :quit
        exit
      end
    end

    def save_game
      @fileop.write_data(@fileop.delete_line(@game_id)) if @game_id
      player = @fileop.get_player_name
      data = { word: @word, lives: @lives, scrambled_word: @scrambled_word, word_index: @word_index, player: player }.to_json
      @fileop.save_file('data.json', data)
      puts @msg.save_game_successful
      exit
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

    def show_saved_sessions
      line_no = []
      print @msg.saved_header
      line = File.readlines("data.json")
      line.each_with_index do |data, indx|
        ln = JSON.parse(data)
        line_no << indx
        p " #{indx}  #{ln["scrambled_word"]}     #{ln["lives"]}         #{ln["player"]}"
      end
      line_no
    end

#continue start
    def continue_start
      @ids = show_saved_sessions
      puts @msg.supply_save_id
      id = gets.chomp.to_i
    end

    def load_game_data
      data = @fileop.load_file("data.json", @game_id)
      @word, @lives, @word_index, @scrambled_word, @status, @player  = data['word'], data['lives'], data['word_index'], data['scrambled_word'], :on, data['player']
      puts @msg.greet_player(@player)
      puts @msg.start_info_2
      play_new(@word, @lives, @word_index, @scrambled_word, @player)
    end

    def continue_game
      @game_id = continue_start
      if  show_saved_sessions.include? @game_id
        load_game_data
      else
        puts @msg.invalid_game_id
        sleep 1
        continue_game
      end
    end

#continue end

# start start
def start_options
{
  'n' => :setup_new_game,
  'l' => :start_loaded,
  'q' => :start_quit
}
end

def setup_new_game
  @word = @engine.pick_word
  @lives, @scrambled_word, @status, @word_index = 5, '_' * @word.length, :on, find_index(@word)
  puts @msg.start_info_2
  play_new(@word, @lives, @word_index, @scrambled_word)
end

def start
  puts @msg.banner
  puts @msg.start_info
  input = gets.chomp
  send start_options[input] if start_options.include?input
end

def start_loaded
  puts @msg.loading_game
  continue_game
end

def start_quit
  puts @msg.quiting_game
  exit
end

def start_invalid
  puts "invalid character".red
  start
end

end
end
