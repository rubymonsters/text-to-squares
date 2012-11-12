require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a new user is not an admin" do
    user = User.new
    assert user.is_admin? == false, "New user should not be an admin"
  end

  # test "the truth" do
  #   assert true
  # end
end
