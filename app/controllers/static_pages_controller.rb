class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: %i[home]

  def home
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
