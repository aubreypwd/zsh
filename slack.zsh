#!/usr/local/bin/zsh

###
 # Slack Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##

###
 # Slack: Here
 #
 # E.g: here [?x (To exit after)]
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
 # E.g: back [?x (To exit after)]
 #
 # @since 06-09-2019
 ##
function back {
	here
	hcl stop
}

###
 # Away from Keyboard
 #
 # E.g: afk [Why...] [?x (To exit after)]
 #
 # @since 06-09-2019
 ##
function afk {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp

	hcl note "AFK (Coffee, small break, etc) $1"
	hcl unalias tmp
	slack presence away

	slack status edit --text "AFK $1" --emoji ":brb:"
}

###
 # I'm Working
 #
 # E.g: working [On what...] [?x (To exit after)]
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
 # E.g: dnd [Why...] [?x (To exit after)]
 #
 # @since 06-09-2019
 ##
function dnd {
	slack presence away
	slack status edit --text "Do not distrub ($1)." --emoji ":computer:"
}

###
 # Offline (Sign Off)
 #
 # E.g: off [Offline Message] [?x (To exit after)]
 #
 # @since 06-09-2019
 ##
function off {
	slack presence away
	slack status edit --text "" --emoji ""
	slack chat send --text ":wave: Signing off for the day!" '#general'
	hcl stop
}
