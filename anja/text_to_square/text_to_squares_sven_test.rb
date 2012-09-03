require 'test/unit'
require "text_to_squares_sven.rb"



class ApplicationTest < Test::Unit::TestCase
  def test_colors_returns_a_hash
    color = Application.colors
    assert color.is_a?(Hash), 'that colors is a hash' #color.class == Hash
  end

  def test_colors_returns_a_hash_containing_a_value_for_a
    color = Application.colors['a']
    assert_equal color, "antiquewhite", 'when key = a value = antiquewhite'
    # assert that color is the color which is assigned to "a"
  end

  def test_creation
    app = Application.new('something')
    # assert that application is an instance of Application
  end

  def test_picture_returns_a_picture
    app = Application.new('something')
    # assert that the method picture returns an instance of Picture
  end

  def test_squares_returns_an_array_of_squares
    app = Application.new('something')
    # assert that application.squares returns an array where the first object is an instance of Square
    # hint: you will need to implement the Picture and Square classes first
  end
end

class PictureTest < Test::Unit::TestCase
  def test_creation
    picture = Picture.new('something')
    # assert that picture is an instance of Picture
  end

  def test_normalized_string_strips_special_chars
    picture = Picture.new('something!')
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
