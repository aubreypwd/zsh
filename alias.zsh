#!/usr/local/bin/zsh

# Colorful ls.
alias ls='ls -laGFh';
alias c=clear

# Git Tower.
alias tower='gittower'

# Composer stuffs.
alias cu="composer uninstall"
alias ci="composer install --prefer-source"
alias cid="composer install --prefer-dist"
alias cr="composer uninstall; composer install"
alias cri="composer uninstall; composer install --prefer-source"
alias crid="composer uninstall; composer install --prefer-dist"
