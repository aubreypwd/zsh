#!/usr/local/bin/zsh

# Make the hummus sounds more pleasant.
# rm "/Applications/Slack.app/Contents/Resources/hummus.mp3" && ffmpeg -i "/System/Library/Sounds/Pop.aiff" "/Applications/Slack.app/Contents/Resources/hummus.mp3" &> /dev/null


function beep {
	osascript -e beep
}

	function b {
		beep
	}

		function d {
			say "Done"
		}
