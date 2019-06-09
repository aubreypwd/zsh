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
 # E.g:  cpwd
 #
 # @since Wednesday, April 3, 2019
 ##
function pwdcopy {
	pwd | pbcopy
}

###
 # Clear out directories where files in them don't matter.
 #
 # E.g: clear [downloads|tmp]
 #
 # @since Monday, January 14, 2019
 ##
function empty {
	if [ '' = "$1" ]; then
		echo "Clear what: all, downloads, trash, tmp?"
		return
	fi

	if [ 'tmp' = "$1" ] || [ 'all' = "$1" ]; then
		echo "Clearing ~/tmp/*..."
		nohup rm -Rf ~/tmp/* >/dev/null 2>&1

		if [ 'all' != "$1" ]; then
			return;
		fi
	fi

	if [ 'downloads' = "$1" ] || [ 'all' = "$1" ]; then

		echo "Clearing ~/Downloads/*..."
		nohup rm -Rf ~/Downloads/* >/dev/null 2>&1

		if [ 'all' != "$1" ]; then
			return;
		fi
	fi

	if [ 'trash' = "$1" ] || [ 'all' = "$1" ]; then
		echo "Emptying Trashes..."
		nohup trash-empty >/dev/null 2>&1

		if [ 'all' != "$1" ]; then
			return;
		fi
	fi
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

