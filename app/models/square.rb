class Square
  attr_reader :char
  
  def initialize(char)
    @char = char
  end
  
  def color(color_scheme)
    # TODO: reformat color_xyz-hashes to
    # big hash-of-hashes so we can get rid
    # of the case-statement and say:
    # Text.colors[color_scheme][@char]
    case color_scheme
      when 'blue'
        Text.colors_blue[@char]
      when 'red'
        Text.colors_red[@char]
      when 'green'
        Text.colors_green[@char]
      else
        Text.colors_blue[@char]
    end
  end
  
end