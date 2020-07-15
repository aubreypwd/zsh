#!/usr/local/bin/zsh

# sudo scutil --set HostName Bones

export LESS="-F -X $LESS" # Don't pager on less.
export MANPAGER='ul | cat -s'

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

	if ! [ -e "$HOME/.zshrc.secure" ]; then
		return
	fi

	source "$HOME/.zshrc" && echo "Reloaded"
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
 # E.g: require "git" "brew reinstall git"
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
require-cmd "ffmpeg" "brew reinstall ffmpeg"
require-cmd "wget" "brew reinstall wget"
require-cmd "curl" "brew reinstall curl"
require-cmd "svn" "brew reinstall subversion"
require-cmd "trash" "brew reinstall trash-cli"
require-cmd "trash-empty" "brew reinstall trash-cli"
require-cmd "wp" "brew reinstall wp-cli"
require-cmd "youtube-dl" "brew reinstall youtube-dl"
require-cmd "composer" "brew reinstall composer"
require-cmd "hcl" "gem install hcl && hcl config -r"
require-cmd "slack" "brew tap rockymadden/rockymadden && brew reinstall rockymadden/rockymadden/slack-cli && slack init"
require-cmd "fzf" "brew reinstall fzf"
require-cmd "nativefier" "brew reinstall nativefier"
require-cmd "rainbow" "brew reinstall python && sudo easy_install rainbow" # Colorize less.
require-cmd "npm" "brew reinstall node@10.16.1"
require-cmd "git" "brew reinstall git"
require-cmd "hcl" "gem install hcl"
require-cmd "git-open" "npm install --global git-open"
require-cmd "watch" "brew reinstall watch"

if ! [ -e "/usr/local/opt/openssl@1.1/bin/openssl" ]; then
	brew reinstall openssl
fi

# require-cmd "git" "brew reinstall git" # These have wrappers, so can't do it this way.

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
source "$loadfrom/php.zsh"
source "$loadfrom/sounds.zsh"
source "$loadfrom/docker.zsh"
