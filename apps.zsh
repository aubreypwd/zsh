#!/usr/local/bin/zsh

mkdir -p "$HOME/Applications/Nativefied"

local_native_install_dir="$HOME/Applications/Nativefied"

# Hide Dock Icons
# /usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/zoom.us.app/Contents/Info.plist &> /dev/null

###
 # Nativefy an app.
 #
 # E.g: nativefy [Name] [URL] [ICON PATH] [INTERNAL URLS]
 #
 # @since Wednesday, 8/12/2020
 ##
function nativefy {
	local name="$1"
	local url="$2"
	local internal_urls="$4"
	local icon="$3"
	local extra_flags="$5 $6 $7 $8 $9"

	echo "Flags: $extra_flags"

	local folder="/tmp/$name-darwin-x64"
	local dot_app_folder="$folder/$name.app"
	local root_app="/Applications/$name.app"
	local local_app="$local_native_install_dir/$name-darwin-x64"

	local flags="--flash"

	if ! [ -z "$internal_urls" ]; then
		flags="$flags --internal-urls=\"$internal_urls\""
	fi

	if ! [ -z "$icon" ]; then
		flags="$flags -i \"$icon\""
	fi

	local cmd="nativefier -n \"$name\" $flags \"$url\" \"/tmp\" $extra_flags"

	echo "\nRunning: $cmd\n"
	eval $cmd

	if [ -d "$root_app" ]; then
		delete "$root_app"
	fi

	if [ -d "$local_app" ]; then
		delete "$local_app" # Delete the old school one.
	fi

	mv -f "$dot_app_folder" "/Applications"
	comment "/Applications/$name.app" "Nativefied"
}

	###
	 # Install natified apps to /Applications.
	 #
	 # E.g: nativefy-apps
	 #
	 # @since Wednesday, 8/12/2020
	 ##
	function nativefy-apps {

		# Setup CSS files in /tmp for injecting later.
		echo "header > *:first-child { margin-left: 66px }" > /tmp/header-margin-left.css
		echo "header > *:first-child { position: relative; left: 66px; }" > /tmp/header-position-left.css
		echo "body { -webkit-app-region: drag; }" > /tmp/body-draggable.css
		echo "header { -webkit-app-region: drag; }" > /tmp/header-draggable.css
		echo "$(cat /tmp/header-position-left.css) $(cat /tmp/header-draggable.css)" > /tmp/header-position-left-draggable.css
		echo "$(cat /tmp/header-margin-left.css) $(cat /tmp/header-draggable.css)" > /tmp/header-margin-left-draggable.css

		# Some easily injectible flags.
		local hidden_titlebar="--title-bar-style hidden --hide-window-frame"
		local inset_titlebar="--title-bar-style hiddenInset --hide-window-frame"

		npm install -g nativefier # Update nativefier

		###
		 # Apps
		 ##
		nativefy "Local by Flywheel Backups" "https://drive.google.com/drive/my-drive" "$HOME/iCloud/Icons/lbf.png" "(.*?drive\.google\.com.*?|.*?accounts\.google\.com.*?)" "$hidden_titlebar" --inject=/tmp/header-draggable.css --user-agent "\"Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0\""
		nativefy "USAA" "https://www.usaa.com/inet/ent_home/CpHome?action=INIT&action=INIT&wa_ref=pri_auth_nav_home" "$HOME/iCloud/Icons/usaa.png" "" --width="970" --height="868" "$hidden_titlebar" --inject=/tmp/header-position-left-draggable.css
		nativefy "Google Voice" "https://voice.google.com/messages" "$HOME/iCloud/Icons/google-voice.png" "" "$hidden_titlebar" --inject=/tmp/header-draggable.css
		nativefy "Harvest Forecast" "https://forecastapp.com/485680/schedule/team?filter=portwood" "$HOME/iCloud/Icons/harvest-forecast.png" ".*(google|harvest|forecast).*" "$inset_titlebar" --inject=/tmp/header-position-left-draggable.css
		nativefy "RETROWAVE Radio" "https://retrowave.ru/" "$HOME/iCloud/Icons/retrowave-radio.png" "" --width="677" --height="837" "$inset_titlebar" --inject=/tmp/body-draggable.css
	}

###
 # Install Nativefied Apps
 #
 # @since 7/29/2019
 ##
function install-natified-apps {
	npm install -g nativefier # Update nativefier
	delete "$local_native_install_dir"

	# nativefier -n "Github" "https://github.com/" "$local_native_install_dir" --internal-urls ".*git.*"
	# nativefier -n "Harvest Forecast" -i "$HOME/iCloud/Icons/harvest-forecast.png" --internal-urls ".*(google|harvest|forecast).*" "https://forecastapp.com/485680/schedule/team?filter=portwood" "$local_native_install_dir"
	# nativefier -n "GMail" "https://gmail.com/" "$local_native_install_dir" --internal-urls "(.*?contacts\.google\.com.*?|.*?accounts\.google\.com.*?)"
	# nativefier -n "Google Calendar" "https://calendar.google.com" "$local_native_install_dir"
	nativefier -n "tlk.io" -i "$HOME/iCloud/Icons/chat.png" --flash --width="500" "https://tlk.io/aubreypwd" "$local_native_install_dir"
	nativefier -n "Google Voice" -i "$HOME/iCloud/Icons/google-voice.png" "https://voice.google.com/messages" "$local_native_install_dir"
	nativefier -n "Bandcamp" -i "$HOME/iCloud/Icons/bandcamp.png" "https://bandcamp.com/aubreypwd/following/artists_and_labels" "$local_native_install_dir"
	# nativefier -n "Chillhop Radio" -i "$HOME/iCloud/Icons/chillhop.png" --internal-urls "(.*?)(.*\.chillhop\.com|.*\.facebook\.com)(.*?)" "https://chillhop.com/" "$local_native_install_dir"
	# nativefier -n "JazzRadio.com" -i "$HOME/iCloud/Icons/jazz-radio.png" --internal-urls "(.*?)(.*\.jazzradio\.com|.*\.facebook\.com)(.*?)" "https://www.jazzradio.com/#favorites" "$local_native_install_dir"
	# nativefier -n "Instagram" -i "$HOME/iCloud/Icons/instagram.png" "https://instagram.com" "$local_native_install_dir"
	# nativefier -n "Facebook" -i "$HOME/iCloud/Icons/facebook.png" "https://facebook.com" "$local_native_install_dir"
	nativefier -n "Amazon" -i "$HOME/iCloud/Icons/amazon.png" "https://amazon.com/" "$local_native_install_dir" --internal-urls="(.*?((amazon)|(aws)).*)"
	# nativefier -n "Out of Milk" -i "$HOME/iCloud/Icons/oom.png" "https://www.outofmilk.com/ShoppingList.aspx?signin=1" "$local_native_install_dir"
	# nativefier -n "iHeart Radio" -i "$HOME/iCloud/Icons/i-heart-radio.png" --flash --internal-urls "(.*?)(facebook\.com|www\.facebook\.com/|www.iheart\.com)(.*?)" "https://www.iheart.com/my/stations/" "$local_native_install_dir"
	# nativefier -n "Alan Watts Radio" -i "$HOME/iCloud/Icons/alan-watts.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://www.youtube.com/embed/fGu88738Sh8?autoplay=1" "$local_native_install_dir"
	# nativefier -n "Write.as" -i "$HOME/iCloud/Icons/write-as.png" "https://write.as/" "$local_native_install_dir"
	# nativefier -n "Calm Radio" -i "$HOME/iCloud/Icons/calmradio.png" --internal-urls "(.*?)(.*\.calmradio\.com)(.*?)" "https://calmradio.com/en/" "$local_native_install_dir"
	nativefier -n "Messenger" -i "$HOME/iCloud/Icons/messenger.png" --internal-urls "(.*((messenger)|(facebook)).*)" "https://www.messenger.com/login/" "$local_native_install_dir"
	# nativefier -n "Youtube" -i "$HOME/iCloud/Icons/youtube.png" --flash  --internal-urls "(.*?)(.*\.google\.com)(.*?)" "https://youtube.com/" "$local_native_install_dir"
	nativefier -n "Local by Flywheel Exports" -i "$HOME/iCloud/Icons/export.png" --flash  --internal-urls "(.*?((google)).*)" "https://drive.google.com" "$local_native_install_dir"
	# nativefier -n "Jira" -i "$HOME/iCloud/Icons/jira.png" --internal-urls "(.*?)(.*\.atlassian\.net|.*\.google\.com|platform.harvestapp.com|*bitbucket.org)(.*?)" "https://webdevstudios.atlassian.net/jira/" "$local_native_install_dir"
	nativefier -n "Buddy.Works" -i "$HOME/iCloud/Icons/buddy-works.png" --internal-urls "(.*?((buddy)).*)" "https://app.buddy.works/" "$local_native_install_dir"

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
