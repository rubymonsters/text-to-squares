
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

  def initialize(entry)
    @entry = entry
  end

  def picture
    Picture.new(@entry,"rows","columns")
  end

  def squares
    picture.squares
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
class Picture
  attr_reader :entry
  
  def initialize(entry, rows, columns) 
    @entry = entry
    @rows = rows
    @columns = columns
  end

  def normalized_string
    @entry.gsub(/[^a-zA-Z]/, '').downcase
  end

  def characters
    normalized_string.split(//)
  end

  def squares
    characters.map { |char| Square.new(char) }
  end

end

# the Square class
#
# - takes a letter as an argument of the initialize method
# - has a method `color` which returns the color according to the letter

class Square

  attr_reader :char

  def initialize(char)
    @char = char
  end

  def color
    Application.colors[@char]
  end
end