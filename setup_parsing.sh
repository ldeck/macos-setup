#!/bin/bash
version="0.1"
#
# This is an optional arguments-only example of Argbash potential
#
# ARG_OPTIONAL_BOOLEAN([all],[a],[install everything],[])
# ARG_OPTIONAL_BOOLEAN([brews],[b],[brew install all uncommented items in brews.txt],[])
# ARG_OPTIONAL_BOOLEAN([casks],[c],[brew cask install all uncommented items in casks.txt],[])
# ARG_OPTIONAL_BOOLEAN([simulate],[s],[simulate execution only],[])
# ARG_OPTIONAL_BOOLEAN([utils],[u],[find, sort and execute utils/*.sh that are executable],[])
# ARG_VERSION([echo test v$version])
# ARG_HELP([ldeck macOS setup])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.6.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate

die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}

begins_with_short_option()
{
	local first_option all_short_options
	all_short_options='abcsuvh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}



# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_all="off"
_arg_brews="off"
_arg_casks="off"
_arg_simulate="off"
_arg_utils="off"

print_help ()
{
	printf '%s\n' "ldeck macOS setup"
	printf 'Usage: %s [-a|--(no-)all] [-b|--(no-)brews] [-c|--(no-)casks] [-s|--(no-)simulate] [-u|--(no-)utils] [-v|--version] [-h|--help]\n' "$0"
	printf '\t%s\n' "-a,--all,--no-all: install everything (off by default)"
	printf '\t%s\n' "-b,--brews,--no-brews: brew install all uncommented items in brews.txt (off by default)"
	printf '\t%s\n' "-c,--casks,--no-casks: brew cask install all uncommented items in casks.txt (off by default)"
	printf '\t%s\n' "-s,--simulate,--no-simulate: simulate execution only (off by default)"
	printf '\t%s\n' "-u,--utils,--no-utils: find, sort and execute utils/*.sh that are executable (off by default)"
	printf '\t%s\n' "-v,--version: Prints version"
	printf '\t%s\n' "-h,--help: Prints help"
}

parse_commandline ()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-a|--no-all|--all)
				_arg_all="on"
				test "${1:0:5}" = "--no-" && _arg_all="off"
				;;
			-a*)
				_arg_all="on"
				_next="${_key##-a}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-a" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-b|--no-brews|--brews)
				_arg_brews="on"
				test "${1:0:5}" = "--no-" && _arg_brews="off"
				;;
			-b*)
				_arg_brews="on"
				_next="${_key##-b}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-b" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-c|--no-casks|--casks)
				_arg_casks="on"
				test "${1:0:5}" = "--no-" && _arg_casks="off"
				;;
			-c*)
				_arg_casks="on"
				_next="${_key##-c}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-c" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-s|--no-simulate|--simulate)
				_arg_simulate="on"
				test "${1:0:5}" = "--no-" && _arg_simulate="off"
				;;
			-s*)
				_arg_simulate="on"
				_next="${_key##-s}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-s" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-u|--no-utils|--utils)
				_arg_utils="on"
				test "${1:0:5}" = "--no-" && _arg_utils="off"
				;;
			-u*)
				_arg_utils="on"
				_next="${_key##-u}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-u" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-v|--version)
				echo v$version
				exit 0
				;;
			-v*)
				echo v$version
				exit 0
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
				;;
		esac
		shift
	done
}
