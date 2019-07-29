#!/usr/local/bin/zsh

###
 # Harvest Shortcuts
 #
 # @since 06-09-2019 05-43PM
 ##
 #

# Harvest Aliases
# 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
# 18928174 10776709	WDS Internal - Internal Activities - Computer issues
# 18928174 10776659	WDS Internal - Internal Activities - Continuing Education
# 18928174 10776710	WDS Internal - Internal Activities - Other Internal projects
# 18928174 10797281	WDS Internal - Internal Activities - Peer Performance Reviews
# 18928174 10776656	WDS Internal - Internal Activities - Task switching

function education {
	hcl alias tmp 18928174 10776659
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	here
}

	function edu {
		education "$@"
	}

###
 # Track Downtime
 #
 # @since 7/29/2019
 ##
function downtime {
	hcl alias tmp 18928174 10776656
	hcl start @tmp
	hcl unalias tmp

	if [ "$1" = "" ]; then
		return
	fi

	hcl note "$1"
}

###
 # Track non-billable time.
 #
 # @since 7/29/2019
 ##
function non-billable {
	hcl alias tmp 18928174 10776710
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	working "$1"
}

	function nb {
		non-billable "$@"
	}

###
 # Morning Chores
 #
 # @since 7/29/2019
 ##
function morning {
	slack presence active
	slack status edit --text "Prepping for the day $1" --emoji ":sunny:"
	slack chat send --text ":coffee: :cactus: $1" '#general'
	hcl alias tmp 18928174 10776708
	hcl start @tmp
	hcl note "Morning chores, emails, task catchup, etc."
}

###
 # Computer Stuff
 #
 # @since 7/29/2019
 ##
function computer {
	hcl alias tmp 18928174 10776709
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	here
}

###
 # Note something in current task.
 #
 # @since 7/29/2019
 ##
function note {

	# note "Something" (Adds a note to Harvest)
	hcl note "$1"
}

###
 # On a Call
 #
 # Starts a default timer with internal activities,
 # but you can change later.
 #
 # @since 7/29/2019
 ##
function call {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp

	slack presence away
	slack status edit --text "On a Call $1" --emoji ":phone:"
}
