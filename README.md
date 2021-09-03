# Calendar Shift

A little script that downloads the current Turing calendars in their iCalendar format and spits out new calendars with those events shifted into the future.

## Installation

```
$ git clone git@github.com:turingschool/calendar-shift.git
$ cd calendar-shift
```

## Usage
First, open up the `lib/calendar_collection.rb` file and uncomment the calendar that you'd like to copy over. All other calendars should be commented out. If the calendar you'd like to copy isn't in that list, follow the steps outlined at the bottom of this README. 

*Note: If you don't have Ruby installed, you will need to do that now.*

Then, run the following in the terminal:
```
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
You''ll know that it worked, because you should see a new `.ics` file in the `output` folder. That's the file we're going to import into Google Calendar!

### Importing the calendar to Google Calendar

On the left toolbar in Google Calendar, click the + next to "Other calendars" and then click "Import." Where is says "Select file from your computer," upload the `.ics` file from the `output` folder. Click "Import" and the events should now appear as expected. 

### (if needed) Adding a new calendar to the collection

From time to time you may decide you need to add a new calendar to the list that get scraped by the script. To do this, you need to add the new public (HTML) address for the calendar to the `CALENDARS` to the [calendar_collection.rb](https://github.com/turingschool/calendar-shift/blob/master/lib/calendar_collection.rb) file.

The address will look something like this `casimircreative.com_59k8msrrc2ddhcv787vubvp0s4@group.calendar.google.com`.

You can find it by going into the settings for the specific calendar in Google Calendar and scrolling down to the "Integrate calendar" section and copying the "Calendar ID".
