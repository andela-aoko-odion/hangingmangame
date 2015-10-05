require "pry"

#binding.pry

def get_word
  arr = ["cat", "leg", "pig", "cup", "bell", "come"]
  word = arr.sample.downcase.strip 
  return word
end


def getchar                                       # Takes input from the player and returns the first character.               
  input = gets.chop.downcase.strip
  return input[0]
end


def valid?(getchar, word) 
 
  if ( word.include?(getchar) && word != "" )
    word.delete!(getchar)
    return true

  elsif ( word.include?(getchar) == false && word != "" )
    return true

  elsif (word == "")
    return false
  end

end


#puts word = get_word
#while true do 
# binding.pry
#c = getchar
 #valid?(c)
#end

puts word = get_word
val = true
while ((c = getchar) != 'z' && val) do
 # binding.pry 
   if c == 'z'
     val = false
 
  elsif valid?(c, word) == true
    val = true 

  elsif valid?(c, word) == false
    puts "you won"
    val = false
  end
 
end


#valid?(getchar,word) 
#count = 4
#val = true 

#while (count > 0 && val) do 
#binding.pry
#  c = getchar 

#  if valid?(c, word)
#    puts "Wrong Input: #{c}"
    
#  else  valid?(c, word)
#    puts "You Win"
#    val = false

#  end
#  count -= 1
#end

#count = 4
#val = true
#puts word = get_word 

#uni_word = word
#uni_word.uniq!

#while(count >= 0 && val) do
#  binding.pry
#  puts name = "o"
#  c  = getchar
  #if valid?(c, word)
#  if ( c == 'o')
#   puts "You win"
#    val = false

#  else 
#    puts "try again"
#  end
  #else
   # puts "You won the Game Genius!" 
   # val = false
  #puts "hello"
  #end
# count -= 1

#end 
