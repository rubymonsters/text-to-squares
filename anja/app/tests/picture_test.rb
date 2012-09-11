require "test_helper"

class PictureTest < Test::Unit::TestCase
  def setup
    @picture = Picture.new('something','rows', 'columns')
  end
  
  def test_creation
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
    # assert_equal %w(s o m e t h i n g), @picture.characters 
    assert @picture.characters.instance_of?(Array)
    # assert that picture.characters returns an array of all characters contained in "something"
  end

  def test_squares_returns_an_array_of_squares_from_the_characters
    assert_equal @picture.squares.first.char, "s"
    assert @picture.squares.instance_of?(Array), 'instance of array'
    assert @picture.squares.first.instance_of?(Square),'first one is instance of class square'
    # assert that picture.squares returns an an array of Square instances where the first one
    # has the letter "s"
    # hint: you will need to implement the Square class first
  end
end
