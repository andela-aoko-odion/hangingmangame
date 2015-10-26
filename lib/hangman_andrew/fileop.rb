require "json"

module Hangman

  class FileOp

    def save_to_file(file_name, data)
      File.open(file_name, 'a+'){ |f|
        f.puts data
      }
    end

    def save_game(name, lives, word, scrambled_word, word_index)
      data = { player_name: name,
        word: word,
        lives: lives,
        scrambled_word: scrambled_word,
        word_index: word_index
      }.to_json
      save_to_file('data.json', data)
      return true
    end

    def load_game
      index = gets.chomp.downcase.to_i
      data = load_file('data.json', index)
    end

    def get_session_id
      puts "please Enter Your Game id"
      id = gets.chomp.downcase.strip.to_i
    end

    def restart_session(file_name, index)
        line = load_file("data.json", 0)
        data = JSON.parse(line)
        @name = data["player_name"]
        @lives = data["lives"]
        @scrambled_word = data["scrambled_word"]
        @word_index = data["word_index"]
    end

    def show_saved_games
      fn = File.readlines("data.json")
        fn.each do |line|
          ln = JSON.parse(line)
          p ln["player_name"]  " " ln["lives"] " " ln["scrambled_word"]
        end
    end

    def load_file(file_name, index=nil)
      if index
        line = File.readlines(file_name)[index]
      end
    end

    def get_player_name
      puts " Enter player name"
      name = gets.chomp.downcase
      if name.match /^[A-z]+$/
       name
      else
        puts " Invalid character included enter [a-z] only"
        sleep 2
        get_player_name
      end
    end

  end
end

fop = Hangman::FileOp.new

@name = fop.get_player_name
#puts @name
@lives = 3
@word = "helloworldman"
@scrambled_word = "__ll_w__ld"
@word_index = {"h"=>[0], "e"=>[1], "l"=>[2, 3, 8], "o"=>[4, 6], "w"=>[5], "r"=>[7], "d"=>[9]}

# return an json data of index supplied
data = fop.load_file("data.json", 0)

#save game
 #puts "save was Successful" if fop.save_game(@name, @lives, @word, @scrambled_word, @word_index)

 data
