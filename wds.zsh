#!/usr/local/bin/zsh

###
 # Run satisbuild on packges.wdslab.com Satis.
 #
 # E.g:
 #
 #   satisbuild
 #
 # @since 8/6/2019
 ##
function satisbuild {
	ssh root@packages.wdslab.com "sh /srv/global/packages/rebuildsatis.sh"
}

###
 # I never have to remember this IP again!
 #
 # E.g: blogmule
 #
 # @since Tuesday, 10/29/2019
 ##
function blogmule {
	ssh blogmule@40.83.223.82
}
