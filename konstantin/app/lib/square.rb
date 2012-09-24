class Square
  attr_reader :char

  # ... takes a letter as an argument of the initialize method
  def initialize(char)
    @char = char
  end

  # ... has a method `color` which returns the color according to the letter
  def color
    Application.colors[@char]
  end
end

