#!/usr/local/bin/zsh

###
 # Services
 #
 # @since 6/19/2019
 ##

function s {
	restart=""

	if [ "r" = "$2" ]; then
		restart="restart"
	else
		if [ "restart" = "$2" ]; then
			restart="restart"
		fi
	fi

	# s r all
	if [ "all" = "$1" ]; then
		brew services restart --all
		valet restart
		return;
	fi

	if [ "db" = "$1" ]; then
		if [ "start" = "$2" ]; then
			brew services start mysql@5.7
			return;
		fi

		if [ "stop" = "$2" ]; then
			brew services stop mysql@5.7
			return;
		fi

		if [ "restart" = "$restart" ]; then
			brew services restart mysql@5.7
			return
		fi

		return;
	fi

	if [ "php" = "$1" ]; then
		if [ "start" = "$2" ]; then
			brew services start php
			return;
		fi

		if [ "stop" = "$2" ]; then
			brew services stop php
			return;
		fi

		if [ "restart" = "$restart" ]; then
			brew services restart php
			return
		fi

		return;
	fi

	echo "s [php, db, all] [start, stop, restart]"
}
