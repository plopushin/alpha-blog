require 'test_helper'

#for integration tests
class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "books")
    @category2 = Category.create(name: "programming")
  end
  
  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    #ensure link is to this, and that they are the same?
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a{href=?]", category_path(@category2), text: @category2.name
  end
  
end 