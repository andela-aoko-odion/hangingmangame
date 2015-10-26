# -*- coding: iso-8859-8 -*-
require_relative 'engine'
require_relative 'input'
require_relative 'logic'


module HangmanAndrew
  class Game
    include Engine
    include Input
    include Logic

    def initialize
      @msg = Message.new
      @lives = 5
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
          @gen = Generator.new.pick_word
          @scrambled_word = '_' * @gen.length
          play_new(@gen)
        when "q"
          exit
          puts "quit"
        when "c"
          puts "continue"
        when "i"
          puts "Instructions"
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
