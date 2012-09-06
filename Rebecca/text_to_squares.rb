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
  attr_reader :string

  def self.colors
    {"a" => "000000", "b" => "F8F8F8", "c" => "101010", "d" => "E8E8E8", "e" => "202020", "f" => "D8D8D8", "g" => "303030", "h" => "383838", "i" => "404040", "j" => "484848", "k" => "505050", "l" => "585858", "m" => "606060", "n" => "686868", "o" => "707070", "p" => "787878", "q" => "808080", "r" => "888888", "s" => "909090", "t" => "989898", "u" => "A0A0A0", "v" => "A8A8A8", "x" => "B0B0B0", "y" => "B8B8B8", "z" => "C0C0C0" }
  # knows all the available colors (common class knowledge => should be a class method)
  end

  def initialize(string)
    @string = string
  end

  def picture
    Picture.new(string)  
    # method `picture` which returns an instance of `Picture` created with that string
  end

  def squares
    picture.squares
    #-[Square.new("character")]
    # method squares which returns the squares from the picture
  end
end


class Picture
  attr_reader :string

  def initialize(string)
    @string = string
    # takes the string & a number of row and columns as arguments of the initalize method
  end

  def normalized_string
   @string.gsub(/[^a-zA-Z]/, '').downcase
   # method `normalized_string` returns a version of the string w/ everything 
   # but A-Za-z stripped off and downcased
  end

  def characters
    normalized_string.chars.to_a
    # method `characters` which returns all the characters from the `normalized_string``
  end

  def squares
    characters.map { |character| Square.new(character) }
    # method `squares` which returns an array of `Square` instances where each of the
    # squares has one of the characters
  end
end


class Square
  def initialize(character)
    @character = character
    # takes a letter as an argument of the initialize method
  end

  def color
    Application.colors[@character]
    # method `color` which returns the color according to the letter
  end
end


class ApplicationTest < Test::Unit::TestCase
  attr_reader :app

  def setup
    @app = Application.new("something")
  end

  def test_colors_returns_a_hash
    colors = Application.colors
    assert colors.instance_of?(Hash)
    # assert that colors is a hash
  end

  def test_colors_returns_a_hash_containing_a_value_for_a
    colors = Application.colors["a"]
    assert_equal colors, "000000"
    # assert that color is the color which is assigned to "a"
  end

  def test_creation
    assert app.instance_of?(Application)
    # assert that application is an instance of Application
  end

  def test_picture_returns_a_picture
    assert app.picture.instance_of?(Picture)
    # assert that the method picture returns an instance of Picture
  end

  def test_squares_returns_an_array_of_squares
    assert app.squares.first.instance_of?(Square)
    # assert that application.squares returns an array where the first object 
    # is an instance of Square. 
    #hint: you will need to implement the Picture and Square classes first
  end

  def test_if_picture_takes_app_string
    assert_equal app.picture.string, "something"
  end

  def test_squares_returns_an_array_of_squares_containing_the_expected_colors
    app = Application.new("abc")
    actual_colors = app.squares.map { |square| square.color }
    expected_colors = %w(a b c).map { |char| Application.colors[char] }
    assert_equal expected_colors, actual_colors
  end
end


class PictureTest < Test::Unit::TestCase
  attr_reader :picture

  def setup
    @picture = Picture.new("something")
  end

  def test_creation
    assert picture.instance_of?(Picture)
    # assert that picture is an instance of Picture
  end

  def test_normalized_string_strips_special_chars
    assert picture.normalized_string == "something"
    # assert that picture.normalized_string returns a string with "!" stripped off
  end

  def test_normalized_string_downcases
    picture = Picture.new("SOMETHING")
    assert picture.normalized_string == "something"
    # assert that picture.normalized_string returns a string with "!" stripped off
  end

  def test_characters_returns_an_array_of_characters_from_the_normalized_string
    assert_equal picture.characters, %w(s o m e t h i n g)    
    # assert that picture.characters returns an array of all characters contained in "something"
  end

  def test_squares_returns_an_array_of_squares_from_the_characters
    # assert_equal picture.squares.first, "s"
    assert picture.squares.instance_of?(Array)
    # assert that picture.squares returns an an array of Square instances where the first one
    # has the letter "s"
    # hint: you will need to implement the Square class first
  end
end


class SquareTest < Test::Unit::TestCase
  attr_reader :square

  def setup
    @square = Square.new("a")
  end

  def test_creation
    assert square
    # assert that square is an instance of Square
  end

  def test_color_returns_the_color_assigned_to_the_character
    assert_equal square.color, Application.colors["a"]
    # assert that square.color returns the color which is assigned to "a"
  end
end




