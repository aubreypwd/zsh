#!/usr/local/bin/zsh

###
 # Slack Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##

###
 # Slack: Here
 #
 # E.g: here
 #
 # @since 06-09-2019
 ##
function here {
	slack presence active
	slack status clear
}

###
 # I'm Back
 #
 # E.g: back
 #
 # @since 06-09-2019
 ##
function back {
	here

	if [ "--from-break" = $1 -o "-fb" = $1 -o "break" = $1 -o "-b" = $1 ]; then
		slack chat send --text ":back:" '#general'
	fi
}

###
 # When I am away e.g. lunch, not a break.
 #
 # @since 7/18/2019
 ##
function on-break {
	slack presence away
	afk

	if [ "" = $1 ]; then
		return
	fi

	slack chat send --text "$1" '#general'
}

###
 # Away from Keyboard
 #
 # E.g: afk [Why...]
 #
 # @since 06-09-2019
 ##
function afk {
	slack presence away
	slack status edit --text "AFK $1" --emoji ":brb:"
}

###
 # I'm Working
 #
 # E.g: working [On what...]
 #
 # @since 06-09-2019
 ##
function working {
	slack presence active
	slack status edit --text "Working $1, response may be slightly delayed." --emoji ":computer:"
}

###
 # Do not disturb.
 #
 # E.g: dnd [Why: "..."] [How long: "1 hour"]
 #
 # @since 06-09-2019
 ##
function dnd {
	slack presence away
	slack status edit --text "Do not disturb $1, responses will be delayed until I'm done." --emoji ":computer:"
}

function quit {
	if [ -z $(pgrep -x "$1") ]; then
		return;
	fi

	osascript -e "quit app \"$1\"" > /dev/null
}

function hide {
	running=$(pgrep -x "$1")

	if [ -z "$running" ]; then
		return;
	fi

	osascript -e "tell application \"System Events\" to tell process \"$1\" to set visible to false" > /dev/null
}

function close-work-apps {
	quit "Slack"
	quit "Sublime Text"
	quit "Harvest"
	quit "Table Plus"
	quit "Google Chrome"
	quit "Tick Tick"

	hide "iTerm2"
	hide "Calendar"
	hide "Mail"
}

###
 # Offline (Sign Off)
 #
 # E.g: off [Offline Message]
 #
 # @since 06-09-2019
 ##
function off {
	slack presence away
	slack status clear
	slack chat send --text ":wave: Signing off for the day! $1" '#general'
	hcl stop

	if [ $2 = "quit" -o $1 = "quit" ]; then
		close-work-apps
	fi
}
