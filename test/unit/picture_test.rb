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

  def test_truncated_string_returns_the_string_with_the_length_of_squareroot
    picture = Picture.new('somethingmuchmoreandso')
    assert picture.truncated_string == 'somethingmuchmor' , 'should return the first letters, which give the root digit'
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
    picture = Picture.new('somethingmore')
    assert picture.size == 3, 'the method size should return the root of the numbers of characters'
  end
  
  def test_rows_returns_an_array_of_arrays_of_squares
    picture = Picture.new('abcdefghi')
    assert picture.rows.first.first.instance_of?(Square), 'rows should return an array of arrays of Squares'
  end

  def test_rows_returns_an_array_of_picture_size_rows
    picture = Picture.new('abcdefghi')
    assert_equal picture.rows.size, 3, 'rows should return 3 rows when picture.size is 3'
  end

  def test_rows_returns_an_array_where_the_first_row_contains_picture_size_squares
    picture = Picture.new('abcdefgh ')
    assert_equal picture.rows.first.size, 2, 'if picture.size is 2 the first row should have 2 squares'
  end
end