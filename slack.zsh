#!/usr/local/bin/zsh

###
 # Slack Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##

###
 # Slack: Here
 #
 # E.g:here
 #
 # @since 06-09-2019
 ##
function here {
	slack presence active
	slack status edit "" --emoji ""
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
	slack chat send --text ":back:" '#general'
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
	slack status edit --text "Working ($1), response may be delayed." --emoji ":computer:"
}

###
 # Do not disturb.
 #
 # E.g: dnd
 #
 # @since 06-09-2019
 ##
function dnd {
	slack presence away
	slack status edit --text "Do not distrub." --emoji ":computer:"
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
	slack status edit --text "$1" --emoji ""
	slack chat send --text ":wave: Signing off for the day!" '#general'
	hcl stop
}

###
 # Working on Something
 #
 # E.g: working
 #
 # @since 06-10-2019
 ##
function working {
	slack presence active
	slack status edit --text "Working $1" --emoji ":computer:"
}
