#!/bin/bash

# Regular Expressions

# Regular expressions are used in various Unix command-line tools like grep, sed, and awk 
# to perform pattern matching and text transformations.

refer this after some time  - # TODO

# In this example, the dot (.) is a special character in regex, so we escape it with a 
# backslash (\) to match a literal dot. 
# Example: Using sed with Regular Expression Suppose you want to replace all 
# occurrences of dates in the format "dd/mm/yyyy" with "mm/dd/yyyy" in a file named 
# dates.txt: 
# sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\2\/\1\/\3/' 
# dates.txt 
# Example: Using awk with Regular Expression Suppose you have a file named log.txt 
# with lines containing dates and events. You want to print lines with events that contain the 
# word "error": 
# awk '/error/ { print }' log.txt 