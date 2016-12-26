require 'test_helper'

#for integration tests
class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    #ensure that another category has been added
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end 
    assert_template 'categories/index'
    assert_match "sports", response.body
    
  end
  
  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
    #ensure that another category has been added
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
    end 
    assert_template 'categories/new'
    #know errors partial is shown if both appear
    assert_select 'h2.panel-title' 
    assert_select 'div.panel-body' 
  end 
  
end 