

class Picture
  attr_reader :string
  
  def initialize(string)
    @string = string
  end
  
  def normalized_string
    @string.gsub(/[^a-zA-Z]/, "").downcase
  end
  
  def truncated_string
    normalized_string.slice(0, size*size)
  end
  
  def characters
    truncated_string.split(//)
  end
  
  def squares
    characters.map { |char| Square.new(char) }
  end
  
  def size
    Math.sqrt(normalized_string.length).to_i
  end
  
  def rows
    squares.each_slice(size).to_a
  end
end