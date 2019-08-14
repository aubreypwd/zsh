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
