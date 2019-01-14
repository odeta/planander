class EventsController < ApplicationController
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token, only: %i[create]

  def create
    calendar = current_user.calendars.find(event_params[:calendar_id])
    title = event_params[:title]
    start_time = event_params[:start_time]
    end_time = event_params[:end_time]
    notes = event_params[:notes]
    place = event_params[:place]
    @event = calendar.events.build(title: title, start_time: start_time, end_time: end_time,
                            notes: notes, place: place)
    if @event.save
      flash[:success] = 'Event created!'
      redirect_to home_url
    else
      flash[:danger] = 'Event was not created :('
      redirect_to home_url
    end
  end

  private

  def event_params
    params.permit(:title, :start_time, :end_time, :notes, :place, :calendar_id)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to home_url
    end
  end
end
