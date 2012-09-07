require 'test/unit'
require "string_in_color.rb"



class App < Test::Unit::TestCase
  def test_color_of_word
    x = WordToColor.new("s")
    assert_equal x.color_of_word, 'seashell'



  end

end
