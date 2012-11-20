require 'test_helper'


class UserTest < ActiveSupport::TestCase
  test "a new user is not an admin" do
    user = User.new
    assert user.is_admin? == false, "New user should not be an admin"
  end

  test "an admin user is recognised as an admin" do
    user = User.new(:name => "tyranja")
    assert user.is_admin? == true, "Tyranja should be our admin!"
  end

  test "user can be turned into a hash for json" do
  	user = User.new(:name =>"tyranja")
    hash = user.as_json
    assert_equal "tyranja", hash['name']
  end

  test "user can be turned into json" do
    user = User.new(:name =>"tyranja")
    json = user.to_json
    hash = JSON.parse(json)
    assert_equal "tyranja", hash['name']
  end

  test "is_admin should be true for tyranja in json" do
    user = User.new(:name =>"tyranja")
    hash = user.as_json
    assert_equal true, hash['is_admin']
  end

  test "admin should be false for konstantin haase" do
    user = User.new(:name =>"konstantin haase")
    hash = user.as_json
    assert_equal false, hash['is_admin']
  end

end

