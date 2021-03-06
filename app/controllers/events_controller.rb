class EventsController < ApplicationController
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token, only: %i[create]

  def create
    unless event_params[:calendar_id].nil?
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
        redirect_to request.referer
      else
        flash[:danger] = 'Event was not created.'
        redirect_to request.referer
      end
    else
      flash[:danger] = 'You have to select a calendar.'
      redirect_to request.referer
    end
  end

  def update
    cal = Calendar.find(event_params[:calendar_id])
    start_time = event_params[:start_time]
    end_time = event_params[:end_time]
    notes = event_params[:notes]
    title = event_params[:title]
    place = event_params[:place]
    event = Event.find(params.permit(:id)[:id])
    if event.update(title: title, start_time: start_time, end_time: end_time, notes: notes, place: place, calendar: cal)
      flash[:success] = 'Event updated!'
      redirect_to request.referer
    else
      flash[:danger] = 'Event was not updated!'
      redirect_to request.referer
    end
  end
  
  private

  def event_params
    params.permit(:title, :start_time, :end_time, :notes, :place, :calendar_id)
  end
end
