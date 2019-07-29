#!/usr/local/bin/zsh

mkdir -p "$HOME/Applications/Nativefied"
native_install_dir="$HOME/Applications/Nativefied"
installed_file="$native_install_dir/.installed"

if [ ! -e "$installed_file" ]; then
	install-apps
fi

###
 # Download icon for use with nativefier.
 #
 # @since 7/29/2019
 ##
function install-app-get-icon {
	filename=$(date "+%s")
	to="$filename.png"
	out="$HOME/Downloads/$to"

	aria2c -x1 "$1" -o "$out"

	if [ ! -e "$out" ]; then
		echo "$out does not exist."
		return;
	fi

	echo "Downloaded $1 to $out"
	echo "{$out}"
}

###
 # Install Nativefied Apps
 #
 # @since 7/29/2019
 ##
function install-natified-apps {

	## tlk.io
	nativefier -n "tlk.io" -i $(install-app-get-icon 'https://img.icons8.com/cotton/2x/filled-chat.png') --flash --width="500" "https://tlk.io/aubreypwd" "$native_install_dir"

	# Poolside.fm
	nativefier -n "Poolside.fm" -i $(install-app-get-icon "http://pic2.orsoon.com/2017/0401/20170401115748603.png") --flash --width="355" --height="460" "https://poolside.fm/" "$native_install_dir"

	# iHeart Radio
	nativefier -n "iHeart Radio" -i $(install-app-get-icon "https://www.androidpolice.com/wp-content/uploads/2017/01/nexus2cee_iheart-radio-round-icon.png") --flash --internal-urls "(.*?)(facebook\.com|www\.facebook\.com/|www.iheart\.com)(.*?)" "https://www.iheart.com/my/stations/" "$native_install_dir"

	# Bandcamp
	nativefier -n "Bandcamp" -i $(install-app-get-icon "https://www.shareicon.net/download/2017/03/29/881762_audio_512x512.png") "https://bandcamp.com/aubreypwd/following/artists_and_labels" "$native_install_dir"

	# Google Voice
	nativefier -n "Google Voice" -i $(install-app-get-icon "https://lh3.googleusercontent.com/bYC5b3iqlamVWBCjGVuoDD4K0lv1q4QDXlpQoGWuFCOQGzHkoAUDNsUUO0Jkfuz7Yw") "https://voice.google.com/messages" "$native_install_dir"

	# Google Calendar
	nativefier -n "Google Calendar" "https://calendar.google.com" "$native_install_dir"

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
	hide "iTerm2"
}
