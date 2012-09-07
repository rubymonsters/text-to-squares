require 'test/unit'

  
class App  
  def normalize
    answer.gsub(/[^a-zA-Z]/, '').downcase!
  end  
    
  def assign
    letters to colourscodes
  end
  
  def arrange
    colourcode lines
  end
end




class AppTest < Test::Unit::TestCase
  def if_input_mm
    input = asdfsadf
    assert input.normalize.length.to_i >= 1, 'input normalized should be at least 1 letter'
  end
  
end  

