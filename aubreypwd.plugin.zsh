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
 # Reload Config
 #
 # E.g: reload
 #
 # @since 06-09-2019
 ##
function reload {
	if [ "menubar" = "$1" ]; then
		killall -KILL SystemUIServer
	fi

	source "$loadfrom/aubreypwd.plugin.zsh" && echo "Reloaded"
}

###
 # Exit
 #
 # E.g: x
 #
 # @since 06-09-2019
 ##
function x {
	exit
}

###
 # Maybe x
 #
 # E.g: maybe-x x
 #
 # But mostly used in commands that should exit right after, e.g.:
 #
 #    function test {
 #        echo "I am a script"
 #        maybe-x "$@"
 #    }
 #
 # So, when they enter:
 #
 #     test x
 #
 # ...it will echo out the string, then immediately exit.
 #
 # @since 06-09-2019
 ##
function maybe-x {
	if [ 'x' = "$1" ]; then
		exit
	fi
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
require-cmd "hcl" "sudo gem install hcl && hcl config -r"
require-cmd "slack" "brew tap rockymadden/rockymadden && brew install rockymadden/rockymadden/slack-cli && slack init"
require-cmd "fzf" "brew install fzf"
require-cmd "nativefier" "brew install nativefier"

source "$loadfrom/alias.zsh"
source "$loadfrom/git.zsh"
source "$loadfrom/wp.zsh"
source "$loadfrom/files.zsh"
source "$loadfrom/svn.zsh"
source "$loadfrom/date.zsh"
source "$loadfrom/hcl.zsh"
source "$loadfrom/slack.zsh"
source "$loadfrom/web-search.zsh"
source "$loadfrom/ssh.zsh"
source "$loadfrom/macos.zsh"
source "$loadfrom/nativefier.zsh"

echo "aubreypwd/zsh Loaded!"
