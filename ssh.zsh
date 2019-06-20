#!/usr/local/bin/zsh

###
 # SSH Keys
 #
 # @since 06-10-2019
 ##

# Add keys in keychain...
ssh-add -q -A >/dev/null 2>&1
ssh-add -q -K >/dev/null 2>&1

# Add Keys...
ssh-add -q "$HOME/.ssh/id_rsa-bitbucket" >/dev/null 2>&1
