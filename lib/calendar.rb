require 'icalendar'
require 'open-uri'

class Calendar

  attr_reader :calendar

  def initialize(calendar_id)
    ical = open(google_calendar_url_for(calendar_id)).read
    @calendar = Icalendar.parse(ical).first
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
      event_start_time = event.dtstart
      event_end_time = event.dtend
      new_calendar.event do |e|
        e.dtstart     = Icalendar::Values::DateTime.new(event_start_time + offset - 6.hours)
        e.dtend       = Icalendar::Values::DateTime.new(event_end_time + offset - 6.hours)
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