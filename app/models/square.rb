class Square
  attr_reader :char
  
  def initialize(char)
    @char = char
  end
  
  def color
    Text.colors[@char]
  end
end