require 'test_helper'

class TextTest < ActiveSupport::TestCase
 
  # test "text attributes must not be empty" do
  #   text = Text.new("test")
    
  #   assert_equal text.input, "test"
  # end

  def test_constant_is_available
    assert Text.const_defined?(:COLORS) == true, 'const should be defined'
  end
end
