#!/usr/local/bin/zsh

###
 # Slack Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##

###
 # Just Here
 #
 # @since 06-09-2019
 ##
function here {
	slack presence active
	slack status clear

	# here -b
	if [[ "$@" = *"-b"* ]]; then
		slack chat send --text ":back:" '#general'
	fi
}

	function back {
		here "$@"
	}

###
 # Away from Keyboard
 #
 # E.g.:
 #
 #     afk          (Set status only)
 #     afk "foo"    (Set status with message)
 #     afk -a       (Set status and announce on Slack)
 #     afk "foo" -a (Announce on Slack)
 #
 # @since 06-09-2019
 ##
function afk {
	slack presence away
	slack status edit --text "AFK $1" --emoji ":brb:"
	# downtime "AFK $1" # Greg says I don't have to track this.

	# away -a (Announce on Slack)
	if [[ "$@" = *"-a"* ]]; then
		slack chat send --text "AFK $1" '#general'
	fi
}

###
 # Working
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
 # E.g.:
 #
 #     dnd          (Set status only)
 #     dnd "foo"    (Set status with message)
 #     dnd -a       (Announce on Slack)
 #     dnd "bar" -a (Set status w/ message and announce on Slack)
 #
 # @since 06-09-2019
 ##
function dnd {
	slack presence away
	slack status edit --text "Do not disturb $1, responses will be delayed until I'm done." --emoji ":computer:"

	if [[ "$@" = *"-a"* ]]; then
		slack chat send --text "Going DND $1, responses will be delayed until I'm done." '#general'
	fi
}

###
 # Offline (Sign Off)
 #
 # @since 06-09-2019
 ##
function off {
	slack presence away
	slack status clear
	hcl stop

	# off -a (Announce on Slack)
	if [[ "$@" = *"-a"* ]]; then
		slack chat send --text ":wave: Signing off!" '#general'
	fi

	# off -q (Quit Apps)
	if [[ "$@" = *"-q"* ]]; then
		close-work-apps
	fi
}

	function offline {
		off "$@"
	}
