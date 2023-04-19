require 'icalendar'
require './lib/calendar'

class CalendarCollection
  include Enumerable

  attr_reader :calendars

  CALENDARS = [
    # BE Mod 1 (Student-facing):
    # "casimircreative.com_59k8msrrc2ddhcv787vubvp0s4@group.calendar.google.com",

    # BE Mod 1 (ACCET): 
    # "<<<need-to-add-id>>>>"

    # BE Mod 2 (Student-facing):
    # "casimircreative.com_rps2hg1nfqjih4rcl3gl6s4lpk@group.calendar.google.com",

    # BE Mod 2 (ACCET): 
    # c_c02d6f7447fbb15503240bcd0d261e4a36a24f430f71e995df08197437872326@group.calendar.google.com

    # BE Mod 3 (Student-facing):
    # "casimircreative.com_e9k9b6n7bok174ilmqbfdr0sc4@group.calendar.google.com",

    # BE Mod 3 (ACCET): 
    # "<<<need-to-add-id>>>>"

    # FE Mod 1 (Student-facing):
    # "casimircreative.com_m6bndqol81h6jdlnpo0a6raot0@group.calendar.google.com"

    # FE Mod 1 (ACCET):
    # "c_a2e143c5dc2c7ceb868143108176d58ae83d20eed9110127dfad9c0c4310f9b6@group.calendar.google.com"

    # FE Mod 2 (Student-facing):
    # "casimircreative.com_cjiffoqvtajq43n5mn290cp744@group.calendar.google.com",

    # FE Mod 2 (ACCET):
    # "<<<need-to-add-id>>>>"

    # FE Mod 3 (Student-facing):
    # "casimircreative.com_krb9p35ck35m4uoji5d2715844@group.calendar.google.com",

    # FE Mod 3 (ACCET):
    # "c_2966b2af8c04f5b608f69eb6b481ee2fe5df783a97d2887e8fabe1a596cde701@group.calendar.google.com"

    # Combined Mod 4 (Student-facing):
    # "casimircreative.com_c1s3vspg5v09vh5cnnh88dn2nc@group.calendar.google.com",

    # Combined Mod 4 (ACCET):
    # "c_9a564174f13832587674dab4bbe74395bbbe1b1efe57f9e9a62ad467b8e65b6c@group.calendar.google.com"
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
