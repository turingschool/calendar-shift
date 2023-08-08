require "icalendar"
require "open-uri"
require "pry"

class Calendar
  attr_reader :calendar

  def initialize(calendar_id)
    ical = URI.open(google_calendar_url_for(calendar_id)).read
    @calendar = Icalendar::Calendar.parse(ical).first
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

  def create_future_shifted_calendar(
    starting_date,
    finishing_date,
    offset,
    remove_zoom_info
  )
    new_calendar = Icalendar::Calendar.new
    events_in_date_range(starting_date, finishing_date).each do |event|
      all_day_event = false

      if event.dtstart.class == Icalendar::Values::Date
        all_day_event = true
        event_start, event_end = shift_all_day_event(event, offset)
      else
        event_start, event_end = shift_regular_event(event, offset)
      end

      new_event =
        new_calendar.event do |e|
          e.dtstart = event_start
          e.dtstart.ical_param "VALUE", "DATE" if all_day_event
          e.dtend = event_end
          e.dtend.ical_param "VALUE", "DATE" if all_day_event
          e.summary = event.summary
          e.description = remove_zoom_info ? remove_zoom_links(event.description) : event.description

        end
    end
    new_calendar
  end

  private

  def shift_regular_event(event, offset)
    event_start =
      Icalendar::Values::DateTime.new event.dtstart.in_time_zone(
                                        "America/Denver",
                                      ) + offset.weeks
    if event.dtend
      event_end =
        Icalendar::Values::DateTime.new event.dtend.in_time_zone(
                                          "America/Denver",
                                        ) + offset.weeks
    else
      event_end = event_start
    end
    [event_start, event_end]
  end

  def shift_all_day_event(event, offset)
    event_start =
      Icalendar::Values::DateOrDateTime.new(event.dtstart + offset.weeks)
    event_end =
      Icalendar::Values::DateOrDateTime.new(event.dtend + offset.weeks)

    [event_start, event_end]
  end

  def google_calendar_url_for(calendar_id)
    "https://www.google.com/calendar/ical/#{calendar_id}/public/basic.ics"
  end

  def remove_zoom_links(description)
    return description if description.nil?

    if description.include?("Join Zoom Meeting")
      start_of_zoom_nonsense = description.index("Join Zoom Meeting")
      description = description[0, (start_of_zoom_nonsense - 1)]
    end
    if !description.nil? && description.index("https://turingschool.zoom.us/j") == 0
      start_after_zoom_link = description.index("\n")
      description = description[start_after_zoom_link..-1]
    end
    description
  end
end
