require 'icalendar'
require 'open-uri'

class Calendar

  attr_reader :calendar

  def initialize(calendar_id)
    ical = open(google_calendar_url_for(calendar_id)).read
    @calendar = Icalendar.parse(ical).first
  end

  def inspect
    to_s
  end

  def to_s
    "Turing Calendar: #{title}"
  end

  def title
    calendar.custom_properties["x_wr_calname"].first
  end

  def events
    calendar.events
  end

  def events_in_date_range(starting_date, finishing_date)
    events.find_all do |event|
      event.dtstart > starting_date && event.dtstart < finishing_date
    end
  end

  def create_future_shifted_calendar(starting_date, finishing_date, offset)
    new_calendar = Icalendar::Calendar.new
    events_in_date_range(starting_date, finishing_date).each do |event|
      event_start = Icalendar::Values::DateTime.new event.dtstart.in_time_zone('America/Denver') + offset.weeks
      if event.dtend
        event_end = Icalendar::Values::DateTime.new event.dtend.in_time_zone('America/Denver') + offset.weeks
      else
        event_end = event_start
      end
      new_event = new_calendar.event do |e|
        e.dtstart     = event_start
        e.dtend       = event_end
        e.summary     = event.summary
        e.description = event.description
      end
    end
    new_calendar
  end

  private

  def google_calendar_url_for(calendar_id)
    "https://www.google.com/calendar/ical/#{calendar_id}/public/basic.ics"
  end

end
