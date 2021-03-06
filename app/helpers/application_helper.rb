module ApplicationHelper

  def beginning_time(event)
    100.0 * event.start_time / 24
  end

  def end_time(event)
    100.0 * (24 - event.end_time) / 24
  end

  def set_divider(object_list)
    object_list.each do |event|

    end
  end


  class EventObject

    def initialize(event)
      @start_day = event.start_time.day
      @end_day = event.end_time.day
      @start_time_normal = String(event.start_time.hour) + ":" + minutes(event)
      @start_time = event.start_time.hour + event.start_time.min / 60.0
      @end_time = event.end_time.hour + event.end_time.min / 60.0
      @id = event.id
      @width_divider = 1
      @cal = event.calendar
      @title = event.title
      @location = event.place
      @notes = event.notes
    end

    def start_day
      @start_day
    end

    def end_day
      @end_day
    end

    def start_time_normal
      @start_time_normal
    end

    def start_time
      @start_time
    end

    def end_time
      @end_time
    end

    def calendar
      @cal
    end

    def id
      @id
    end

    def divider
      @width_divider
    end

    def title
      @title
    end

    def location
      @location
    end

    def notes
      @notes
    end

    def minutes(event)
      if event.start_time.min >= 10
        String(event.start_time.min)
      else
        "0" + String(event.start_time.min)
      end
    end

  end

  def event_object_list(month)
    object_list = []
    @event_list.each do |event|
      if event.start_time.year.equal?(@working_date.year) or event.end_time.year.equal?(@working_date.year)
        if event.start_time.month.equal?(month) or event.end_time.month.equal?(month)
          object = EventObject.new(event)
          object_list.push(object)
        end
      end
    end
    object_list
  end

  def check(event)

    if event.start_day.equal?(@working_date.day) or event.end_day.equal?(@working_date.day)

      if event.start_day.equal?(@working_date.day)
        @beginning = beginning_time(event)
      else
        @beginning = 0
      end

      if event.end_day.equal?(@working_date.day)
        @ending = end_time(event)
      else
        @ending = 0
      end

    end

  end

  def month_check(event, day)

    if event.start_day.equal?(day) or event.end_day.equal?(day)

      if event.start_day.equal?(day)
        @beginning = beginning_time(event)
      else
        @beginning = 0
      end

      if event.end_day.equal?(day)
        @ending = end_time(event)
      else
        @ending = 0
      end

    end

  end

end




