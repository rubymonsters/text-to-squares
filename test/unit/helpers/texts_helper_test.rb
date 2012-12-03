require 'test_helper'

class TextsHelperTest < ActionView::TestCase
  test "that the ability of a user to edit a text can be proved" do
    user = User.new(:name => "MATT")
    text = Text.new(:input => "hello")
    text.user = user

    assert user_can_edit?(user, text)
  end

  test "that the fact that a user cannot edit someone else's text" do
    user = User.new(:name => "MATT")
    text = Text.new(:input => "hello")

    assert_equal false, user_can_edit?(user, text)
  end
end
