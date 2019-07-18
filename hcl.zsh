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
	slack presence active
	slack status edit --text "Prepping for the day $1" --emoji ":sunny:"
	slack chat send --text ":coffee: :cactus: $1" '#general'
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
	slack status edit --text "On a Call $1" --emoji ":phone:"
}
