require_relative "hangman/version"
require_relative "./view"
module Hangman
extend self
def play
    game = View.new
    game.play_game
  end

end
