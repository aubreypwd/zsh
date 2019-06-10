#!/usr/local/bin/zsh

###
 # SSH Keys
 #
 # @since 06-10-2019
 ##

ssh-add -q -A
ssh-add -q -K

ssh-add -q "$HOME/.ssh/id_rsa-bitbucket"
