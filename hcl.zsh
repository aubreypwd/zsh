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
		education $@
	}

function downtime {
	hcl alias tmp 18928174 10776656
	hcl start @tmp
	hcl unalias tmp

	if [ $1 != "" ]; then
		hcl note "$1"
	fi
}

function non-billable {
	hcl alias tmp 18928174 10776710
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	working "$1"
}

	function nb {
		non-billable $@
	}

function morning {
	slack presence active
	slack status edit --text "Prepping for the day $1" --emoji ":sunny:"
	slack chat send --text ":coffee: :cactus: $1" '#general'
	hcl alias tmp 18928174 10776708
	hcl start @tmp
	hcl note "Morning chores, emails, task catchup, etc."
}

function computer {
	hcl alias tmp 18928174 10776709
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp
	here
}

function note {
	hcl note "$1"
}

function call {
	hcl alias tmp 18928174 10776708 # 18928174 10776708	WDS Internal - Internal Activities - Calls, scrum, chats, or emails
	hcl start @tmp
	hcl note "$1"
	hcl unalias tmp

	slack presence away
	slack status edit --text "On a Call $1" --emoji ":phone:"
}
