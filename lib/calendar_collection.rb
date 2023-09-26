require 'icalendar'
require './lib/calendar'

class CalendarCollection
  include Enumerable

  attr_reader :calendars

  CALENDARS = [
    # BE Mod 1 (Student-facing):
    # "casimircreative.com_59k8msrrc2ddhcv787vubvp0s4@group.calendar.google.com",

    # BE Mod 1 (ACCET): 
    # "c_0c5aff6d4d2b9ae35f46fb9203691606beaa22d4b37b2c17a361b31add08ca26@group.calendar.google.com"

    # BE Mod 2 (Student-facing):
    # "casimircreative.com_rps2hg1nfqjih4rcl3gl6s4lpk@group.calendar.google.com",

    # BE Mod 2 (ACCET): 
    # "c_c02d6f7447fbb15503240bcd0d261e4a36a24f430f71e995df08197437872326@group.calendar.google.com"

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
    # "c_eb5b0f57415f70f50d7f6b3fc0898700e8399dc7f6ad83dedbaf7850e2de1b50@group.calendar.google.com",

    # FE Mod 3 (Student-facing):
    # "casimircreative.com_krb9p35ck35m4uoji5d2715844@group.calendar.google.com",

    # FE Mod 3 (ACCET):
    # "c_2966b2af8c04f5b608f69eb6b481ee2fe5df783a97d2887e8fabe1a596cde701@group.calendar.google.com"

    # Combined Mod 4 (Student-facing):
    # "casimircreative.com_c1s3vspg5v09vh5cnnh88dn2nc@group.calendar.google.com",

    # Combined Mod 4 (ACCET):
    # "c_9a564174f13832587674dab4bbe74395bbbe1b1efe57f9e9a62ad467b8e65b6c@group.calendar.google.com"

    # Launch Mod 1 (Student-facing):
    # "c_2o0kim19g8e75ag554m39v2ijs@group.calendar.google.com",

    # Launch Mod 2 (Student-facing):
    # "c_0e418906e01b04dbb4af2f3d1ff6757e3c3c6c432ce6f6f5d770705b5cb5c99a@group.calendar.google.com",

    # Launch Mod 3 (Student-facing):
    # "c_7337f3e40f326675a03c46d87288af589a8bd5d0cbc6298107b17617558dbb71@group.calendar.google.com",

    # Launch Mod 4 (Student-facing):
    # "c_36e04c3647362d655f537eb19e1ad42316b30c1db8693f5138135259349020ff@group.calendar.google.com",

    # Launch Mod 5 (Student-facing):
    # "c_a114e0d0ee348991aa2d3722965a13747e38e39fe29604f9972d8762e321798a@group.calendar.google.com",

    # Launch Mod 6 (Student-facing):
    # Not_Yet_Created
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
