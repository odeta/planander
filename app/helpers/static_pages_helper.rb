module StaticPagesHelper
  def save_date(working_date)
    cookies[:last_date] = working_date
  end
end
