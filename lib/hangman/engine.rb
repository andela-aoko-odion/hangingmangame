module Hangman
  class Engine

    def pick
      upper_limit = File.readlines('5desk.txt').size
      word = File.readlines('5desk.txt')[rand(upper_limit)].chomp.downcase
    end

    def pick_word
      while true
        word = pick
         return word if word.length > 5 && word.length <= 12
      end
    end

  end
end
