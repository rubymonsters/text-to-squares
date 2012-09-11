# For better understanding I removed all not necessary code and all comments and implement only one test which tests the whole progress.

# Start at line 53: Application.new('abc') creates a new instance of the application-class with the parameter 'abc' by calling the initialize-method in line 10.
# In line 54 this instance (called 'app') calls the method 'squares' (line 18) where a new instance of the Picture-class is created in line 14 which calls the method 'squares' in the Picture-class (line 36).
# Characters in the method 'squares' looks in the so called method (line 32) and in this method normalized_string goes to the so called method (line 28).
# The given string (which is transferred by the initialize-method and saved in an instance-variable) is stripped off and downcased and is returned to the characters-method where the string is split off in an array of single letters.
# The method 'map' is applied to this array of letters and a new Square-object for every character is created in the block. Every Square-object holds a single character initialized in line 42.
# Back in line 54 (after all this stuff) the method 'map' is applied to the created array of Square-objects: every single object calls the method color in the Square-class (line 46). This method knows the character because it is stored in the instance-variable and so the method 'color' can look up the color in the hash given in the Application-class.

require "test/unit"

class Application
  def self.colors
    { 'a' => 112233,
      'b' => 223344,
      'c' => 334455 }
  end
  
  def initialize(string)
    @string = string
  end
  
  def picture
    Picture.new(@string)
  end
  
  def squares
    picture.squares
  end
end

class Picture  
  def initialize(string)
    @string = string
  end
  
  def normalized_string
    @string.gsub(/[^a-zA-Z]/, "").downcase
  end
  
  def characters
    normalized_string.split(//)
  end
  
  def squares
    characters.map { |char| Square.new(char) }
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
  def test_squares_returns_an_array_of_squares_containing_the_expected_colors
    app = Application.new('abc')
    actual_colors = app.squares.map { |square| square.color }
    expected_colors = %w(a b c).map { |char| Application.colors[char] }
    assert_equal expected_colors, actual_colors, 'squares should return an squares-array containing the colors'
  end
end
