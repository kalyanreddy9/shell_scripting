#!/bin/bash

# Prompt the user for their name
echo "Enter your name:"
read user_name
echo "Hello, $user_name! Welcome to shell scripting."

# input with prompting 

# You can also use the read command with a prompt message directly
# eliminating the need for separate echo commands

read -p "Enter your favourite color : " color 

echo "your favourite color is $color"

# -s , reading password without echoing characters

read -s -p "Enter your passowrd: " password
echo "password received"

# -t , Sets a time limit (in seconds) for user input.

read -t 5 -p "Enter something within 5 seconds: " input
echo "You entered: $input"

# -r (Raw Input) Prevents backslashes from being interpreted as escape characters.

read -r -p "Enter file path:" filepath

echo "Path: $filepath"
