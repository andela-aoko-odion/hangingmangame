require_relative "hangman/version"
require_relative "./game"
module Hangman
extend self
def play
    game = Game.new
    game.play
  end

end
