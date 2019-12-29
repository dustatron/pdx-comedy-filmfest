class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new

  end

  def new
    @event = Event.first
  end

  def create
    @event = Event.first
    if @event.save 
      redirect_to root_path, notice: "success"  
    else
      redirect_to root_path, alert: "fail"
    end
  end

  def edit
    @event = Event.first
  end

  def show
    @event = Event.find(params[:id])
    
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(submit_params)
        flash[:success] = "Event Details were updated"
        redirect_to @event
    else
        render 'new'
    end
  end

end

private
  
def submit_params
    params.require(:event).permit(:eventdate, :deadline, :facebook, :ticket)
end
