#!/bin/bash

# Shell Script Debugging:

# Two common techniques for debugging shell scripts are printing/debugging 
# techniques and using set -x and set -e

# The set -x command, when added at the beginning of a script, enables the debugging 
# mode. It prints each line before executing it, allowing you to see the exact 
# commands being executed. 

set -x 

echo "debugging the script" 
# output:
# + echo 'debugging the script'
# debugging the script

ls /nonexistent_directory  
echo "Debug: Script completed." 

# wih out set e 
# + ls /nonexistent_directory
# ls: cannot access '/nonexistent_directory': No such file or directory
# + echo 'Debug: Script completed.'
# Debug: Script completed.
# The set -e command, when added, makes the script exit immediately if any command 
# returns a non-zero exit status. This helps catch errors early in the script 
# execution

set -e 

ls /nonexistent_directory  
echo "Debug: Script completed." 4

# after set -e 
# + set -e
# + ls /nonexistent_directory
# ls: cannot access '/nonexistent_directory': No such file or directory

# While set -x and set -e are powerful debugging tools, they may not be 
# suitable for all scenarios. For instance, set -e might lead to unexpected 
# exits if you're intentionally handling errors. 
# To turn off debugging mode, use set +x. 
# Debugging tools like set -x and set -e are usually used for development and 
# testing purposes. In production, it's recommended to minimize debugging 
# outputs and handle errors more gracefully.

