class EventAttendingController < ApplicationController
  def new
    @event_attending = EventAttending.new
  end

  def create
    @event_attending = EventAttending.new(event_attending_params)
  end

  private

  def event_attending_params
  end
end
