require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "correct spelling on home page" do
    get :index
    assert_select "p", /women/
  end

end
