class Picture
  attr_reader :entry
  
  def initialize(entry, rows, columns) 
    @entry = entry
    @rows = rows
    @columns = columns
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
end