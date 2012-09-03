
# the Application class
#
# - knows all the available colors (this is common class knowledge, so it
#   should be a class method)
# - has a method `picture` which returns an instance of `Picture` created
#   with that string
# - has a method squares which returns the squares from the picture


class Application

  def self.colors
    {   "a" => "antiquewhite","b" => "brown","c" => "chocolate","d" =>"darkorange","e" => "eggshell","f" => "firebrick",
        "g" => "goldenrod","h" => "hotpink","i" => "indian red","j" => "indian red","k" => "khaki","l" => "lightsteelblue",
        "m" => "moccasin","n" => "navajowhite","o" => "olivedrab","p" => "plum","q" => "plum","r" => "rosybrown",
        "s" => "seashell","t" => "tomate","u" => "tomate","v" => "tomate","w" => "tomate","x" => "tomate",
        "y" => "tomate","z" => "tomate"}
  end

  def picture
  end

  def squares
  end
end
# the Picture class
#
# - takes the string as well as a number of row and columns
#   as arguments of the initalize method
# - has a method `normalized_string` which returns a version of the string with
#   everything but A-Za-z stripped off and downcased
# - has a method `characters` which returns all the characters from the
#   normalized string
# - has a method `squares` which returns an array of `Square` instances where
#   each of the squares has one of the characters
class Pictures

end

# the Square class
#
# - takes a letter as an argument of the initialize method
# - has a method `color` which returns the color according to the letter

class Square
end



  # it takes any given string of 250 characters max.
# it strips all characters that are not A-Za-z
# it downcases each character
# it assigns a color to each character (in a-z)
# it converts each instance of any character to
#   a square that has the assigned color
# it outputs a picture of 50x50 squares max.

# candidates for classes:
#
# - Square
# - Picture
# - Application
# (- String)
# (- Color)
# (- Character)

# first goal: command line application that takes a string
# and outputs a list of N color string per line, e.g.
#
# $ ruby text_to_squares.rb
# please enter your poem: our application is already working!
# aaaaaa bbbbbb cccccc dddddd
# eeeeee ffffff 000000 111111
#
# second goal: turn this into an actual web page using those
# css colors

# the Application class
#
# - knows all the available colors (this is common class knowledge, so it
#   should be a class method)
# - has a method `picture` which returns an instance of `Picture` created
#   with that string
# - has a method squares which returns the squares from the picture
#
# the Picture class
#
# - takes the string as well as a number of row and columns
#   as arguments of the initalize method
# - has a method `normalized_string` which returns a version of the string with
#   everything but A-Za-z stripped off and downcased
# - has a method `characters` which returns all the characters from the
#   normalized string
# - has a method `squares` which returns an array of `Square` instances where
#   each of the squares has one of the characters
#
# the Square class
#
# - takes a letter as an argument of the initialize method
# - has a method `color` which returns the color according to the letter