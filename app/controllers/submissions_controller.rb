class SubmissionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def index
        @subs = Submission.all
    end
    
    def new
        @submit = Submission.new
    end
    
    def create
        @submit = current_user.submissions.build(submit_params)
        # @submit = current_user.Submission.build(submit_params)
        if @submit.save
            flash[:success] = "Your Video has been submitted"
            redirect_to root_url
        else
            render 'new'
        end
    end
    
    def show
        @submission = Submission.find(params[:id])
        @user = User.find(@submission.user_id)
    end
    
    def destroy
        Submission.find(params[:id]).destroy
        flash[:success] = "submission deleted"
        redirect_to submissions_url
    end
    
    private
  
    def submit_params
        params.require(:submission).permit(:title, :length, :link, :contact, :description, :reuse)
        # params.permit(submission[:title, :length, :link, :contact, :description])
    end
    
end
