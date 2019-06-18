#!/usr/local/bin/zsh

###
 # Harvest Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##

###
 # Morning Chores
 #
 # E.g: morning [?x (To exit after)]
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
	slack chat send --text "Morning! :coffee: :cactus: :sunny: :wave:" '#general'
}

###
 # Working on Computer
 #
 # E.g: computer [?x (To exit after)]
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
 # Add a quick note to current timeer.
 #
 # E.g: note ["My note"]
 #
 # @since 6/17/2019
 ##
function note {
	hcl note "$1"
}

###
 # On a Call
 #
 # E.g: call [?x (To exit after)]
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
