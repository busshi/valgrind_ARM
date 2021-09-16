#!/bin/bash

if [ -f Makefile ] ; then
	ARGS="$1"
	TARGET=$( cat Makefile | grep -m1 NAME | sed 's/[[:space:]]//g' | cut -d= -f2 )
	make
else
	FILES="$1"
	ARGS="$2"
	TARGET="a.out"
	clang -Wall -Wextra -Werror "$FILES" -o "${TARGET}"
fi

[ $? -eq 0 ] && valgrind ./${TARGET} ${ARGS}


### ADD YOUR EXTRA COMMANDS HERE:



exit 0
