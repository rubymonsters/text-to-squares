require 'test/unit'
require "text_to_squares_sven.rb"



class ApplicationTest < Test::Unit::TestCase
  def setup
    @app = Application.new('something')
  end

  def test_colors_returns_a_hash
    color = Application.colors
    assert color.instance_of?(Hash), 'that colors should be a Hash' #color.class == Hash
  end

  def test_colors_returns_a_hash_containing_a_value_for_a
    color = Application.colors['a']
    assert_equal color, "antiquewhite", 'when key = a value = antiquewhite'
    # assert that color is the color which is assigned to "a"
  end

  def test_creation
    assert @app.instance_of?(Application), 'instance of Application'
    # assert that application is an instance of Application
  end

  def test_picture_returns_a_picture
    assert @app.picture.instance_of?(Picture), 'method picture returns instance of Picture'
    # assert that the method picture returns an instance of Picture

  end

  def test_squares_returns_an_array_of_squares
    
    assert @app.squares.instance_of?(Array), 'is Array'
    assert @app.squares.first.instance_of?(Square), 'first one is instance of Squares'
    # assert that application.squares returns an array where the first object is an instance of Square
    # hint: you will need to implement the Picture and Square classes first
  end

  def test_if_picture_instance_has_the_string
    assert_equal @app.picture.string, 'something' 
  end

  def test_squares_returns_an_array_of_squares_containing_the_expected_colors
    app = Application.new('abc')
    actual_colors = app.squares.map { |letter| letter.color } #muss square klasse enthalten und die chararcters in pricures
    expected_colors = %w(a b c).map { |char| Application.colors[char] }
    assert_equal expected_colors, actual_colors
  end

end

class PictureTest < Test::Unit::TestCase
  def setup
    @picture = Picture.new('something','rows', 'columns')
  end
  
  def test_creation
    # picture = Picture.new('something')
    assert @picture.instance_of?(Picture)
    # assert that picture is an instance of Picture
  end

  def test_normalized_string_strips_special_chars
    picture = Picture.new('something!','rows', 'columns')
    assert_equal picture.normalized_string, "something"
    # assert_no_match /[^a-zA-Z]/, picture.normalized_string
    # assert that picture.normalized_string returns a string with "!" stripped off
  end

  def test_normalized_string_downcases
    picture = Picture.new('SOMETHING','rows', 'columns')
    assert_equal picture.normalized_string, "something"
    # assert that picture.normalized_string returns a string with "!" stripped off
  end

  def test_characters_returns_an_array_of_characters_from_the_normalized_string
    # picture = Picture.new('something')
    # assert_equal %w(s o m e t h i n g), @picture.characters 
    assert @picture.characters.instance_of?(Array)
    # assert that picture.characters returns an array of all characters contained in "something"
  end

  def test_squares_returns_an_array_of_squares_from_the_characters
    # p @picture.squares
    # p @picture.squares.first
    #assert_equal @picture.squares.first, "s"
    assert @picture.squares.instance_of?(Array), 'instance of array'
    assert @picture.squares.first.instance_of?(Square),'first one is instance of class square'
    # assert that picture.squares returns an an array of Square instances where the first one
    # has the letter "s"
    # hint: you will need to implement the Square class first
  end
end

class SquareTest < Test::Unit::TestCase
  def setup
    @square = Square.new('a')
  end
  def test_creation
    assert @square.instance_of?(Square)
    # assert that square is an instance of Square
  end

  def test_color_returns_the_color_assigned_to_the_character
    assert_equal @square.color, "antiquewhite"
    # assert that square.color returns the color which is assigned to "a"
  end
end
