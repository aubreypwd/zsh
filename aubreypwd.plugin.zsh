#!/usr/local/bin/zsh

# sudo scutil --set HostName Bones

###
 # My ZSH Plugin
 #
 # @since Saturday, June 8th 2019
 ##

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

if ! [ -e "/usr/local/opt/openssl@1.1/bin/openssl" ]; then
	brew reinstall openssl
fi

loadfrom="$HOME/.config/symlinked/zshrc/plugins/aubreypwd"

source "$loadfrom/svn.zsh" ## Skipped
source "$loadfrom/macos.zsh"
source "$loadfrom/apps.zsh"
source "$loadfrom/services.zsh"
source "$loadfrom/node.zsh"
source "$loadfrom/wds.zsh"
source "$loadfrom/php.zsh"
source "$loadfrom/sounds.zsh"
