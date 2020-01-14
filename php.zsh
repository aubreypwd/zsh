#!/usr/local/bin/zsh

###
 # Install (and use) a specific version of PHP.
 #
 # E.g: use-php <version:7.2>
 #
 # @since Wednesday, 1/8/2020
 # @see https://getgrav.org/blog/macos-catalina-apache-multiple-php-versions
 ##
function use-php {
	local version="$1";
	local current_version=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".");

	brew tap exolnet/homebrew-deprecated

	brew install "php@$version"
	brew unlink "php@$current_version"
	brew link --force --overwrite "php@$version"
}

	function usephp {
		use-php "$@"
	}
