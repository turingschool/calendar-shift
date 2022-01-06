require 'icalendar'
require './lib/calendar'

class CalendarCollection
  include Enumerable

  attr_reader :calendars

  CALENDARS = [
    # BE Mod 1:
    # "casimircreative.com_59k8msrrc2ddhcv787vubvp0s4@group.calendar.google.com",

    # BE Mod 2:
    # "casimircreative.com_rps2hg1nfqjih4rcl3gl6s4lpk@group.calendar.google.com",

    # BE Mod 3
    # "casimircreative.com_e9k9b6n7bok174ilmqbfdr0sc4@group.calendar.google.com",

    # FE Mod 1:
    # "casimircreative.com_m6bndqol81h6jdlnpo0a6raot0@group.calendar.google.com"

    # FE Mod 2:
    # "casimircreative.com_cjiffoqvtajq43n5mn290cp744@group.calendar.google.com"

    # FE Mod 3:
    # "casimircreative.com_krb9p35ck35m4uoji5d2715844@group.calendar.google.com"

    # Combined Mod 4:
    # "casimircreative.com_c1s3vspg5v09vh5cnnh88dn2nc@group.calendar.google.com"
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
