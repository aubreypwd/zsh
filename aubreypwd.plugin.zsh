#!/usr/local/bin/zsh

###
 # My ZSH Plugin
 #
 # @since Saturday, June 8th 2019
 ##

loadfrom="$HOME/.config/symlinked/zshrc/plugins/aubreypwd"

###
 # Install
 #
 # @since Saturday, June 8th 2019
 ##
function install {
	# brew install aria2 git node wp-cli trash subversion php@7.1 php@7.2 php@7.3 fzf slack-cli
	# brew cask install
	# npm install -g nativefier
	# brew install git wp-cli trash git ffmpeg
}

###
 # Reload ZSH Config
 #
 # @since Saturday, June 8th 2019
 ##
function reload {
	source "$loadfrom/aubreypwd.plugin.zsh" && echo "Reloaded"
}

###
 # Install Homebrew
 #
 # E.g: install-homebrew
 #
 # @since Sun Jun  9 12:07:14 MST 2019
 ##
function install-homebrew {
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

###
 # Require a command (and install if missing).
 #
 # E.g: require "git" "brew install git"
 #
 # @since Sun June 9th 2019
 ##
function require-cmd {
	cmd="$1"
	install="$2"

	if ! [ -x "$(command -v $cmd)" ]; then
		echo "Could not find $cmd, so installing using: $install..."
		eval ${install}
	fi
}

require-cmd "brew" "install-homebrew"
require-cmd "ffmpeg" "brew install ffmpeg"
require-cmd "git" "brew install git"
require-cmd "svn" "brew install subversion"
require-cmd "trash" "brew install trash-cli"
require-cmd "trash-empty" "brew install trash-cli"
require-cmd "wp" "brew install wp-cli"
require-cmd "youtube-dl" "brew install youtube-dl"
require-cmd "composer" "brew install composer"

source "$loadfrom/alias.zsh"
source "$loadfrom/git.zsh"
source "$loadfrom/wp.zsh"
source "$loadfrom/files.zsh"
source "$loadfrom/svn.zsh"
source "$loadfrom/misc.zsh"

echo "aubreypwd/zsh Loaded!"
