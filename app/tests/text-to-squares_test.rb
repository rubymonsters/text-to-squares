require "test/unit"

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

  def test_size_returns_the_root_of_the_number_of_characters
    picture = Picture.new('something')
    assert picture.size == 3, 'the method size should return the root of the numbers of characters'
  end
end

class SquareTest < Test::Unit::TestCase
  def test_creation
    square = Square.new('a')
    assert square.instance_of?(Square), 'square should be an instance of Square'
  end

  def test_color_returns_the_color_assigned_to_the_character
    square = Square.new('a')
    assert square.color == '112233', 'should return the color which is assigned to "a"'
  end
end

