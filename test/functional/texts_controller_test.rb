require 'test_helper'

class TextsControllerTest < ActionController::TestCase
  setup do
    @text = texts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:texts)
  end

  test "should have class table" do
    get :index   
    assert_select '.table' #css selector
  end

  test "index view displays 5 rows" do
    get :index
    @text.user = User.new 
      assert_select "table" do
        assert_select "tr:nth-child(2)" do
          assert_select "td", :count => 6
      end
    end
  end

  test "index view displays a link with the screen name when the text has a user" do
    get :index
    @text.user = User.new(:screen_name => "Maren") 
      assert_select "table" do
        assert_select "tr:nth-child(2)" do
          assert_select "td:nth-child(1)", "Anonymous"
      end
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text" do
    assert_difference('Text.count') do
      post :create, text: { input: @text.input }
    end

    assert_redirected_to text_path(assigns(:text))
  end

  test "should show text" do
    get :show, id: @text
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @text
    assert_response :success
  end

  test "should update text" do
    put :update, id: @text, text: { input: @text.input }
    assert_redirected_to text_path(assigns(:text))
  end

  test "should destroy text" do
    assert_difference('Text.count', -1) do
      delete :destroy, id: @text
    end

    assert_redirected_to texts_path
  end
end
