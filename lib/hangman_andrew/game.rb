# -*- coding: iso-8859-8 -*-
require_relative 'engine'
require_relative 'input'
require_relative 'logic'
require_relative 'fileop'

module HangmanAndrew
  class Game
    include Engine
    include Input
    include Logic
    include FileOp

    def initialize
      @msg = Message.new
      @status = :on
    end

    def start
      puts "#{@msg.banner}"
      confirm
    end

    def confirm
      puts "#{ @msg.play_msg}"
      entry = input
      case entry
        when "p"
          @lives = 5
          @gen = Generator.new.pick_word
          @scrambled_word = '_' * @gen.length
          play_new(@gen)
        when "q"
          exit
          puts "quit"
        when "c"
        data = restart_session('hangman_andrew/data.json')
        @scrambled_word = data["scrambled_word"]
        @lives = data["lives"]
        @gen = data["word"]

        play_new(data["word"])
        when "i"
          puts "Instructions"
        when "*"
          puts "saving session"
        else
          invalid
      end
    end

    def invalid
      puts "bad"
      confirm
    end

    def play_new(gen)
      find_index = find_index(gen)
        loop do
          puts  @scrambled_word
          puts  @gen
          puts "Enter your guess"
          char = input.strip; actions_allowed.include? char
          check_input(find_index, @scrambled_word, char)
          break if @lives == 0 || analyze_game_input(@scrambled_word, gen)
      end
      puts "you are hanged, the word was #{gen}"
      @lives = 5
      confirm
    end
  end
end
