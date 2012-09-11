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

end