#!/bin/bash 

# Pipeline and Redirection in Shell Scripts

# List files and directories, and then filter for specific files using g

ls -l | grep text

# Count the number of lines in a file using wc

cat text1.txt | wc -l 

# Redirecting Input and Output:

# Redirection involves changing the source or destination of input or output streams of a 
# command. The operators used for redirection are > (output) and < (input). 

# Redirect Output to a File: 

# ls > file_list.txt

# Append Output to a File: 

echo "New content" >> text1.txt


# Redirect Input from a File

sort < unsorted.txt > sorted.txt

# What’s happening:

# < unsorted.txt → means “take input from this file”.

# > sorted.txt → means “write output to this file”.

# Step-by-step:

# Normally, sort reads from the keyboard (standard input).
# If you just type sort, it waits for you to type lines and press Enter.

# Using < unsorted.txt tells sort to read lines from that file instead.

# > sorted.txt tells it to send the sorted output into another file, not to the terminal.

ls non_existent_folder 2> /dev/null

# What’s happening:
# 2> redirects error messages (standard error).

# /dev/null is a special file that discards whatever you send to it — it’s like a “trash can for data”.

# Step-by-step:
# ls non_existent_folder → tries to list files in a folder that doesn’t exist.

# Normally, you’d see:

# ls: cannot access 'non_existent_folder': No such file or directory


# But 2> /dev/null says:

# “Redirect all error output (2) to /dev/null — don’t show it.”

# So nothing appears on screen.

# In plain words:
# “Run this command, but hide the errors.”

