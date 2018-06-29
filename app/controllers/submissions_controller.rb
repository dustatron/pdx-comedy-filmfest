class SubmissionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    
    def new
        @submit = Submission.new
    end
    
    
    def create
        @submit = Submission.new(submit_params)
        # @submit = current_user.Submission.build(submit_params)
        if @submit.save
            flash[:success] = "Your Video has been submitted"
            redirect_to root_url
        else
            render 'new'
        end
    end
    
    def show
    end
    
    private
  
    def submit_params
        params.require(:submission).permit(:title, :length, :link, :contact, :description, :reuse)
        # params.permit(submission[:title, :length, :link, :contact, :description])
    end
    
end
