# it takes any given string of 250 characters max.
# it strips all characters that are not A-Za-z
# it downcases each character
# it assigns a color to each character (in a-z)
# it converts each instance of any character to a square that has the assigned color
# it outputs a picture of 50x50 squares max.

# 1. command line application that takes a string and outputs a list of n color string per line
# $ ruby text_to_squares.rb
# please enter your poem: our application is already working!
# aaaaaa bbbbbb cccccc dddddd
# eeeeee ffffff 000000 111111

# the application class
# - normalizes the string (strip off invalid characters and downcase)
# - creates a picture instance with that string
# - gets all the squares from the picture and prints out their colors line by line
#
# the picture class
# - knows all the available colors
# - takes the string as well as a number of row and columns as arguments of the initalize method
# - it generates the squares from the string
# 
# the square class
# - has a color
# - has a fixed size

require "test/unit"
require "mathn"

class Application
  def initialize(text)
    @text = text
  end
  
  def normalize
    @letters = @text.gsub(/[^a-zA-Z]/, "").downcase
  end
  
  def columns_rows
    # the square root of the total number of squares (characters) with any decimal digits cut off
    Math.sqrt(@letters.size).to_i
  end
  
  def string_to_array
    @letters.split(//)
  end
  
  def prepare_picture
    # nach quadratzahl Zeichen Zeilenumbruch
    @char_array = @letters.split(//)
    picture = Picture.new(@char_array)
    picture.change_char_to_color
  end
end

class Picture  
  def initialize(char_array)
    # hash with letters as keys and colors as values
    @colors = {
      "a" => "111111",
      "b" => "222222",
      "c" => "102030",
      "d" => "1A2B3C",
      "e" => "333333",
      "f" => "444444",
      "g" => "203040",
      "h" => "FFFFFF",
      "i" => "304050",
      "j" => "607080",
      "k" => "708090",
      "l" => "8090AA",
      "m" => "AABBCC",
      "n" => "BBCCDD",
      "o" => "CCDDEE",
      "p" => "DDEEFF",
      "q" => "EEFF11",
      "r" => "FF1122",
      "s" => "445566",
      "t" => "556677",
      "u" => "667788",
      "v" => "778899",
      "w" => "8899AA",
      "x" => "234567",
      "y" => "345678",
      "z" => "456789"
    }
    @char_array = char_array
  end
  
  def change_char_to_color
    # colors are assigned to the characters and saved in a new array
    @color_array = @char_array.map { |c| @colors[c] }
  end
  
  def characters
    # returns the character
  end
end

class Square
  def initialize(color, size)
    @color = color
    @size = size
  end
end

puts "Type a string"
input_text = gets.chomp
text = Application.new(input_text)
text.normalize
puts text.columns_rows
puts text.prepare_picture

# class ApplicationTest < Test::Unit::TestCase
#   def test_application_creation
#     # a given string is assigned to instance-variable
#     application = Application.new("This is an example string!")
#     assert application, 'create an application instance'
#   end
#   
#   def test_remove_all_non_alphabetical_characters_from_string
#     application = Application.new("This is an example string!")
#     assert_no_match /[^a-zA-Z]/, application.normalize, 'no character except letters should be there'
#   end
#   
#   def test_downcase_all_letters
#     application = Application.new("This is an example string!")
#     assert_no_match /[^a-z]/, application.normalize, 'all letters should be lower case'  
#   end
#   
#   def test_count_chars
#     application = Application.new("thisisasmallexamplestring")
#     application.normalize
#     assert_equal 25, application.count_chars, 'the characters of the string are counted'
#   end
#   
#   # def test_prepare_picture
#   #   picture = Picture.new("thisisasmallexamplestring")
#   #   assert picture
#   # end
# end
# 
# class PictureTest < Test::Unit::TestCase
#   def test_picture_creation
#     picture = Picture.new("thisisasmallexamplestring")
#     assert picture, 'create a picture instance'
#   end
# end
