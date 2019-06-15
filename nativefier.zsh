#!/usr/local/bin/zsh

mkdir -p "$HOME/Applications/Nativefied"
native_install_dir="$HOME/Applications/Nativefied"
installed_file="$native_install_dir/.installed"

function install-apps {

	## tlk.io
	aria2c "https://img.icons8.com/cotton/2x/filled-chat.png"
	nativefier -n "tlk.io" -i "filled-chat.png" --flash --width="500" "https://tlk.io/aubreypwd" "$native_install_dir"
	rm "filled-chat.png"

	# Poolside.fm
	aria2c "http://pic2.orsoon.com/2017/0401/20170401115748603.png"
	nativefier -n "Poolside.fm" -i "20170401115748603.png" --flash --width="355" --height="460" "http://www.poolside.fm/mobile/" "$native_install_dir"
	rm "20170401115748603.png"

	touch "$installed_file" # Flagged as installed.
	echo "Done!"
}

if [ ! -e "$installed_file" ]; then
	install-apps
fi

function update-apps {
	install-apps
}
