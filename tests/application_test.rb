require 'test_helper'

class ApplicationTest < Test::Unit::TestCase
  def setup
    @app = Application.new('something')
  end

  def test_render_returns_the_rendered_html_output
    assert_match @app.render, /<html>.+<li.+style='background-color:.+<\/html>/m, 'render should create the html-template'
  end
  
  def test_colors_returns_a_hash
    color = Application.colors
    assert color.instance_of?(Hash), 'color should be a hash'
  end

  def test_colors_returns_a_hash_containing_a_value_for_a
    color = Application.colors['a']
    assert color == '112233', 'color should be the color which is assigned to "a"'
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
    app = Application.new('abcd')
    actual_colors = app.squares.map { |square| square.color }
    expected_colors = %w(a b c d).map { |char| Application.colors[char] }
    assert_equal expected_colors, actual_colors, 'squares should return an array of squares containing the colors'
  end
end