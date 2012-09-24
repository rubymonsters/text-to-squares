class Square
  attr_reader :char
  
  def initialize(char)
    @char = char
  end
  
  def color
    Application.colors[@char]
  end
end