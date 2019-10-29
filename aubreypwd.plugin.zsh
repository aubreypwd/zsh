#!/usr/local/bin/zsh

# sudo scutil --set HostName Bones

export LESS="-F -X $LESS" # Don't pager on less.
export MANPAGER='ul | cat -s'
export OP_SESSION_team_webdevstudios="rw7fGvcceYcIdif5HruO9dL5KapNtDlY6jrmcSvODHc" # 1password

touch "$HOME/.hushlogin" # Don't show last login message anymore.

###
 # My ZSH Plugin
 #
 # @since Saturday, June 8th 2019
 ##

loadfrom="$HOME/.config/symlinked/zshrc/plugins/aubreypwd"

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
 # A way to detect if I was loaded.
 #
 # E.g: loaded
 #
 # @since 6/20/2019
 ##
function loaded {
	echo "Loaded!"
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
 # An easy way to get $HOME
 #
 # E.g: home
 #
 # @since 6/15/2019
 ##
function home {
	cd "$HOME"
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
require-cmd "curl" "brew install curl"
require-cmd "git" "brew install git" # These have wrappers, so can't do it this way.
require-cmd "svn" "brew install subversion"
require-cmd "trash" "brew install trash-cli"
require-cmd "trash-empty" "brew install trash-cli"
require-cmd "wp" "brew install wp-cli" # These have wrappers, so can't do it this way.
require-cmd "youtube-dl" "brew install youtube-dl"
require-cmd "composer" "brew install composer"
require-cmd "hcl" "sudo gem install hcl && hcl config -r"
require-cmd "slack" "brew tap rockymadden/rockymadden && brew install rockymadden/rockymadden/slack-cli && slack init"
require-cmd "fzf" "brew install fzf"
require-cmd "nativefier" "brew install nativefier"
require-cmd "rainbow" "brew install python && sudo easy_install rainbow" # Colorize less.
require-cmd "npm" "brew install node@10.16.1"

source "$loadfrom/alias.zsh"
source "$loadfrom/git.zsh"
source "$loadfrom/wp.zsh"
source "$loadfrom/files.zsh"
source "$loadfrom/svn.zsh"
source "$loadfrom/ssh.zsh"
source "$loadfrom/macos.zsh"
source "$loadfrom/apps.zsh"
source "$loadfrom/services.zsh"
source "$loadfrom/composer.zsh"
source "$loadfrom/node.zsh"
source "$loadfrom/wds.zsh"
