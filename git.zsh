#!/usr/local/bin/zsh

git config --global mergetool.keepBackup false # No .orig files.

###
 # Push Current Branch
 #
 # @since Saturday, June 8th 2019
 ##
function p {
	git push origin "$(git branch|grep '\*'|tr -d '* \n')"
}

###
 # Alias for git fetch --all.
 #
 # @since 7/6/17
 ##
function fetch {
	git fetch --all
}

###
 # Wrapper for copy-branch.
 #
 # @since 4/5/16
 # @since Tuesday, 1/21/2020 Re-worked to use cwb.
 ##
function cb {
	cwb | pbcopy
}

###
 # Show the current working branch.
 #
 # E.g: cwb
 #
 # @since Tuesday, 1/21/2020
 ##
function cwb {
	echo $(git branch | grep '\*' | tr -d '* \n')
}

###
 # Wrapper for git-delete-branch().
 #
 # @since 11/22/16
 ##
function git-db {
	git branch -D "$1" && git push origin :"$1"
}

	function git-delete-branch {
		git-db "$@"
	}

	function gitdb {
		git-db "$@"
	}

###
 # Simple log.
 #
 # @since 5/4/16 Re-written to use simple log.
 ##
function log {
	if [ '--help' = "$1" ]; then
		echo "Usage: git-log [string: Mode <graph>]"
		return;
	fi

	if [ 'graph' = "$1" ]; then
		git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
	else
		if [ "$1" -gt 0 ]; then
			git log -n "$1" --oneline
		else
			local lines="$LINES-10" # Just under the current lines of the window.
			git log -n "$lines" --oneline
		fi
	fi
}

###
 # Pulls down the current branch.
 #
 # E.g.: git-pull | pull
 #
 # @since 4/5/16
 ##
function pull {
	git pull origin "$(git branch|grep '\*'|tr -d '* \n')"
}

###
 # Quick wrapper for "git submodule init && git submodule update"
 #
 # E.g: submodules
 #
 # @since 4/5/16
 ##
function modules {
	git submodule update --init --recursive
}

###
 # Delete a tag.
 #
 # @since 12/6/2017
 ##
function git-dt {
	git tag -d "$1"
	git push origin :refs/tags/"$1"
}

	function git-delete-tag {
		git-dt "$@"
	}

	function gitdt {
		git-dt "$@"
	}

###
 # Checkout a branch fuzzily.
 #
 # @since 5/15/17
 ##
function branch {
	local branches=$(git branch -a) &&
	local branch=$(echo "$branches" | fzf +s +m -e) &&
	local cmd=$(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")

	if [ -z "$cmd" ]; then
		return
	fi

	git checkout "$cmd"
}

###
 # Easy way to move tag to new spot.
 #
 # E.g: git-move-tag "x.x.x"
 #
 # @since 8/16/2019
 ##
function git-move-tag {
	git-delete-tag "$1"
	git tag "$1"
	git push --tags
}

	function git-mv-tag {
		git-move-tag "$@"
	}

	function git-mt {
		git-move-tag "$@"
	}

	function gitmt {
		git-move-tag "$@"
	}

function git-put {
	local branch=$(git branch | grep '\*' | tr -d '* \n')
	local tobranch="$1"

	echo "$branch > $tobranch";

	git checkout "$tobranch"
	git merge "$branch"
}

	function gitput {
		git-put "$@"
	}

	function put {
		git-put "$@"
	}
