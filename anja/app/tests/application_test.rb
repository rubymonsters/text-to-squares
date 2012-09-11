require 'test_helper'


class ApplicationTest < Test::Unit::TestCase
  def setup
    @app = Application.new('something')
  end

  def test_render
  end

  def test_colors_returns_a_hash
    color = Application.colors
    assert color.instance_of?(Hash), 'that colors should be a Hash' #color.class == Hash
  end

  def test_colors_returns_a_hash_containing_a_value_for_a
    color = Application.colors['a']
    assert_equal color, "antiquewhite", 'when key = a value should be antiquewhite'
    # assert that color is the color which is assigned to "a"
  end
#NEU
  def test_Application_argument_is_string
    assert @app.entry.instance_of?(String), 'argument should be a string'
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
    assert_equal @app.picture.entry, 'something' 
  end

  def test_squares_returns_an_array_of_squares_containing_the_expected_colors
    app = Application.new('abc')
    actual_colors = app.squares.map { |letter| letter.color } #muss square klasse enthalten und die chararcters in pricures
    expected_colors = %w(a b c).map { |char| Application.colors[char] }
    assert_equal expected_colors, actual_colors
  end

end