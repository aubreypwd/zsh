#!/usr/local/bin/zsh

function composer-uninstall {
	cu="$HOME/Repos/code/composer-uninstall/composer-uninstall.php"

	if [ -e "$cu" ]; then
		php "$cu"
	fi
}
