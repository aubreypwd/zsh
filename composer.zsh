#!/usr/local/bin/zsh

export COMPOSER_PROCESS_TIMEOUT=15 # https://stackoverflow.com/questions/18917768/why-composer-install-timeouts-after-300-seconds

###
 # composer uninstall
 #
 # E.g: composer-uninstall
 #
 # @since Tuesday, 10/29/2019
 ##
function composer-uninstall {
	cu="$HOME/Repos/code/composer-uninstall/composer-uninstall.php"

	if [ -e "$cu" ]; then
		php "$cu"
	fi
}
