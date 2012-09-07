require 'test/unit'
require "string_in_color_hash.rb"

class AppTest < Test::Unit::TestCase
  
  def test_question
    x = App.new
    assert App
  end

  def test_if_answer_is_downcase_and_only_letters
    x = App.new
    @answer = "G"
    x.answer_clean

    assert_equal @answer, "g", 'should only be downcase'
  end

end


# class WordToColorTest < Test::Unit::TestCase

  

# end
