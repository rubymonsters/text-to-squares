class Picture
  attr_reader :string, :color_schema

  def initialize(string, color_schema)
    @string = string
    @color_schema = color_schema
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

  def color_for(char)

  end

  def squares
    characters.map do |char|
      Square.new(char, color_schema[char])
    end
  end

  def size
    Math.sqrt(normalized_string.length).to_i
  end

  def rows
    squares.each_slice(size).to_a
  end
end
