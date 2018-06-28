class SubmissionsController < ApplicationController

    
    def new
        @submit = Submission.new
    end
    
    
    def create
        @submit = Submission.new(submit_params)
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
      params.permit(:title, :length, :link, :contact, :description)
    end
    
end
