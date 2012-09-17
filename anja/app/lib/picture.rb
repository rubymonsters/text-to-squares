class Picture
  attr_reader :entry
  
  def initialize(entry) 
    @entry = entry
  end

  def normalized_string
    @entry.gsub(/[^a-zA-Z]/, '').downcase
  end

  def characters
    normalized_string.split(//)
  end

  def squares
    characters.map { |char| Square.new(char) }
  end
  # ... has a method `size` which returns the number of rows and columns of the picture
  #     as the square root of the total number of characters with any decimal digits cut off
  def size
    Math.sqrt(@entry.length).to_i #Math is built-in method for mathematics, to_i whole number
  end

  # def test_rows_returns_an_array_of_arrays_of_squares
    # ... so that we can render each row and for each row
    # render an li tag that has the color
  #end
  def rows  #the row size of the big picturesquare with the small squares 
    squares.each_slice(size).to_a
  #   arr = []
  #   size.times do 
  #     arr = arr << squares.shift(size)
  #   end
  # arr
  end
end