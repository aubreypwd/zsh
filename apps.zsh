#!/usr/local/bin/zsh

mkdir -p "$HOME/Applications/Nativefied"
native_install_dir="$HOME/Applications/Nativefied"
installed_file="$native_install_dir/.installed"

if [ ! -e "$installed_file" ]; then
	install-apps
fi

###
 # Install Nativefied Apps
 #
 # @since 7/29/2019
 ##
function install-natified-apps {

	nativefier -n "tlk.io" -i "$native_install_dir/.icons/chat.png" --flash --width="500" "https://tlk.io/aubreypwd" "$native_install_dir"
	nativefier -n "Poolside.fm" -i "$native_install_dir/.icons/poolside.png" --flash --width="355" --height="460" "https://poolside.fm/" "$native_install_dir"
	nativefier -n "iHeart Radio" -i "$native_install_dir/.icons/i-heart-radio.png" --flash --internal-urls "(.*?)(facebook\.com|www\.facebook\.com/|www.iheart\.com)(.*?)" "https://www.iheart.com/my/stations/" "$native_install_dir"
	nativefier -n "Bandcamp" -i "$native_install_dir/.icons/bandcamp.png" "https://bandcamp.com/aubreypwd/following/artists_and_labels" "$native_install_dir"
	nativefier -n "Google Voice" -i "$native_install_dir/.icons/google-voice.png" "https://voice.google.com/messages" "$native_install_dir"
	nativefier -n "Youtube" -i "$native_install_dir/.icons/youtube.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://youtube.com/" "$native_install_dir"
	nativefier -n "Google Calendar" "https://calendar.google.com" "$native_install_dir"
	nativefier -n "Alan Watts Radio" -i "$native_install_dir/.icons/alan-watts.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://www.youtube.com/embed/fGu88738Sh8?autoplay=1" "$native_install_dir"

	touch "$installed_file" # Flagged as installed.
	echo "Done!"
}

###
 # Update all Nativefied apps.
 #
 # @since 7/29/2019
 ##
function update-natified-apps {
	install-natified-apps
}

###
 # Quit an App.
 #
 # E.g.: quit "Google Chrome"
 #
 # @since 7/29/2019
 ##
function quit {
	if [ -z $(pgrep -x "$1") ]; then
		return;
	fi

	osascript -e "quit app \"$1\"" > /dev/null
}

###
 # Hide an App
 #
 # E.g: hide "Google Chrome"
 #
 # @since 7/29/2019
 ##
function hide {
	running=$(pgrep -x "$1")

	if [ -z "$running" ]; then
		return;
	fi

	osascript -e "tell application \"System Events\" to tell process \"$1\" to set visible to false" > /dev/null
}

###
 # Close work apps after work.
 #
 # @since 7/29/2019
 ##
function close-work-apps {
	quit "Slack"
	quit "Sublime Text"
	quit "Harvest"
	quit "Sequel Pro"
	quit "Google Chrome"
	quit "Google Calendar"
	quit "Mail for Gmail"
	quit "Local by Flywheel"
	quit "Spark"
	hide "iTerm2"
}
