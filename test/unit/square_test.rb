require 'test_helper'

class SquareTest < Test::Unit::TestCase
  def test_creation
    square = Square.new('a')
    assert square.instance_of?(Square), 'square should be an instance of Square'
  end

  def test_color_returns_the_color_assigned_to_the_character
    square = Square.new('a')
    assert square.color == '112233', 'should return the color which is assigned to "a"'
  end

  def test_color_red_returns_the_color_assigned_to_the_character
    square = Square.new('a')
    assert square.color_red == '320603', 'should return the color which is assigned to "a"'
  end
end