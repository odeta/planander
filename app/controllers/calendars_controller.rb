class CalendarsController < ApplicationController
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token, only: %i[update]

  def create
    title = cal_params2[:title]
    color = cal_params2[:color][1..-1]
    @calendar = current_user.calendars.new(title: title, color: color)
    if @calendar.save
      flash[:success] = 'Calendar created!'
      redirect_to home_url
    else
      flash[:danger] = 'Calendar was not created!'
      redirect_to home_url
    end
  end

  def update
    calendar = current_user.calendars.find(cal_params[:cid])
    calendar.update(title: cal_params[:newtitle], color: cal_params[:newcolor])
    redirect_to home_path
  end

  private

  def cal_params
    params.permit(:cid, :newtitle, :newcolor)
  end

  def cal_params2
    params.require(:calendar).permit(:title, :color)
  end
end
