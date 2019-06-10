#!/usr/local/bin/zsh

###
 # Get the date.
 #
 # E.g: thedate
 #
 # @since 06-09-2019
 ##
function thedate {
	/bin/date +"%m-%d-%Y" | pbcopy
	/bin/date +"%m-%d-%Y"
}

###
 # Get the time.
 #
 # E.g: thetime
 #
 # @since 06-09-2019
 ##
function thetime {
	/bin/date +"%I-%M%p" | pbcopy
	/bin/date +"%I-%M%p"
}

###
 # The date and time.
 #
 # E.g: thedatetiem
 #
 # @since 06-09-2019 05-25PM
 ##
function thedatetime {
	time=$(thetime)
	date=$(thedate)
	datetime="$date $time"

	echo "$datetime" | pbcopy
}
