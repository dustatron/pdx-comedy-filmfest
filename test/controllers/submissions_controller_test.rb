require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @submission = submissions(:movie_one)
  end
  
  test "should get new submission page" do
    get new_submission_url
    assert_response :success
  end
  
  test "must be logged to submit" do
    @new_sub = Submission.new(title: "movie title", length: "7 ", link: "link to movie", contact: "non", description: "its great", reuse: true, user_id: 1)
    assert_not @new_sub.valid?
  end
  
  
end

