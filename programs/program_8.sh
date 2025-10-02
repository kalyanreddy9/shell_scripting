#!/bin/bash

# Shell Scripting with Command-Line Arguments

# $0 represents the script's name itself
# $1, $2, ... represent the first, second, and so on, arguments
# $# gives the total number of arguments
# $@ represents all the arguments as a list
# $* represents all the arguments as a single string

echo "script name: $0" # script name: ./program_8.sh
echo "first argument: $1" # first argument: arg1
echo "second argument: $2" # second argument: arg2
echo "All arguments as a list : $@" # All arguments as a list : arg1 arg2
echo "All arguments as a single string: $*" # All arguments as a single string: arg1 arg2

