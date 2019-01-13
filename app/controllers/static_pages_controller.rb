require 'date'

class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: %i[home]

  def home
    @working_date = Time.new(2018, 02, 5)
  end

  def month_view
    @working_date = Time.now unless (@working_date = Time.new(cookies[:last_date]))
  end

  private

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to root_url
    end
  end
end
