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

# $ ruby text_to_squares.rb
# please enter your poem: our application is already working!
# aaaaaa bbbbbb cccccc dddddd
# eeeeee ffffff 000000 111111
#
# second goal: turn this into an actual web page using those
# css colors

require "test/unit"

# The Application class ...
class Application
  # ... knows all the available colors (this is common class knowledge, so it should be a class method) 
  def self.colors
    { 'a' => 112233,
      'b' => 223344,
      'c' => 334455 }
  end
  
  def initialize(string)
    @string = string
  end
  
  # ... has a method `picture` which returns an instance of `Picture` created with that string  
  def picture
    Picture.new(@string)
  end
  
  # ... has a method `squares` which returns the squares from the picture
  def squares
    picture.squares
  end
end

# The Picture class ...
class Picture
  attr_reader :string
  
  # ... takes the string as well as a number of row and columns as arguments of the initalize method
  def initialize(string)
    @string = string
  end
  
  # ... has a method `normalized_string` which returns a version of the string
  #     with everything but A-Za-z stripped off and downcased
  def normalized_string
    @string.gsub(/[^a-zA-Z]/, "").downcase
  end
  
  # ... has a method `characters` which returns all the characters from the normalized string
  def characters
    normalized_string.split(//)
  end
  
  # ... has a method `squares` which returns an array of `Square` instances
  #     where each of them has one of the characters  
  def squares
    characters.map { |char| Square.new(char) }
  end
end

# The Square class ...
class Square
  attr_reader :char
  
  # ... takes a letter as an argument of the initialize method
  def initialize(char)
    @char = char
  end
  
  # ... has a method `color` which returns the color according to the letter
  def color
    Application.colors[@char]
  end
end

class ApplicationTest < Test::Unit::TestCase
  def setup
    @app = Application.new('something')
  end
  
  def test_colors_returns_a_hash
    color = Application.colors
    assert color.instance_of?(Hash), 'color should be a hash'
  end

  def test_colors_returns_a_hash_containing_a_value_for_a
    color = Application.colors['a']
    assert color == 112233, 'color should be the color which is assigned to "a"'
  end
  
  def test_creation
    assert @app.instance_of?(Application), 'app should be an instance of Application'
  end
  
  def test_picture_returns_a_picture
    assert @app.picture.instance_of?(Picture), 'the method picture should return an instance of Picture'
  end
  
  def test_squares_returns_an_array_of_squares
    assert @app.squares.first.instance_of?(Square), 'squares should return an array with instances of Squares'
  end
    
  def test_if_picture_instance_has_the_string
    assert_equal @app.picture.string, 'something', 'the picture instance should have the given string'
  end
  
  def test_squares_returns_an_array_of_squares_containing_the_expected_colors
    app = Application.new('abc')
    actual_colors = app.squares.map { |square| square.color }
    expected_colors = %w(a b c).map { |char| Application.colors[char] }
    assert_equal expected_colors, actual_colors, 'squares should return an array of squares containing the colors'
  end
end

class PictureTest < Test::Unit::TestCase  
  def test_creation
    picture = Picture.new('something')
    assert picture.instance_of?(Picture), 'picture should be an instance of Picture'
  end

  def test_normalized_string_strips_special_chars
    picture = Picture.new('something!')
    assert_no_match /[^a-zA-Z]/, picture.normalized_string, 'the method should strip off all non-alphabetical chars'
  end

  def test_normalized_string_downcases
    picture = Picture.new('SOMETHING')
    assert_no_match /[A-Z]/, picture.normalized_string, 'the method should downcase all letters'
  end

  def test_characters_returns_an_array_of_characters_from_the_normalized_string
    picture = Picture.new('something')
    assert picture.characters == %w(s o m e t h i n g), 'should return an array of all chars contained in "something"'
  end

  def test_squares_returns_an_array_of_squares_from_the_characters
    picture = Picture.new('something')
    assert picture.squares.instance_of?(Array) && picture.squares.first.char == "s", 'the method picture.squares should return an array of Square instances, where the first one has the letter "s"'
  end
end

class SquareTest < Test::Unit::TestCase
  def test_creation
    square = Square.new('a')
    assert square.instance_of?(Square), 'square should be an instance of Square'
  end

  def test_color_returns_the_color_assigned_to_the_character
    square = Square.new('a')
    assert square.color == 112233, 'should return the color which is assigned to "a"'
  end
end