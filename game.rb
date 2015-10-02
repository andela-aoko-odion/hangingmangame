
####################################################
#   
# This is is the GameEngine of the the hangman Game
#
#
#
####################################################

class GameEngine                                    # game class  start here

  def getchar                                       # Takes input from the player and returns the first character.
    input = gets.chop.downcase.strip                      
    input[0]
  end

  def file_read(file_name)                           # Read a file name passed as argument and return an array object
    dictionary_file = File.open(file_name, "r")
    dictionary = []
    dictionary_file.each do |entry|
      dictionary << entry.to_s
    end
    return dictionary                                # Returns the dictionary as an array
  end


  def write_file(file_name)                          # 
    # Todo: writting to file 
  end

  def file_error(file_discriptor)                    # Checks if a file exist for Reading or writting 
    # if ! file_discriptor.exit? 
      # Todo: 
  end

  def generate_word(difficult)                       # returns a random word for every call, difficulty determine the level
    dictionary = file_read("5desk.txt")              # dictionary contains an array of words
    
    invalid = true
    while invalid
      secret = dictionary.sample.chomp.downcase.strip
     
      if difficulty == 1 && secret.length > 2 && secret.length <= 4        # Beginner                                           
        invalid = false
      elsif  difficulty == 2 && secret.length > 5 && secret.length <= 8    # Intermediate                                       
        invalid = false
      elsif  difficulty == 3 && secret.length > 8  && secret.length <= 12  # Expert                                             
        invalid = false
      end
    end
    return secret
  end

  def dialog?(answer)                                           # it asks the player simple YES or NO question
    if answer == 1
      return true
    elsif answer == 0
      return false
    end

  end
       
  def set_lifline(difficulty)
    if difficulty == 1                              #  returns 6 tries || lifeline for beginner
      return 6                                      
    elsif difficulty === 2                          #  returns 10 tries || lifeline for beginner
      return 10
    elsif difficulty == 3                           #  returns 14 tries || lifeline for beginner 
      return 14
    end
  end



end                                                  # Closes the Game class 
