class EventsController < ApplicationController
  before_action :require_login, only: %i[create, new]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.build(event_params)

    if @event.save
      flash[:notice] = "Event created"
      redirect_to root_path
    else
      flash[:alert] = "Event was not saved"
      redirect_to new_event_path, status: :unprocessable_entity
    end
  end

  private

  def require_login
    unless current_user
      flash[:alert] = "You must log in first"
      redirect_to new_user_session_path
    end
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
