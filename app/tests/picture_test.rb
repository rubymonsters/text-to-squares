require 'test_helper'

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

  def test_rows_returns_an_array_of_arrays_of_squares
    # ... so that we can render each row and for each row
    # render an li tag that has the color
  end

  def test_rows_returns_an_array_of_picture_size_rows
    # i.e. given that picture.size is 3 it should have 3 rows
  end

  def test_rows_returns_an_array_where_the_first_row_contains_picture_size_squares
    # i.e. given that picture.size is 3 the first row should have 3 squares
  end
end

