require "mathn"

class Picture
  attr_reader :string

  # ... takes the string as well as a number of row and columns as arguments of the initalize method
  def initialize(string)
    @string = string
  end

  # ... has a method `normalized_string` which returns a version of the string
  #     with everything but A-Za-z stripped off and downcased
  def normalized_string
    @string.gsub(/[^a-zA-Z]/, "").downcase
  end

  # ... has a method `characters` which returns all the characters from the normalized string
  def characters
    normalized_string.split(//)
  end

  # ... has a method `squares` which returns an array of `Square` instances
  #     where each of them has one of the characters
  def squares
    characters.map { |char| Square.new(char) }
  end

  # ... has a method `size` which returns the number of rows and columns of the picture
  #     as the square root of the total number of characters with any decimal digits cut off
  def size
    Math.sqrt(@string.size).to_i
  end
end

