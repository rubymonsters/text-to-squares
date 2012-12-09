require 'test_helper'

class SquareTest < Test::Unit::TestCase
  def test_creation
    square = Square.new('a')
    assert square.instance_of?(Square), 'square should be an instance of Square'
  end

  def test_color_return_the_right_color_acording_to_parameter_given
    square = Square.new('a')
    assert square.color('red') == '320603', 'returns a red value if parameter is red'
    assert square.color('blue') == '112233', 'returns a blue value if parameter is blue'
    assert square.color('green') == '011303', 'returns a green value if parameter is green'
    assert square.color(nil) == '112233', 'returns a blue value if parameter is nil'
  end
    
end