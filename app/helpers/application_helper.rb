module ApplicationHelper
  def beginning_time(event)
    100.0 * (event.start_time.hour + event.start_time.min / 60.0) / 24
  end

  def end_time(event)
    100.0 * (24 - event.end_time.hour - event.end_time.min / 60.0) / 24
  end
end
