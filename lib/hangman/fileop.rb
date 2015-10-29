require "json"
require "colorize"
require_relative "message"

module Hangman

  module FileOp

    def load_game
      index = gets.chomp.to_i
      data = load_file('data.json', index)
    end

    def save_file(file_name, data)
      File.open(file_name, 'a+') do |f|
        f.puts data
      end
    end

    def load_file(file_name, index=nil)
      if index
        line = File.readlines(file_name)[index]
        return data = JSON.parse(line)
      end
    end

    def delete_line(ln)
      str = ""
      f = File.open("data.json", 'r+')
      line = f.readlines.each_with_index do |line, index|
        str += line if index != ln
      end
      str
    end

    def write_data(data)
      f = File.open("data.json", "w")
      f.write(data)
      f.close
      true
    end

    def get_player_name
      puts "username: "
      name = gets.chomp.downcase
      if name.match /^[A-z]+$/
        return name
      else
        puts "invalid character [a-z] only"
        sleep 2
        get_player_name
      end
    end

  end
end
