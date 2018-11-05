# Calendar Shift

A little script that downloads the current Turing calendars in their iCalendar format and spits out new calendars with those events shifted into the future.

## Usage

```rb
$ bundle
$ bundle exec ruby scheduler.rb
```

When prompted, enter the Start and End dates for the module you want to copy.

In pretty much every case, the start date would be the **first Monday** of the previous module and the end date would be the **last Friday** of the previous module.
You can also enter a custom offset, but in most cases you will want 7 (6 week module + 1 week intermission). If it is a double intermission, you would enter 8.

The process should look like this:

```
worace @ calendar-shift ➸  bundle exec ruby scheduler.rb
Enter start date -- probably the first day of the last module:
<YYYY-MM-DD> (e.g. 2015-11-02)> 2016-05-09
Enter end date -- probably the last day of the last module:
<YYYY-MM-DD> (e.g. 2015-11-02)> 2016-06-17
Enter offset in # weeks:
(default: 7)>
```


### Adding a new calendar to the collection

From time to time you may decide you need to add a new calendar to the list that get scraped by the script. To do this, you need to add the new public (HTML) address for the calendar to the `CALENDARS` to the [calendar_collection.rb](https://github.com/turingschool/calendar-shift/blob/master/lib/calendar_collection.rb) file.


The address will look something like this `casimircreative.com_59k8msrrc2ddhcv787vubvp0s4@group.calendar.google.com`.

You can find it by going into the "Calendar Settings" menu on Google Calendar and scrolling down to the "Calendar Address" section and copying the "Calendar ID".

### Importing the calendar to Google Calendar

On the right side of calendar.google.com. there is a text field where you can search for co-workers calendars. To the right of it, there is a plus for add other calendars. Click it and then click import. You can then import the .ics file that was created and put in the Output folder.
