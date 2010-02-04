DLReminder
==========

This is a simple AppleScript that looks through all of the friends
that you have added to Delicious Library 2, and checks the due date of
any items they have borrowed. If the due date is tomorrow (or in the
past), an email is sent to them.

Only one email is sent per person, listing all of their due items. If
they have nothing due, they are not sent an email.

Requirements
------------

* Delicious Library 2 - this may work with Delicious Library 1, but I
  have not tested it.
* A Mac of some sort.

Installation
------------

First you should compile this to a .scpt file by opening it in
AppleScript Editor, then selecting 'Save As...' from the file menu. In
the 'File Format:' drop down, select 'Script' then click OK.

You can now add this to the DL scripts folder to run from the DL scripts
menu:

~/Library/Scripts/Applications/Delicious Library 2

If you would like to run this on a regular basis, you add it to a
daily or weekly event in iCal as a 'Script' alarm.


