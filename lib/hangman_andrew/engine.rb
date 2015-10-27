module HangmanAndrew
module Engine

 class Generator
    def pick
      upper_limit = File.readlines('5desk.txt').size
      word = File.readlines('5desk.txt')[rand(upper_limit)].chomp.downcase
    end

    def pick_word
      while true
        word = pick
        break if word.length > 10 && word.length <= 12
          return word
      end
    end

    end
  end
end
