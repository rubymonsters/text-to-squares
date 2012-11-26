require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get show" do
    get :show, :id => @user.id
    assert_response :success
    #assert_not_nil assigns(:users)
  end

  test "should have class table" do
    get :show, :id => @user.id   
    assert_select '.table' #css selector
  end

  test "show view displays user name" do
    @user.name = "Maren"
    @user.save!
    get :show, :id => @user.id
    # puts response.body
    # puts Text.all.map{|text| [text.input, text.user.try(:screen_name), text.created_at]}
    # puts User.all.map{|user| user.name}
    assert_select "h1", "All the Texts from Maren."
  end

end
