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
	nativefier -n "tlk.io" -i "$HOME/iCloud/Icons/chat.png" --flash --width="500" "https://tlk.io/aubreypwd" "$native_install_dir"
	nativefier -n "Poolside.fm" -i "$HOME/iCloud/Icons/poolside.png" --flash --width="355" --height="460" "https://poolside.fm/" "$native_install_dir"
	nativefier -n "Google Voice" -i "$HOME/iCloud/Icons/google-voice.png" "https://voice.google.com/messages" "$native_install_dir"
	nativefier -n "Chillhop Radio" -i "$HOME/iCloud/Icons/chillhop.png" --internal-urls "(.*?)(.*\.chillhop\.com|.*\.facebook\.com)(.*?)" "https://chillhop.com/" "$native_install_dir"
	nativefier -n "JazzRadio.com" -i "$HOME/iCloud/Icons/jazz-radio.png" --internal-urls "(.*?)(.*\.jazzradio\.com|.*\.facebook\.com)(.*?)" "https://www.jazzradio.com/#favorites" "$native_install_dir"
	nativefier -n "Instagram" -i "$HOME/iCloud/Icons/instagram.png" "https://instagram.com" "$native_install_dir"
	nativefier -n "Facebook" -i "$HOME/iCloud/Icons/facebook.png" "https://facebook.com" "$native_install_dir"
	nativefier -n "Amazon" -i "$HOME/iCloud/Icons/amazon.png" "https://amazon.com/" "$native_install_dir"

	nativefier -n "Out of Milk" -i "$HOME/iCloud/Icons/oom.png" "https://www.outofmilk.com/ShoppingList.aspx?signin=1" "$native_install_dir"
	cp -Rfva "$installed_file/*-darwin-x64/*.app" "/tmp/apps"


	# nativefier -n "iHeart Radio" -i "$HOME/iCloud/Icons/i-heart-radio.png" --flash --internal-urls "(.*?)(facebook\.com|www\.facebook\.com/|www.iheart\.com)(.*?)" "https://www.iheart.com/my/stations/" "$native_install_dir"
	# nativefier -n "Bandcamp" -i "$HOME/iCloud/Icons/bandcamp.png" "https://bandcamp.com/aubreypwd/following/artists_and_labels" "$native_install_dir"
	# nativefier -n "Alan Watts Radio" -i "$HOME/iCloud/Icons/alan-watts.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://www.youtube.com/embed/fGu88738Sh8?autoplay=1" "$native_install_dir"
	# nativefier -n "Write.as" -i "$HOME/iCloud/Icons/write-as.png" "https://write.as/" "$native_install_dir"
	# nativefier -n "Calm Radio" -i "$HOME/iCloud/Icons/calmradio.png" --internal-urls "(.*?)(.*\.calmradio\.com)(.*?)" "https://calmradio.com/en/" "$native_install_dir"
	# nativefier -n "Harvest Forecast" -i "$HOME/iCloud/Icons/harvest-forecast.png" --internal-urls "(.*?)(*.forecastapp.com)(.*?)" "https://forecastapp.com/485680/schedule/team?filter=Aubrey%20Portwood" "$native_install_dir"
	# nativefier -n "Messenger" -i "$HOME/iCloud/Icons/messenger.png" --internal-urls "(.*?)(.*\.messenger\.com|.*\.facebook\.com)(.*?)" "https://www.messenger.com/login/" "$native_install_dir"
	# nativefier -n "Youtube" -i "$HOME/iCloud/Icons/youtube.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://youtube.com/" "$native_install_dir"
	# nativefier -n "Google Calendar" "https://calendar.google.com" "$native_install_dir"
	# nativefier -n "Local by Flywheel Exports" -i "$HOME/iCloud/Icons/export.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://drive.google.com" "$native_install_dir"
	# nativefier -n "Jira" -i "$HOME/iCloud/Icons/jira.png" --internal-urls "(.*?)(.*\.atlassian\.net|.*\.google\.com|platform.harvestapp.com|*bitbucket.org)(.*?)" "https://webdevstudios.atlassian.net/jira/" "$native_install_dir"
	# nativefier -n "Buddy.Works" -i "$HOME/iCloud/Icons/buddy-works.png" --internal-urls "(.*?)(app.buddy.works)(.*?)" "https://app.buddy.works/" "$native_install_dir"

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

	function update-apps {
		update-natified-apps
	}

	function updateapps {
		update-natified-apps
	}
