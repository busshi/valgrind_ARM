#!/bin/bash


if [ -f Makefile ] ; then
	ARGS="$1"
	TARGET=$( cat Makefile | grep -m1 NAME | sed 's/[[:space:]]//g' | cut -d= -f2 )
	make
else
	ARGS="$2"
	FILES="$1"
	clang -Wall -Wextra -Werror "$FILE" -o ${TARGET}
fi

[ $? -eq ] && valgrind "./${TARGET} ${ARGS}"


exit 0
