#!/usr/local/bin/zsh

###
 # File Operations
 #
 # @since Saturday, June 8th 2019
 ##

###
 # Delete permanently.
 #
 # @since Wednesday, August 15, 2018
 ##
function delete {
	rm -Rf "$1"
}

###
 # Add comment to a file.
 #
 # E.g: comment "file.png" "comment"
 #
 # @since Tuesday, May 21, 2019
 ##
function comment {
	osascript -e 'on run {f, c}' -e 'tell app "Finder" to set comment of (POSIX file f as alias) to c' -e end "$1" "$2" > /dev/null 2>&1
}

###
 # Is something WDS Coding Standards compliant?
 #
 # @since 6/24/2019
 #
 # E.g: wdscs ./
 ##
# function wdscs {
# 	phpcs --standard="WebDevStudios" "$1"
# }

###
 # Compress video.
 #
 # @since Tuesday, November 6, 2018
 #
 # E.g:  compress-video *.mov
 ##
function compress-video {
	f=$(basename -- "$1")
	e="${f##*.}"
	ffmpeg -i "$1" -vcodec libx264 -crf 20 -y "$1-compressed.$e"
}

###
 # Copy the current directory path.
 #
 # E.g:  pwdcp
 #
 # @since Wednesday, April 3, 2019
 ##
function pwdcp {
	pwd | pbcopy
}

###
 # Download audio from a youtube video.
 #
 # @since Wednesday, January 2, 2019
 #
 # E.g: youtube-mp3 "<video URL>"
 ##
function youtube-mp3 {
	youtube-dl --extract-audio --audio-format mp3 "$1"
}

###
 # Similar to cd, but using fzf.
 #
 # E.g: fd
 #
 # @since Wednesday, 9/11/2019
 ##
function fd {
	DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux` \
		&& cd "$DIR"
}

###
 # Goto a site.
 #
 # E.g: valet
 #
 # @since Tuesday, April 23, 2019
 ##
function site {
	cd "$HOME/Sites" || return
	fd

	if [ -e "app/public/wp-content/.git" ]; then
		cd "app/public/wp-content" || return
		return
	fi

	if [ -e "app/public" ]; then
		cd "app/public" || return
	fi
}

###
 # Wrapper or aria2c
 #
 # E.g: download ["http://..."] [How many connections]
 #
 # @since Tuesday, May 21, 2019
 ##
function download {
	if [ "" = "$2" ]; then
		connections="1"
	else
		connections="$2"
	fi

	aria2c -x "$connections" "$1"
}
