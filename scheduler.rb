require 'active_support'
require './lib/calendar_collection'

puts "Enter start date -- the first day of the inning you want to copy:"
print "<YYYY-MM-DD> (e.g. 2015-11-02)> "
start = Date.parse(gets.chomp)

puts "Enter end date -- the last day of the last inning to copy:"
print "<YYYY-MM-DD> (e.g. 2015-11-02)> "
finish = Date.parse(gets.chomp)

puts "How many weeks of data are we copying (include intermission week/weeks AFTER the inning too!!)"
print "(default: 7)> "

input = gets.chomp
offset = if input.empty?
           7
         else
           input.to_i
         end

calendars = CalendarCollection.new

calendars.each do |calendar|
  adjusted_calendar = calendar.create_future_shifted_calendar(start, finish, offset)
  filename = "#{calendar.title}-#{Time.now.to_i}.ics"
  outpath = File.expand_path("./output/#{filename}")
  File.open(outpath, 'w') { |file| file.write(adjusted_calendar.to_ical) }
  puts "Wrote shifted cal for #{calendar.title} to #{outpath}"
end

# special shift for post holidays
# 2015-11-30 to 2015-12-18 - 9 weeks
# 2016-01-04 to 2016-01-22 - 7 weeks
# Then hackily combine these suckers with ical
