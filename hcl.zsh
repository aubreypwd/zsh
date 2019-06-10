#!/usr/local/bin/zsh

###
 # Harvest Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##

###
 # Morning Chores
 #
 # E.g: morning
 #
 # @since 06-09-2019
 ##
function morning {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp
	hcl note "Morning Chores: Checking E-mail, schedule, following up on tasks. $1"
	hcl unalias tmp
	slack presence active
	slack status edit --text "Morning Chores $1" --emoji ":sunny:"
}

###
 # Away from Keyboard
 #
 # E.g: afk
 #
 # @since 06-09-2019
 ##
function afk {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp
	hcl note "AFK $1"
	hcl unalias tmp
	slack presence away
	slack status edit --text "AFK $1" --emoji ":brb:"
}

###
 # Working on Computer
 #
 # E.g: computer
 #
 # @since 06-09-2019
 ##
function computer {
	hcl alias tmp 18928174 10776709 # 18928174 10776709	WDS Internal - Internal Activities - Computer issues
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	slack presence active
}

###
 # On a Call
 #
 # E.g: call
 #
 # @since 06-09-2019
 ##
function call {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	slack presence away
	slack status edit --text "$1" --emoji ":phone:"
}
