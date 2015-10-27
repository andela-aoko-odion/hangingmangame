require "json"

module HangmanAndrew
  module FileOp

    def save_to_file(file_name, data)
      File.open(file_name, 'a+'){ |f|
        f.puts data
      }
    end

    def save_session(name, lives, word, scrambled_word, word_index)
      data = { player_name: name,
        word: word,
        lives: lives,
        scrambled_word: scrambled_word,
        word_index: word_index
      }.to_json
      save_to_file('hangman_andrew/data.json', data)
      return true
    end

    def load_game(file_name)
      index = get_session_id
      data = load_file(file_name, index)
    end

    def show_saved_sessions
      p "id   words_left   lives   player_name"
      line = File.readlines("hangman_andrew/data.json")
        line.each_with_index do |data, indx|
          ln = JSON.parse(data)
          p " #{indx}       #{ln["scrambled_word"]}     #{ln["lives"]}         #{ln["player_name"]}"
        end
    end

    def get_session_id
      puts "please Enter Your Game id"
      id = gets.chomp.downcase.strip.to_i
    end


    def restart_session(file_name)
        show_saved_sessions
        index = get_session_id
        line = load_file(file_name, index)
        data = JSON.parse(line)
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
