#!/bin/bash

make

valgrind "./$1"


exit 0
