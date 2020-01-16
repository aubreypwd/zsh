#!/usr/local/bin/zsh

###
 # WordPress Function
 #
 # @since Saturday, June 8th 2019
 ##

###
 # Sets up Local by Flywheel to use wp externally.
 #
 # E.g: wp-lbf
 #
 # @since 8/15/2019
 #
 # @see https://salferrarello.com/wp-cli-local-by-flywheel-without-ssh/
 ##
function install-cli {
	curl -O https://raw.githubusercontent.com/salcode/ssh-into-local-by-flywheel/master/wpcli-lbf-setup
	bash wpcli-lbf-setup
	rm -rf ./wpcli-lbf-setup
	wp option get siteurl
}

	function wp-cli-lbf {
		install-cli "$@"
	}

	function wp-install-cli {
		install-cli "$@"
	}

	function installcli {
		install-cli "$@"
	}

###
 # Watch debug.log
 #
 # @since 6/21/16
 ##
function debug {
	if [[ ! $(pwd) == *"content"* ]]; then
		echo "Not in wp-content." && return
	fi

	if ! [ -e ./debug.log ]; then
		touch "debug.log"
	fi

	clear && rainbow --red="error|Fatal|fatal|Error|PHP\s Fatal|WordPress\sdatabase\serror" --yellow="warning|PHP\sWarning|PHP\sNotice" --magenta="line\s[0-9]+" --green="\/Users\/.*\.php" --blue="^\[.*\]" tail -f debug.log

	rm "debug.log"
}

###
 # Applies a Trac ticket patch via a URL.
 #
 # E.g: apply-patch <the url to the trac ticket>
 #
 # @since 4/5/16
 ##
function apply-patch {
	curl -k "$1" | patch -p0
}

###
 # Make a patch
 #
 # E.g: make-patch 40333
 #
 # @since Monday, April 1, 2019
 ##
function make-patch {
	git diff --no-prefix master..HEAD > "$1".patch
}

###
 # Easy way to set all user's passwords to `password`.
 #
 # E.g: db-pass
 #
 # @since Wednesday, April 17, 2019
 ##
function wp-db-pass {
	if [ "" = "$1" ]; then
		table="wp_users";
	else
		table="$1_users"
	fi

	echo "Changing all users' passwords to 'password'..."
	wp db query "UPDATE $table SET user_pass = '5f4dcc3b5aa765d61d8327deb882cf99';"
}

	function wpdbpass {
		wp-db-pass "$@"
	}

###
 # Export wp db export into a .gz file and leave a comment on the file.
 #
 # @since Tuesday, May 21, 2019
 #
 # E.g: wp-export "A comment about the export for Finder."
 ##
function wp-db-export-gz {
	echo "Exporting SQL..."
	local sqlfile=$(wp db export --porcelain)

	echo "Compressing $sqlfile..."
	gzip "$sqlfile"

	echo "Adding Comment: $1..."
	comment "$sqlfile.gz" "$1"

	echo "Restarting MySql..."
	s db r
}

###
 # Run wp db import on a .gz file.
 #
 # @since Tuesday, May 21, 2019
 #
 # E.g: wp-import "$file"
 ##
function wp-db-import-gz {
	echo "Extracting $1..."
	gunzip "$1"

	echo "Importing $sqlfile..."
	local noext=$(echo "$1" | cut -f 1 -d '.')
	local sqlfile="$noext.sql"
	wp db import "$sqlfile"

	echo "Re-compressing $sqlfile > $1"
	gzip "$sqlfile"

	echo "Restarting MySql..."
	s db r
}

###
 # Use a specific WP Database.
 #
 # E.g: usedb "production" or usedb "local"
 #
 # @since Tuesday, 1/14/2020
 ##
function use-db {
	local db="$1"
	wp config set DB_NAME "$1"
}

	function usedb {
		use-db "$@"
	}

	function wpusedb {
		use-db "$@"
	}

	function wpdbuse {
		use-db "$@"
	}
