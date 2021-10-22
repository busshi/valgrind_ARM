#!/bin/bash

if [ -f Makefile ] ; then
	ARGS="$1"
	TARGET=$( cat Makefile | grep -m1 NAME | sed 's/[[:space:]]//g' | cut -d= -f2 )
	if [ ${ARGS} = "check" ] ; then
		make check
	else
		make
		[ $? -eq 0 ] && valgrind ./${TARGET} ${ARGS}
	fi
else
	FILES="$1"
	ARGS="$2"
	TARGET="a.out"
	clang -Wall -Wextra -Werror "$FILES" -o "${TARGET}"
	[ $? -eq 0 ] && valgrind ./${TARGET} ${ARGS}
fi



exit 0
