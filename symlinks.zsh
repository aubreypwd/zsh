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
		echo "$source does not exist, not symlinked."
		return
	fi

	if [ -e "$target" ]; then
		echo "$target already exists, not symlinked over."
		return
	fi

	ln -sf "$source" "$target"
}

symlink "$HOME/.config/symlinked/Git/.gitignore" "$HOME/.gitignore" &> /dev/null
