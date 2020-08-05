#!/usr/local/bin/zsh

###
 # System Symlinks
 #
 # @since Wednesday, 8/5/2020
 ##

###
 # Symlink Soemthing
 #
 # E.g: symlink
 #
 # @since
 ##
function symlink {
	local source="$1"
	local target="$2"

	if ! [ -e "$source" ]; then
		return
	fi

	if [ -e "$target" ]; then
		return
	fi

	ln -sf "$source" "$target"
}

symlink "$HOME/.config/symlinked/Git/.gitignore" "$HOME/.gitignore"
