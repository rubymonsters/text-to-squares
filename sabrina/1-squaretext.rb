# 'mate dateiname' ruft datei mit textmate auf

# puts "Hello!"

# Wertzuweisung
# Variablen sind nicht gebunden an einen Typ
# contents = File.read('lorem_ipsum.txt')
# puts contents

# contents = 4
# puts contents

# reversed = contents.reverse
# contents = contents.reverse
# puts contents

# puts File.read('lorem_ipsum.txt').reverse

# puts is a global method

# content = 42 varable
# Content = 42 global

# def foo
#   content / Content
# end


#class SquareText
 # def to_s
  #  "I'm a square!"
#  end
#end

# puts SquareText.new
#square = SquareText.new
#puts square.to_s

class Animal
  def sound
    "cool generic animal sound"
  end
  def excited_sound
    sound.upcase + "!!!"
  end
  def feed(food)
    puts "I don't like " + food
  end
end

class Dog < Animal
  def sound
    "wuff wuff wuff"
  end
  def feed(food)
    if food == "carrots"
      puts "bah, " + food
    else
      puts "yummy, " + food
    end
    # puts "I like " + food
#    def likes?(food)
#      if food == "carrots"
#        false
#      else
#        true
#      end
     def likes?(food)
#        not food == "carrots"
       food != "carrots"
     end
  end
end

my_pet = Animal.new
puts "My pet says " + my_pet.sound
# system "say " + my_pet.sound
my_dog = Dog.new
puts "My dog says " + my_dog.sound
puts "My dog says " + my_dog.excited_sound

my_pet2 = Dog.new
my_pet2.feed "carrots"
