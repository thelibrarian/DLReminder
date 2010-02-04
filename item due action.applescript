set appfolder to "/Users/tony/dev/library automator/"
set lockfile to appfolder & ".lock-" & date_format()

to date_format()
	set {year:y, month:m, day:d} to (current date)
	(y * 10000 + m * 100 + d) as string
end date_format

tell application "Finder"
	if exists POSIX file lockfile then
		return
	else
		do shell script "rm \"" & appfolder & "\".lock-*; touch \"" & lockfile & "\""
	end if
end tell

tell application "Delicious Library 2"
	tell front document
		repeat with myFriend in friends
			set dueItems to {}
			repeat with loanItem in every loan of myFriend
				if (((due date of loanItem) - (current date)) div days) < 1 then
					set dueItems to dueItems & {loanItem}
				end if
			end repeat
			if dueItems is not {} then
				set toname to (myFriend's first name) & " " & (myFriend's last name)
				display dialog toname
				set toemail to myFriend's email
				set mBody to "Hi " & (myFriend's first name) & "," & return & return & "These items are now due, and should be returned to the Design Library tomorrow:" & return & return
				repeat with dueItem in dueItems
					set mBody to mBody & " * " & (name of (medium of dueItem)) & return
				end repeat
				set mBody to mBody & return & "Thank you," & return & "The Design Library."
				tell application "Mail"
					set newMessage to make new outgoing message with properties {visible:true, subject:"Library items due!", content:mBody}
					tell newMessage
						make new to recipient at end of to recipients with properties {name:toname, address:toemail}
					end tell
					activate
					send newMessage
				end tell
			end if
		end repeat
	end tell
end tell
