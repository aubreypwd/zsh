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
		if [[ "$@" = *"-a"* ]]; then
			slack chat send --text ":back:" '#general'
		fi
	fi
}

	function back {
		here -b "$@"
	}

###
 # Away from Keyboard
 #
 # E.g.:
 #
 #     afk [-a Announce in Slack]
 #
 # @since 06-09-2019
 ##
function afk {
	slack presence away
	slack status edit --text "A.F.K." --emoji ":brb:"
	# downtime "AFK $1" # Greg says I don't have to track this.
	hcl stop

	# away -a (Announce on Slack)
	if [[ "$@" = *"-a"* ]]; then
		slack chat send --text "A.F.K., brb" '#general'
	fi
}

###
 # Announce something on Slack #general.
 #
 # E.g: announce [message]
 #
 # @since 8/19/2019
 ##
function announce {
	slack chat send --text "$1" '#general'
}

###
 # Working
 #
 # @since 06-09-2019
 ##
function working {
	slack presence active
	slack status edit --text "Working (response may be slightly delayed)." --emoji ":computer:"
}

###
 # Do not disturb.
 #
 # E.g.:
 #
 #     dnd [-a Announce on Slack]
 #
 # @since 06-09-2019
 ##
function dnd {
	slack presence away
	slack status edit --text "Do not disturb (responses will be delayed until I'm done)." --emoji ":computer:"

	if [[ "$@" = *"-a"* ]]; then
		slack chat send --text "Going DND, responses will be delayed until I'm done." '#general'
	fi
}

###
 # Offline (Sign Off)
 #
 # E.g.: off [-a] [-q]
 #
 # @since 06-09-2019
 ##
function off {
	slack presence away
	slack status clear
	hcl stop

	if [[ "$@" = *"-a"* ]]; then
		slack chat send --text ":wave: Signing off for the day!" '#general'
	fi

	# off -q (Quit Apps)
	if [[ "$@" = *"-q"* ]]; then
		close-work-apps
	fi
}

	function offline {
		off "$@"
	}
