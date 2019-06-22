#!/usr/local/bin/zsh

mkdir -p "$HOME/Applications/Nativefied"
native_install_dir="$HOME/Applications/Nativefied"
installed_file="$native_install_dir/.installed"

function install-app-get-icon {
	filename=$(date "+%s")
	to="$filename.png"
	out="../../tmp/$to"
	aria2c "$1" -o "$out" > /dev/null

	if [ ! -e "$out" ]; then
		echo "$out does not exist."
		return;
	fi

	echo "$out"
}

function install-apps {

	## tlk.io
	nativefier -n "tlk.io" -i $(install-app-get-icon 'https://img.icons8.com/cotton/2x/filled-chat.png') --flash --width="500" "https://tlk.io/aubreypwd" "$native_install_dir"

	# Poolside.fm
	nativefier -n "Poolside.fm" -i $(install-app-get-icon "http://pic2.orsoon.com/2017/0401/20170401115748603.png") --flash --width="355" --height="460" "http://www.poolside.fm/mobile/" "$native_install_dir"

	# iHeart Radio
	nativefier -n "iHeart Radio" -i $(install-app-get-icon "https://www.androidpolice.com/wp-content/uploads/2017/01/nexus2cee_iheart-radio-round-icon.png") --flash --internal-urls "(.*?)(facebook\.com|www\.facebook\.com/|www.iheart\.com)(.*?)" "https://www.iheart.com/my/stations/" "$native_install_dir"

	# Bandcamp
	nativefier -i $(install-app-get-icon "https://www.shareicon.net/download/2017/03/29/881762_audio_512x512.png") -n "Bandcamp" "https://bandcamp.com/aubreypwd/following/artists_and_labels" "$native_install_dir"

	touch "$installed_file" # Flagged as installed.
	echo "Done!"
}

if [ ! -e "$installed_file" ]; then
	install-apps
fi

function update-apps {
	install-apps
}
