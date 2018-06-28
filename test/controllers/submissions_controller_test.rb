require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @submit = sumbissions(:first_movie)
  end
  
  test "should get submissions page" do
    get submissions_submit_url
    assert_response :success
  end
  
  
end

