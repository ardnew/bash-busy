#!/bin/bash

busy() {
	#local -a frame=( '/' '-' '\' '|' )
	local -a frame=( ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏ )
	local delay='0.1s' # animated frame duration
	local prompt       # message displayed after frame animation

	# test if first argument appears to be a sleep(1) duration
	pat='^([0-9](\.[0-9]*)?|[0-9]*\.[0-9]{1,})[smhd]?$'
	if [[ ${#} -gt 0 ]] && [[ "${1}" =~ ${pat} ]]; then
		delay=${1}
		prompt=${2}
		shift
		shift
	else
		prompt=${1}
		shift
	fi

	clear
	n=0
	printf "   %s\r" "${prompt}"
	while ! eval -- "${*}"; do
		printf " %s \r" "${frame[((n=++n%${#frame[@]}))]}"
		sleep "${delay}"
	done
}

