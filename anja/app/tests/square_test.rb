require 'test_helper'


class SquareTest < Test::Unit::TestCase
  def setup
    @square = Square.new('a')
  end
  def test_creation
    assert @square.instance_of?(Square)
    # assert that square is an instance of Square
  end

  def test_color_returns_the_color_assigned_to_the_character
    assert_equal @square.color, "112233"
    # assert that square.color returns the color which is assigned to "a"
  end
end
