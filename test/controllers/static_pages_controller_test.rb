require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end
  
  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end
  
  test "should get submit" do
    get static_pages_submit_url
    assert_response :success
  end
  
  test "should get login" do
    get static_pages_login_url
    assert_response :success
  end

end
