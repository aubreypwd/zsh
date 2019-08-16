#!/usr/local/bin/zsh

###
 # Slugify String.
 #
 # E.g: slugify [string]
 #
 # @since 7/22/2019
 ##
function slugify {
	php -r "require_once '$HOME/.config/symlinked/zshrc/plugins/aubreypwd/lib/php/slugify.php'; echo slugify('$1');" | pbcopy
	echo "Copied to Clipboard"
}

	function dashit {
		slugify $@
	}

###
 # Shorten a URL
 #
 # E.g: short <url>
 #
 # @since 8/16/2019
 ##
function shorten {
	twzer sh -b "$1" | egrep -o 'https?://[^ ]+' | pbcopy
}

	function short {
		shorten "$@"
	}
