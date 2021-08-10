#!/bin/bash

busy() {
	# Define the animation frames in-order.
	#local -a frame=( '/' '-' '\' '|' )
	local -a frame=( ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏ )
	
	local delay='0.1s' # Animated frame duration
	local prompt       # Message displayed after frame animation

	# Test if first argument appears to be a sleep(1) duration.
	local pat='^([0-9](\.[0-9]*)?|[0-9]*\.[0-9]{1,})[smhd]?$'
	if [[ ${#} -gt 0 ]] && [[ "${1}" =~ ${pat} ]]; then
		delay=${1}
		prompt=${2}
		shift
		shift
	else
		prompt=${1}
		shift
	fi
	
	# Find the widest frame in the animation.
	local wide=0
	for s in "${frame[@]}"; do 
		[[ ${#s} -gt ${wide} ]] && wide=${#s}
	done

	local n=0
	printf ' %*s %s\r' ${wide} '' "${prompt}"
	while ! eval -- "${*}"; do
		printf ' %*s \r' ${wide} "${frame[((n=++n%${#frame[@]}))]}"
		sleep "${delay}"
	done
	# Clear the animation frame and prompt
	printf ' %*s %*s\r' ${wide} '' ${#prompt} ''
}

