#!/bin/bash

function runPhpEssentials()
{
	RWDIR=${RWDIR:-"/var/php-essentials"} # Remote working directory
	VOLUME_MODE=${VOLUME_MODE:-"r"} # Read or ReadWrite?

	docker run -rm -i -t \
	  --volume  ${PWD}:${RWDIR}:${VOLUME_MODE} \
	  --workdir        ${RWDIR} \
	  darh/php-essentials $@
}

function runPhpInternalServer()
{
	RWDIR=${RWDIR:-"/var/php-essentials"} # Remote working directory
	VOLUME_MODE=${VOLUME_MODE:-"r"} # Read or ReadWrite?

	# Address & port to bind to
	PHPS_PORT=${PHPS_PORT:-"80"}
	PHPS_HOST=${PHPS_HOST:-"0.0.0.0"}

	docker run -rm -i -t \
	  --volume  ${PWD}:${RWDIR}:${VOLUME_MODE} \
	  --workdir        ${RWDIR} \
	  --publish ${PHPS_PORT}:${PHPS_PORT} \
	  darh/php-essentials \
	  php -S ${PHPS_HOST}:${PHPS_PORT} -t ${RWDIR} $@
}


# CLI
alias php="runPhpEssentials php"
# Try it: php -r 'echo getcwd(); print_r(`ls -lsa`);'

# Server
alias php-server="runPhpInternalServer"

# Tools
alias composer="runPhpEssentials composer"
alias pear="runPhpEssentials pear"
alias phpunit="runPhpEssentials phpunit"
alias phpcpd="runPhpEssentials phpcpd"
alias phpdcd="runPhpEssentials phpdcd"
alias phploc="runPhpEssentials phploc"
alias pdepend="runPhpEssentials pdepend"
alias phpcs="runPhpEssentials phpcs"
alias phpmd="runPhpEssentials phpmd"
alias behat="runPhpEssentials behat"