class StaticPagesController < ApplicationController

  def home
    @first = Submission.where(winning_place: '1st').last(3)
    @second = Submission.where(winning_place: '2nd').last(3)
    @third = Submission.where(winning_place: '3rd').last(3)
    @event = Event.first
    
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @submission = Submission.where(user_id: params[:user_id])
    end
    
  end
  
  def awards
    @category = params[:category]
    @award = Submission.where(winning_place: params[:place])
  end

  def help
  end

  def about
  end

  def contact
  end
end