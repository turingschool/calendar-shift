require 'active_support'
require './lib/calendar_collection'

START = Date.parse("2014-05-18")
FINISH = Date.parse("2015-06-26")
OFFSET = 7.weeks

DATES = (START..FINISH).to_a

calendars = CalendarCollection.new

calendars.each do |calendar|
  adjusted_calendar = calendar.create_future_shifted_calendar(START, FINISH, OFFSET)
  filename = "#{calendar.title}-#{Time.now.to_i}.ics"
  File.open("./output/#{filename}", 'w') { |file| file.write(adjusted_calendar.to_ical) }
end
