class EventAttendingController < ApplicationController
  before_action :require_login, only: %i[create]

  def create
    p event_attending_params
    @event_attending = EventAttending.new(event_attending_params)

    if @event_attending.save
      flash[:notice] = "you are now attending this event"
      redirect_to event_path(params[:event_attending][:attended_event_id])
    else
      flash[:alert] = "an error has occured"
      redirect_to event_path(params[:event_attending][:attended_event_id]),
                  status: :unprocessable_entity
    end
  end

  private

  def event_attending_params
    params.require(:event_attending).permit(:attendee_id, :attended_event_id)
  end
end
