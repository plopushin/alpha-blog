#all tests require test_helper
require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "Sports")
    #create admin user for the test
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end 
  
  test "should get categories index" do
    get :index
    #ensure the resonse you get is success
    assert_response :success
  end
  
  test "should get new" do 
    #simulate a login who is an admin.
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end 
  
  test "should get show" do 
    get(:show, {'id' => @category.id})
    assert_response :success
  end 
  
  #in this test, there is no login user. 
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "sports" }
    end 
    assert_redirected_to categories_path
  end 
  
end 