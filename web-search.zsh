#!/usr/local/bin/zsh

###
 # Web Searches
 #
 # @since 06-09-2019 05-43PM
 ##

chromebin="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

###
 # Run Chrome
 #
 # E.g: chrome "http://url.tld"
 #
 # @since 06-10-2019
 ##
function chrome {
	run="$chromebin '$@'"
	eval ${run}
}

###
 # Search WDS Repos
 #
 # E.g: wds-git "Repo Name"
 #
 # @since 06-10-2019
 ##
function wds-git {
	chrome "https://github.com/WebDevStudios?q=$@"
}

###
 # Create a new KB Article
 #
 # E.g: newkb
 #
 # @since 6/16/2019
 ##
function newkb {
	chrome "http://kb.aubreypwd.com/wp-admin/post-new.php"
}

###
 # Search KB
 #
 # E.g: kb ["Search Query"]
 #
 # @since 6/16/2019
 ##
function kb {
	chrome "http://kb.aubreypwd.com/?s=$@"
}

###
 # Search Google
 #
 # E.g: google "Search"
 #
 # @since 06-10-2019
 ##
function google {
	open "http://www.google.com/search?q=$@"
}

function googl {
	goole "$@"
}

function phpf {
	chrome "http://us3.php.net/manual-lookup.php?pattern=$@"
}

function wpf {
	chrome "http://codex.wordpress.org/Function_Reference/$@"
}

function make {
	chrome "http://make.wdslab.com/?s=$@"
}

function gif {
	chrome "https://www.google.com/search?q=$@&tbm=isch&source=lnt&tbs=itp:animated&sa=X&ved=0ahUKEwj5yt3Ip9_iAhXirVQKHbgUDcEQpwUIIg&biw=1680&bih=971&dpr=2"
}
