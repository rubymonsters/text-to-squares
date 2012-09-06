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

#



require "test/unit"

class Application

  def self.colors
    {   "a" => "antiquewhite","b" => "brown","c" => "chocolate","d" =>"darkorange","e" => "eggshell","f" => "firebrick",
        "g" => "goldenrod","h" => "hotpink","i" => "indian red","j" => "indian red","k" => "khaki","l" => "lightsteelblue",
        "m" => "moccasin","n" => "navajowhite","o" => "olivedrab","p" => "plum","q" => "plum","r" => "rosybrown",
        "s" => "seashell","t" => "tomate","u" => "tomate","v" => "tomate","w" => "tomate","x" => "tomate",
        "y" => "tomate","z" => "tomate"}
  end
  
  def normalise
    @normalised_string = @string.gsub(/[^a-zA-Z]/, '').downcase!
  end
  
  def initialize(string)
    @string = string
  end
  
  def picture
    Picture.new(@string)
  end   
  
  def square
    Square.new(@string)
  end
  # - has a method squares which returns the squares from the picture
end

class Picture
  def initialize(string)
    @string = string
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

class Square
  def initialize(string)
    @string = string
  end
  def color
    sdf
  end
end
#
# the Square class
#
# - takes a letter as an argument of the initialize method
# - has a method `color` which returns the color according to the letter

class ApplicationTest < Test::Unit::TestCase
  def test_colors_returns_a_hash
    color = Application.colors
    assert color.class == Hash, "color should contain hash"
  end

  def test_colors_returns_a_hash_containing_a_value_for_a
    color = Application.colors['a']
    assert_equal color, "antiquewhite", "a should return antiquewhite"
    # assert that color is the color which is assigned to "a"
  end

  def test_creation
    app = Application.new('something')
    assert app.instance_of?(Application), "should return an array"
    # assert that application is an instance of Application
  end

  def test_picture_returns_a_picture
    app = Application.new('something')
    assert app.picture.instance_of?(Picture), 'the method picture returns an instance of Picture'    # assert that the method picture returns an instance of Picture
  end

  def test_squares_returns_an_array_of_squares
    app = Application.new('something')
    assert app.squares.instance_of?(Square), "squares should return an array of squares"
    # assert that application.squares returns an array where the first object is an instance of Square
    # hint: you will need to implement the Picture and Square classes first
    Sven says do it later
    end
  end
end

class PictureTest < Test::Unit::TestCase
  def test_creation
    picture = Picture.new('something')
    assert picture, "there should be a picture created"
    # assert that picture is an instance of Picture
  end

  def test_normalized_string_strips_special_chars
    picture = Picture.new('something!')
    assert picture.normalise == "something"
    # assert that picture.normalized_string returns a string with "!" stripped off
  end

  def test_normalized_string_downcases
    picture = Picture.new('SOMETHING')
    # assert that picture.normalized_string returns a string with "!" stripped off
  end

  def test_characters_returns_an_array_of_characters_from_the_normalized_string
    picture = Picture.new('something')
    # assert that picture.characters returns an array of all characters contained in "something"
  end

  def test_squares_returns_an_array_of_squares_from_the_characters
    picture = Picture.new('something')
    # assert that picture.squares returns an an array of Square instances where the first one
    # has the letter "s"
    # hint: you will need to implement the Square class first
  end
end

class SquareTest < Test::Unit::TestCase
  def test_creation
    square = Square.new('a')
    # assert that square is an instance of Square
  end

  def test_color_returns_the_color_assigned_to_the_character
    square = Square.new('a')
    # assert that square.color returns the color which is assigned to "a"
  end
end
