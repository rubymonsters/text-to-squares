require "test_helper"

class PictureTest < Test::Unit::TestCase
  def setup
    @picture = Picture.new('something')
  end
  
  def test_creation
    assert @picture.instance_of?(Picture)
    # assert that picture is an instance of Picture
  end

  def test_normalized_string_strips_special_chars
    picture = Picture.new('something!')
    assert_equal picture.normalized_string, "something"
    # assert_no_match /[^a-zA-Z]/, picture.normalized_string
    # assert that picture.normalized_string returns a string with "!" stripped off
  end

  def test_normalized_string_downcases
    picture = Picture.new('SOMETHING')
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

  def test_size
    assert_equal @picture.size, 3, 'square root(wurzel von) of something.length is 3' 
  end

   def test_rows_returns_an_array_of_arrays_of_squares
    assert @picture.rows.instance_of?(Array)
    assert @picture.rows[0].instance_of?(Array)
    # ... so that we can render each row and for each row
    # render an li tag that has the color
  end

  def test_rows_returns_an_array_of_picture_size_rows
    assert @picture.rows[2], 'the array has three(picture size) ojects'
    assert_equal @picture.rows.length, 3, 'the array has three(picture size) ojects'
    # i.e. given that picture.size is 3 it should have 3 rows
  end

  def test_rows_returns_an_array_where_the_first_row_contains_picture_size_squares
    assert @picture.rows.first[2], 'the first array in the array contains three numbers'
    assert_equal @picture.rows.first.length, 3, 'the first array in the array contains three numbers'
    # i.e. given that picture.size is 3 the first row should have 3 squares
  end

end
