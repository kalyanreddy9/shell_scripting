#!/bin/bash

# Error Handling 

# Error handling in shell scripting is crucial to ensure your scripts handle unexpected 
# situations gracefully. 
# This involves dealing with exit codes, error messages, and trapping signals

# Exit Codes:

# 0 indicates success, while non-zero values indicate errors

echo "listing the files" # listing the files
ls /non-existent-directory # ls: cannot access '/non-existent-directory': No such file or directory

if [[ $? -eq 0 ]]; then 
  echo "directory exists" 
else
  echo "directory does-not exists" # directory does-not exists
fi 

# Error Messages

# Custom error messages help users understand what went wrong. 
# You can use echo to print error messages along with relevant information. 

file="non-existent-file.sh"
if [[ ! -f "$file" ]]; then
  echo "Error: $file does not exist" # Error: non-existent-file.sh does not exist
  # exit 1 commenting this to validate trap 
  # exit 0 → success (script ended normally).
  # exit 1 (or any non-zero) → failure (error condition).
  # return is used inside functions to stop just the function, not the whole script
fi 

echo "$file file exists"


cleanup(){
  echo "running cleanup commands" # running cleanup commands
  exit 1
}

echo "Before Trap" # Before Trap

sleep 5 # If you press Ctrl+C here, script just exits, cleanup won't run

# The trap only starts working after you register it.

trap cleanup INT # INT = SIGINT (Interrupt Signal) 

# Bash (and Linux in general) sends SIGINT when you press Ctrl+C in the terminal.

echo "After Trap" # After Trap

sleep 10 # If you press Ctrl+C here, cleanup runs