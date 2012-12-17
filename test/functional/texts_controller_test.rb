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
    assert_select "table" do
      assert_select "tr:nth-child(2)" do
      assert_select "td", :count => 6
      end
    end
  end

  test "index view displays a link with the screen name when the text has a user" do
    @text.user = User.new(:screen_name => "Maren") 
    @text.save!
    get :index
    # puts response.body
    # puts Text.all.map{|text| [text.input, text.user.try(:screen_name), text.created_at]}
    # puts User.all.map{|user| user.name}
    assert_select "tbody" do
      assert_select "tr:nth-child(3)" do
      assert_select "td:nth-child(1)", "Maren"
      end
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show color select box in new view" do
    get :new
    assert_not_nil :color_scheme
    assert_response :success
    assert_select "select" 
  end  

  test "should have link listening text" do
    get :new
    assert_select "a[href=?]", "/texts"  
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
  
  test "check if square_color has default color" do
    text = Text.create(:input=> "a", :color_scheme => "red")
    get :show, id: text
    assert_select "li.square[style*='320603']"
  end

   test "check if square_color has alternate color" do
    text = Text.create(:input=> "a", :color_scheme => "red")
    get :show, :id => text, :color_scheme => "green"
    assert_select "li.square[style*='011303']"
  end
  


  #show request,without params for the text variable
  test "@square_color not defined if display_color is not defined" do
    get :show, id: @text
    #puts response.body
    assert_equal @text.color_scheme, "red"
  end
 

  #show request,with params for the text variable 
  test "should change @square_color to red after using the link_to 'Red Squares'" do
    get :show, id: @text.id
    assert_equal assigns[:text].color_scheme, "red"
    #puts response.body
    # puts Text.all.map{|text| text.color_scheme}
    # assert_equal assigns[:square_color], "red"
  end

  # test "should update text" do
  #   put :update, id: @text, text: { input: @text.input }
  #   assert_redirected_to text_path(assigns(:text))
  # end

  test "text can be updated by its owner" do
    user = User.create!(:name => "Testimus Maximus")
    @text.user = user
    @text.save!

    session[:user_id] = user.id
    put :update, :id => @text.id
    
    assert_redirected_to text_path
  end

  test "it is forbidden to update someone else's text" do
    user = User.create!(:name => "Testimus Maximus")
    @text.user = user
    @text.save!

    put :update, :id => @text.id

    assert_response 403
  end

  test "text can be destroyed by its owner" do
    user = User.create!(:name => "Testimus Maximus")
    @text.user = user
    @text.save!

    session[:user_id] = user.id
    delete :destroy, :id => @text.id
    
    assert_redirected_to texts_path
  end

  test "it is forbidden to destroy someone else's text" do
    user = User.create!(:name => "Testimus Maximus")
    @text.user = user
    @text.save!

    delete :destroy, :id => @text.id

    assert_response 403
  end


  test "text can be edited by its owner" do
    user = User.create!(:name => "Testimus Maximus")
    @text.user = user
    @text.save!

    session[:user_id] = user.id

    get :edit, :id => @text.id

    assert_response :success
  end

  test "it is forbidden to edit someone else's text" do
    user = User.create!(:name => "Testimus Maximus")
    @text.user = user
    @text.save!
    get :edit, :id => @text.id

    assert_response 403
  end
end
