require 'date'

class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: %i[home]
  skip_before_action :verify_authenticity_token, only: %i[change]

  def day_view
    @working_date = check_parameters
    @url_date = url_date(@working_date)
    @next = url_date(@working_date + 1.day)
    @today = url_date(Time.now)
    @prev = url_date(@working_date - 1.day)
  end

  def week_view
    @working_date = check_parameters
    @url_date = url_date(@working_date)
    @next = url_date(@working_date + 7.days)
    @today = url_date(Time.now)
    @prev = url_date(@working_date - 7.days)
  end

  def month_view
    @working_date = check_parameters
    @url_date = url_date(@working_date)
    @next = url_date(@working_date + 1.month)
    @today = url_date(Time.now)
    @prev = url_date(@working_date - 1.month)
  end

  def year_view
    @working_date = check_parameters
    @url_date = url_date(@working_date)
    @next = url_date(@working_date + 1.year)
    @today = url_date(Time.now)
    @prev = url_date(@working_date - 1.year)
  end

  def change
    calendar = current_user.calendars.find(change_params[:cid])
    calendar.update(title: change_params[:newtitle])
    redirect_to home_path
  end

  private

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

  def change_params
    params.permit(:cid, :newtitle)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to root_url
    end
  end
end
