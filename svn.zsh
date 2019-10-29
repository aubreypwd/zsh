#!/usr/local/bin/zsh

###
 # Remove any missing files from the repo.
 #
 # @since 2/11/17
 ##
function svn-remove {
	svn status | grep '^!' | awk '{print $2}' | xargs svn rm --force
}

	function svn-rm {
		svn-remove "$@"
	}

	function svnrm {
		svn-remove "$@"
	}

###
 # Add any new files to the repo.
 #
 # @since 8/19/17
 ##
function svn-add {
	svn status | grep '^\?' | awk '{print $2}' | xargs svn add --force
}

	function svnadd {
		svn-add "$@"
	}

###
 # Reset a SVN repo.
 #
 # @since 8/20/17
 ##
function svn-reset {
	svn revert --recursive .
}

	function svnr {
		svn-reset "$@"
	}

###
 # Syncs trunk with a tag.
 #
 # @since 8/20/17
 ##
function svn-tag {
	if [ -n "$1" ]; then
		if [ '--help' == "$1" ]; then
			echo "Copies content from tags/$1 to trunk/"
			echo "Usage: svn-tag [+string: The tag, e.g. 1.0]"
			return;
		fi

		if [ -e "tags/$1" ]; then
			svn rm "tags/$1" --force
		fi

		svn cp trunk "tags/$1"
		svn-addremove
		svn status
	else
		svn-tag --help
	fi
}

	svnt {
		svn-tag "$@"
	}

###
 # Syncs a tag with trunk.
 #
 # @since 8/20/17
 ##
function svn-trunk {
	if [ -n "$1" ]; then
		if [ '--help' == "$1" ]; then
			echo "Syncs content from tags/$1 to trunk/"
			echo "Usage: public [+string: The project folder in ~/Local Sites.]"
			return;
		fi

		if [ -e "tags/$1" ]; then
			svn rm trunk --force
			svn cp "tags/$1" trunk
			svn-addremove
		fi
	else
		svn-sync --help
	fi
}

###
 # Add any new files, remove any deleted files from the repo.
 #
 # @since 8/19/17
 ##
function svn-addremove {
	svn-add
	svn-remove
}

	function svnam {
		svn-addremove "$@"
	}

	function svn-am {
		svn-addremove "$@"
	}

	function svn-add-remove {
		svn-addremove "$@"
	}
