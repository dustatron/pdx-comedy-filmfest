class SubmissionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def index
        @subs = Submission.all.paginate(page: params[:page], :per_page => 8)
        @submissions = Submission.all.paginate(page: params[:page], :per_page => 8)
    end
    
    def new
        @submit = Submission.new
    end
    
    def create
        @submit = current_user.submissions.build(submit_params)
        # @submit = current_user.Submission.build(submit_params)
        if @submit.save
            flash[:success] = "Your Video has been submitted"
            redirect_to current_user
        else
            render 'new'
        end
    end
    
    def show
        @submission = Submission.find(params[:id])
        @user = User.find(@submission.user_id)
    end
    
    def approved_index
        @approval = Submission.where(approved: true).paginate(page: params[:page], :per_page => 8) 
    end
    
    def destroy
        Submission.find(params[:id]).destroy
        flash[:success] = "submission deleted"
        redirect_to submissions_url
    end
    
    def approved
       @approve = Submission.find(params[:id])
       if @approve.approved != true 
        @approve.approved = true
            if @approve.save
                flash[:success] = "#{@approve.title} has been approved"
                redirect_to submissions_url
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to submissions_url
            end
        elsif @approve.approved = true
            @approve.approved = false
            if @approve.save
                flash[:success] = "#{@approve.title} is no longer approved"
                redirect_to submissions_url
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to submissions_url
            end
        end
        

    end
    
    
    
    private
  
    def submit_params
        params.require(:submission).permit(:title, :length, :link, :contact, :description, :reuse)
        # params.permit(submission[:title, :length, :link, :contact, :description])
    end
    
end
