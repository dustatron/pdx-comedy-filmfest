class SubmissionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    include VideosHelper
    
    def index
        @submissions = Submission.all.paginate(page: params[:page])
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
    
    def edit
        @submission = Submission.find(params[:id])
    end
    
    def update
        @submission = Submission.find(params[:id])
        if @submission.update_attributes(submit_params)
            flash[:success] = "Submission Details were updated"
            redirect_to @submission
        else
            render 'edit'
        end
    end
    
    def approved_index
        @approval = Submission.where(approved: true).paginate(page: params[:page], :per_page => 8) 
        @runtime = @approval.sum {|h| h[:length].to_i }
    end
    
    def destroy
        Submission.find(params[:id]).destroy
        flash[:success] = "submission deleted"
        redirect_to submissions_url
    end
    
    def status_change
        status = params[:status]
        @approve = Submission.find(params[:id])
        
        if status == 'oct'
            @approve.status = 'October'
            @approve.approved = true
            
            if @approve.save
                flash[:success] = "#{@approve.title} has been approved for October"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
        elsif status == 'nov'
            @approve.status = 'November'
            @approve.approved = true
       
            if @approve.save
                flash[:success] = "#{@approve.title} has been approved for November"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
        elsif status == 'dec'
            @approve.status = 'December'
            @approve.approved = true
       
            if @approve.save
                flash[:success] = "#{@approve.title} has been approved for December"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
        elsif status == 'jan'
            @approve.status = 'January'
            @approve.approved = true
       
            if @approve.save
                flash[:success] = "#{@approve.title} has been approved for January"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
        elsif status == 'feb'
            @approve.status = 'February'
            @approve.approved = true
       
            if @approve.save
                flash[:success] = "#{@approve.title} has been approved for February"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
        elsif status == 'mar'
            @approve.status = 'March'
            @approve.approved = true
       
            if @approve.save
                flash[:success] = "#{@approve.title} has been approved for March"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
        elsif status == 'reject'
            @approve.status = 'Rejected'
            @approve.approved = false
       
            if @approve.save
                flash[:success] = "#{@approve.title} has been rejected"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
        elsif status == 'archive'
            @approve.status = 'Archive'
            @approve.approved = true
       
            if @approve.save
                flash[:success] = "#{@approve.title} has been send to the archive"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
        else
            @approve.status = "Being Reviewed"
            @approve.approved = false
            
            if @approve.save
                flash[:success] = "#{@approve.title} has been set to rejected"
                redirect_to @approve
            else
                flash[:error] = @approve.errors.full_messages
                redirect_to @approve
            end
            
        end
    end
    

    
    
    
    private
  
    def submit_params
        params.require(:submission).permit(:title, :length, :link, :contact, :description, :reuse, :password, :status)
        # params.permit(submission[:title, :length, :link, :contact, :description])
    end
    
end
