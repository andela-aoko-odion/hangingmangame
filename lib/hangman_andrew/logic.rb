
module HangmanAndrew
  module Logic

    def incorrect_input #(@lives)
      @lives -= 1
      puts "That was wrong, You have #{@lives} chances left"
    end

    def find_index(word)
      word_index = {}
      word.downcase.split('').each_with_index{ |val, ind|
      word_index[val] ||= []
      word_index[val] << ind }
      word_index
    end

    def update_scrambled(find_index, scrambled_word, char) #@lives
      find_index[char].each{ |i|
       scrambled_word[i] = char}
      find_index.delete (char)
        @scrambled_word = scrambled_word
    end

    def check_input(find_index, scrambled_word, char)
      if find_index.keys.include? char
        update_scrambled(find_index, scrambled_word, char)
      else
        incorrect_input
      end
    end

    def analyze_game_input(word_index, gen)
      if word_index == gen
          puts "You win"
          confirm
      end
    end

    def actions_allowed
       {
         '*' => :quit_game,
         '*s' => :save_game
       }
    end


  end
end
