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

require "test/unit"

class Application
  def self.colors
    @colors = Hash[ "a" => "112233" ]
  end
  
  # another way to write the same code:
  # class << self
  #   def colors
  #     ...
  #   end
  #   
  #   def foo
  #   end
  # end
  
  def initialize(string)
  end
  
  def picture
    picture = Picture.new('string')
  end
  
  def squares
    [Square.new('a')]
  end
end

class Picture
  def initialize(string)
    @string = string
  end
  
  def normalized_string
    @normalized_string = @string.gsub(/[^a-zA-Z]/, "")
  end
  
  def downcased_string
    @downcased_string = @normalized_string.downcase
  end
  
  def characters
    @characters = @downcased_string.split(//)
  end
  
  def squares
    @squares = @characters.each { |char| Square.new(char) }
  end
end

class Square
  def initialize(char)
    @char = char
  end
  
  def color
    Application.colors[@char]
  end
end

class ApplicationTest < Test::Unit::TestCase
  def test_colors_returns_a_hash
    color = Application.colors
    assert color.instance_of?(Hash), 'color should be a hash'
  end

  def test_colors_returns_a_hash_containing_a_value_for_a
    color = Application.colors['a']
    assert_equal color, Application.colors['a'], 'color is the color which is assigned to "a"'
  end
  
  def test_creation
    app = Application.new('something')
    assert app, 'app is an instance of Application'
  end
  
  def test_picture_returns_a_picture
    app = Application.new('something')
    instance_of_picture = app.picture
    assert instance_of_picture.instance_of?(Picture), 'the method picture returns an instance of Picture'
  end
  
  def test_squares_returns_an_array_of_squares
    app = Application.new('something')
    assert app.squares.first.instance_of?(Square), 'squares returns an array with an instance of Square'
  end
end

class PictureTest < Test::Unit::TestCase
  def test_creation
    picture = Picture.new('something')
    assert picture, 'picture is an instance of Picture'
  end

  def test_normalized_string_strips_special_chars
    picture = Picture.new('something!')
    assert_no_match /[^a-zA-Z]/, picture.normalized_string, 'string without non alphabetical chars'
    # assert that picture.normalized_string returns a string with "!" stripped off
  end

  def test_normalized_string_downcases
    picture = Picture.new('SOMETHING')
    picture.normalized_string
    assert_no_match /[A-Z]/, picture.downcased_string, 'string without uppercase letters'
  end

  def test_characters_returns_an_array_of_characters_from_the_normalized_string
    picture = Picture.new('something')
    picture.normalized_string
    picture.downcased_string
    assert picture.characters, 'returns an array of all characters contained in "something"'
    # ???
  end

  def test_squares_returns_an_array_of_squares_from_the_characters
    picture = Picture.new('something')
    picture.normalized_string
    picture.downcased_string
    picture.characters
    assert picture.squares.instance_of?(Array), 'returns an array of Square instances, first "s"'
    # assert that picture.squares returns an an array of Square instances where the first one
    # has the letter "s"
    # ???
  end
end

class SquareTest < Test::Unit::TestCase
  def test_creation
    square = Square.new('a')
    assert square, 'square is an instance of Square'
  end

  def test_color_returns_the_color_assigned_to_the_character
    square = Square.new('a')
    assert_equal square.color, Application.colors['a'], 'returns the color which is assigned to "a"'
  end
end