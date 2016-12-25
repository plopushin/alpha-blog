require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  #setup runs before every test
  def setup
    @category = Category.new(name: "Sports")
  end 
  
  #for tests
  test "category should be valid" do
    #can we initiate a category instance?
    assert @category.valid?
  end
  
  test "name should be present" do
    @category.name = " "
    #assert_not is a false return
    #this means if not valid, test will pass
    assert_not @category.valid?
  end 
  
  test "name should be unique" do 
    #hit the test database
    @category.save
    category2 = Category.new(name: "Sports")
    #means category2 should not be valid
    assert_not category2.valid?
  end 
  
  test "name should not be too long" do
    #means max of 26 characters
    @category.name = "a" *26
    assert_not @category.valid?
  end 
  
  test "name should not be too short" do
    #two characters
    @category.name = "aa"
    assert_not @category.valid?
  end 
  
end 