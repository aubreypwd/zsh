#!/usr/local/bin/zsh

###
 # Harvest Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##

function morning {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp
	hcl note "Morning Chores: Checking E-mail, schedule, following up on tasks. $1"
	hcl unalias tmp
	slack presence active
	slack status edit "Morning Chores $1" :sunny:
}

function afk {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp
	hcl note "AFK $1"
	hcl unalias tmp
	slack presence away
	slack status edit "AFK $1" :brb:
}

function computer {
	hcl alias tmp 18928174 10776709 # 18928174 10776709	WDS Internal - Internal Activities - Computer issues
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	slack presence active
}

function call {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	slack presence away
	slack status edit "$1" :phone:
}
