tell application "iCal"
	set myCal to calendar "Library Loans"
	repeat with myevent in every event of myCal
		if not (exists open file alarm of myevent) then
			if (start date of myevent) > (current date) then
				tell myevent
					make new open file alarm at end with properties {trigger interval:-1440, filepath:"/Users/tony/dev/library automator/item due action.app"}
				end tell
			end if
		end if
	end repeat
end tell