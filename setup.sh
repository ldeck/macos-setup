#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/setup_parsing.sh

version="0.1"
preinstalls=
SIMULATION=

deref() {
	echo "${!1}";
}

die_if_noargs() {
	if [ $# -eq 0 ]; then
		_PRINT_HELP=yes die "FATAL ERROR: No arguments provided" 1
	fi
}

start_section() {
	echo
	echo "===> ${SIMULATION}Installing $1 $2"
	echo
}

end_section() {
	echo
}

preinstall_homebrew() {
	if ! [ $preinstalls ]; then
		if [ $(which brew) ]; then
			echo
			echo "===> ${SIMULATION}Homebrew already installed"
		else
			start_section "Homebrew"
			if [ $SIMULATION ]; then
				echo sh $DIR/installers/install_homebrew.sh
			else
				sh $DIR/installers/install_homebrew.sh
			fi
		fi
		preinstalls="done"
	fi
}

run_homebrew() {
	type=$1
	cask=
	[ "$type" = "casks" ] && cask='cask'
	if [ "$_arg_all" = "on" ] || [ $(deref "_arg_$type") = "on" ]; then
		preinstall_homebrew
		count=$(cat $DIR/$type.txt | grep -v -E '^#' | wc -l | tr -d '[:space:]')
		start_section $count $type
		if [ $SIMULATION ]; then
			echo brew $cask install $(cat $DIR/$type.txt | grep -v -E '^#')
		else
			brew $cask install $(cat $DIR/$type.txt | grep -v -E '^#')
		fi
	fi
}

run_utils() {
	if [ "$_arg_all" = "on" ] || [ "$_arg_utils" = "on" ]; then
		utils=()
		while IFS=  read -r -d $'\0'; do
			utils+=("$REPLY")
		done < <(find $DIR/utils -type f -perm +111 -print0 | sort -nz)

		count=${#utils[@]}
		start_section $count 'utils'
		i=0
		while [ $i -lt $count ]; do
			util=${utils[$i]}
			i=$(( i + 1 ))
			relpath=$(perl -e 'use File::Spec; print File::Spec->abs2rel(@ARGV)' $util $DIR)
			echo "---> ${SIMULATION}Start $i/$count: ${relpath}"
			! [ $SIMULATION ] && ("$util")
			echo
		done
	fi
}

# main
die_if_noargs "$@"
parse_commandline "$@"
[ "$_arg_simulate" = "on" ] && SIMULATION="SIMULATE "

echo $SIMULATION ldeck macOS setup starting...

run_homebrew 'brews'
run_homebrew 'casks'
run_utils

echo
echo $SIMULATION ldeck macOS setup complete!
