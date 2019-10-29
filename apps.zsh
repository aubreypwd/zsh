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
	nativefier -n "Alan Watts Radio" -i "$native_install_dir/.icons/alan-watts.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://www.youtube.com/embed/fGu88738Sh8?autoplay=1" "$native_install_dir"
	nativefier -n "Facebook" -i "$native_install_dir/.icons/facebook.png" --internal-urls "(.*?)(.*\.messenger\.com|.*\.facebook\.com)(.*?)" "https://facebook.com" "$native_install_dir"
	# nativefier -n "Harvest Forecast" -i "$native_install_dir/.icons/harvest-forecast.png" --internal-urls "(.*?)(*.forecastapp.com)(.*?)" "https://forecastapp.com/485680/schedule/team?filter=Aubrey%20Portwood" "$native_install_dir"
	# nativefier -n "Messenger" -i "$native_install_dir/.icons/messenger.png" --internal-urls "(.*?)(.*\.messenger\.com|.*\.facebook\.com)(.*?)" "https://www.messenger.com/login/" "$native_install_dir"
	# nativefier -n "Youtube" -i "$native_install_dir/.icons/youtube.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://youtube.com/" "$native_install_dir"
	# nativefier -n "Google Calendar" "https://calendar.google.com" "$native_install_dir"
	# nativefier -n "Local by Flywheel Exports" -i "$native_install_dir/.icons/export.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://drive.google.com" "$native_install_dir"
	# nativefier -n "Jira" -i "$native_install_dir/.icons/jira.png" --internal-urls "(.*?)(.*\.atlassian\.net|.*\.google\.com|platform.harvestapp.com|*bitbucket.org)(.*?)" "https://webdevstudios.atlassian.net/jira/" "$native_install_dir"
	# nativefier -n "Buddy.Works" -i "$native_install_dir/.icons/buddy-works.png" --internal-urls "(.*?)(app.buddy.works)(.*?)" "https://app.buddy.works/" "$native_install_dir"

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
