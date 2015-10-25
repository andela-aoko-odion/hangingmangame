require "hangman_andrew/version"
require_relative "hangman/game"
require_relative "hangman/fileop.rb"
require_relative "hangman/message.rb"
require_relative "hangman/engine.rb"


module HangmanAndrew
  @game = Game.new
  @game.start
end
