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
 #
 ##
function wp-cli-lbf {
	curl -O https://raw.githubusercontent.com/salcode/ssh-into-local-by-flywheel/master/wpcli-lbf-setup
	bash wpcli-lbf-setup
	rm -rf ./wpcli-lbf-setup
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
function wp-apply-patch {
	curl -k "$1" | patch -p0
}

###
 # Make a patch
 #
 # E.g: make-patch 40333
 #
 # @since Monday, April 1, 2019
 ##
function wp-make-patch {
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
 # Wrapper for wp-cli
 #
 # This adds a wrapper around wp so we can do custom commands like
 # wp db import-gz, etc.
 #
 # @since 6/25/2019
 ##
function wp__ {

	# wp debug
	if [ "debug" = "$1" ]; then
		debug
		return
	fi

	# wp db pass
	if [ "db" = "$1" -a "pass" = "$2" ]; then
		wp-db-pass
		return
	fi

	# wp db importgz <file>
	if [ "db" = "$1" -a "import-gz" = "$2" ]; then
		local file="$3"

		if [ ${file: -3} = ".gz" ]; then
			wp-db-import-gz "$file"
		else
			/usr/local/bin/wp db import "$file" # Try and import the old way.
		fi

		return
	fi

	# wp db exportgz
	if [ "db" = "$1" -a "export-gz" = "$2" ]; then
		wp-db-export-gz
		return
	fi

	# Use default wp for commands.
	/usr/local/bin/wp "$@"
}
