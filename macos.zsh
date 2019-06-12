#!/usr/local/bin/zsh

flagfile="$HOME/.macos-defaults-configured"
thisfile="$HOME/.config/symlinked/zshrc/plugins/aubreypwd/macos.zsh"

if [ ! -e "$flagfile" ]; then
	touch "$flagfile"
fi

flagfile_current_contents=$(< "$flagfile")
thisfile_current_contents=$(< "$thisfile")

# If the flag file has the same contents as this file, then we did this already.
if [ "$flagfile_current_contents" = "$thisfile_current_contents" ]; then
	return;
fi

# Don't update this again.
echo "$thisfile_current_contents" > "$flagfile"

###
 # Default Flags
 #
 # Note, if you modify please delete the $flagfile
 #
 # @since
 ##
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write com.apple.TextEdit SmartQuotes -bool false
defaults write com.apple.TextEdit SmartDashes -bool false
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 1
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Done
echo "MacOS default flags configured, you may need to restart!"
