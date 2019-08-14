#!/usr/local/bin/zsh

function npm-uninstall {
	echo "Removing node_modules..."
	rm -Rf node_modules

	if [ "$1" = '--package' ]; then
		if [ ! -e "package-lock.json" ]; then
			echo "Removing package-lock.json..."
			rm -Rf package-lock.json
		fi
	fi
}

	function nu {
		npm-uninstall "$@"
	}
