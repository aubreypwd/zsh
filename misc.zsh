#!/usr/local/bin/zsh

###
 # Get the time.
 #
 # E.g: thetime
 ##
function date {
	/bin/date | pbcopy
	/bin/date
}
