require 'icalendar'
require './lib/calendar'

class CalendarCollection
  include Enumerable

  attr_reader :calendars

  CALENDARS = [
    # "casimircreative.com_isoih6973tpoq1i8mf3nqs3mno@group.calendar.google.com",
    # "casimircreative.com_59k8msrrc2ddhcv787vubvp0s4@group.calendar.google.com",
    "casimircreative.com_rps2hg1nfqjih4rcl3gl6s4lpk@group.calendar.google.com",
    # "casimircreative.com_e9k9b6n7bok174ilmqbfdr0sc4@group.calendar.google.com",
    # "casimircreative.com_r9jfiq9f37h6rdt2s8ssofss4k@group.calendar.google.com"
  ]

  def initialize
    @calendars = CALENDARS.map do |calendar|
      Calendar.new(calendar)
    end
  end

  def each(&block)
    @calendars.each(&block)
  end

end
