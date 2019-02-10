class StaticPagesController < ApplicationController

  def home
    @first = Submission.where(winning_place: '1st')
    @second = Submission.where(winning_place: '2nd')
    @third = Submission.where(winning_place: '3rd')
    
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @submission = Submission.where(user_id: params[:user_id])
    end
    
  end

  def help
  end

  def about
  end

  def contact
  end
end