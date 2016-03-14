# Calendar Shift

A little script that downloads the current Turing calendars in their iCalendar format and spits out new calendars with those events shifted into the future.

## Usage

```rb
$ bundle
$ bundle exec ruby scheduler.rb
```

### Adding a new calendar to the collection

From time to time you may decide you need to add a new calendar to the list that get scraped by the script. To do this, you need to add the new public (HTML) address for the calendar to the `CALENDARS` to the [calendar_collection.rb](https://github.com/turingschool/calendar-shift/blob/master/lib/calendar_collection.rb) file.


The address will look something like this `casimircreative.com_59k8msrrc2ddhcv787vubvp0s4@group.calendar.google.com`.

You can find it by going into the "Calendar Settings" menu on Google Calender and scrolling down to the "Calendar Address" section and copying the "Calendar ID".
