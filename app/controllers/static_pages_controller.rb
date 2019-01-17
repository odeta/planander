require 'date'

class StaticPagesController < ApplicationController
  before_action :logged_in_user

  def day_view
    @working_date = check_parameters
    @url_date = url_date(@working_date)
    @next = url_date(@working_date + 1.day)
    @today = url_date(Time.now)
    @prev = url_date(@working_date - 1.day)
    get_events
  end

  def week_view
    @working_date = check_parameters
    @url_date = url_date(@working_date)
    @next = url_date(@working_date + 7.days)
    @today = url_date(Time.now)
    @prev = url_date(@working_date - 7.days)
    get_events
  end

  def month_view
    @working_date = check_parameters
    @url_date = url_date(@working_date)
    @next = url_date(@working_date + 1.month)
    @today = url_date(Time.now)
    @prev = url_date(@working_date - 1.month)
    get_events
  end

  def year_view
    @working_date = check_parameters
    @url_date = url_date(@working_date)
    @next = url_date(@working_date + 1.year)
    @today = url_date(Time.now)
    @prev = url_date(@working_date - 1.year)
  end

  private

  def get_events
    @event_list = []
    current_user.calendars.each do |cal|
      cal.events.each do |event|
        @event_list.push event
      end
      puts @event_list
    end
  end

  def check_parameters
    @working_date = Time.now
    if params.has_key?(:year) && params.has_key?(:month) && params.has_key?(:day)
      year = Integer(params[:year]) rescue false
      month = Integer(params[:month]) rescue false
      day = Integer(params[:day]) rescue false
      if year && month && day
        @working_date = Time.new(params[:year], params[:month], params[:day]) rescue @working_date = Time.now
      end
    end
    @working_date
  end

  def url_date(date)
    "?year=" + String(date.year) + "&month=" + String(date.month) + "&day=" + String(date.day)
  end
end
