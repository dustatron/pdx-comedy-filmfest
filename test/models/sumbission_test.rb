require 'test_helper'

class SumbissionTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @submit = @user.submission.build(sumbissions(:first_movie))
  end

  
end
