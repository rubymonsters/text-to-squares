class Square
  attr_reader :char
  
  def initialize(char)
    @char = char
  end
  
  def color
    Text.colors[@char]
  end

  def color_red
    Text.colors_red[@char]
  end

   def color_green
    Text.colors_green[@char]
  end

end