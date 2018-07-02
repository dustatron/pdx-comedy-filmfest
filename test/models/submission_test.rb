require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobar", password_confirmation: "foobar", id: 1)
    @submission = Submission.new(title: "movie title", length: "7 ", link: "link to movie", contact: "non", description: "its great", reuse: true, user: @user)
  end
  
  test "should be valid" do
    assert @submission.valid?
  end
  
  test "title should be present" do
    @submission.title = " "
    assert_not @submission.valid?
  end
  
  test "length should be present" do
    @submission.length = " "
    assert_not @submission.valid?
  end
  
  test "link should be present" do 
    @submission.link = " "
    assert_not @submission.valid?
  end
  
  test "name should not be too long" do 
    @submission.title = 'a' * 51
    assert_not @submission.valid?
  end
  
  test "link should not be too long" do 
    @submission.link = 'a' * 101
    assert_not @submission.valid?
  end
  
  test "description should not be too long" do 
    @submission.description = 'a' * 251
    assert_not @submission.valid?
  end
  

end
