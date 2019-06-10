#!/usr/local/bin/zsh

###
 # Slack Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##

function here {
	slack presence active
	slack status edit ""
}

function back {
	here
}

function working {
	slack presence active
	slack status edit "Working ($1), response may be delayed." :computer:
}
