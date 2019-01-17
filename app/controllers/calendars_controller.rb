class CalendarsController < ApplicationController
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token, only: %i[update]

  def create
    title = cal_params2[:title]
    color = cal_params2[:color]
    puts cal_params2
    @calendar = current_user.calendars.new(title: title, color: color)
    if @calendar.save
      flash[:success] = 'Calendar created!'
      redirect_to request.referer
    else
      flash[:danger] = 'Calendar was not created!'
      redirect_to request.referer
    end
  end

  def update
    calendar = current_user.calendars.find(cal_params[:id])
    if calendar.update(title: cal_params[:newtitle], color: cal_params[:newcolor])
      flash[:success] = 'Calendar updated!'
      redirect_to request.referer
    else
      flash[:danger] = 'Calendar was not updated!'
      redirect_to request.referer
    end
  end

  def destroy
    Calendar.find(cal_params[:id]).destroy
    flash[:success] = 'Calendar deleted!'
    redirect_to request.referer
  end

  private

  def cal_params
    params.permit(:id, :newtitle, :newcolor)
  end

  def cal_params2
    params.require(:calendar).permit(:title, :color)
  end
end
