#!/bin/bash

# grep is a command-line tool used to search for specific patterns in text files. 

grep "ls " program_9.sh # ls /non-existent-directory # ls: cannot access '/non-existent-directory': No such file or directory

# grep → searches for text patterns in a file.

# "ls" → the pattern (string) you are searching for.

# program_9.sh → the file where grep will look.

# It will print all lines from program_9.sh that contain the word ls.

# sed(Stream Editor)
# Think of sed as a find-and-replace tool for text streams.
# It reads input line by line, applies transformations, and outputs the result.

# sed 's/old/new/' file.txt

# s = substitute
# old = text to find
# new = text to replace

echo "I like Apple" | sed 's/Apple/banana/'  # I like banana

echo "I like Apple Apple" | sed 's/Apple/banana/' # I like banana Apple

# Add g (global) to replace all matches in a line:
echo "I like Apple Apple" | sed 's/Apple/banana/g'  # I like banana banana

echo "I like Apple Apple" | sed '/Apple/d'

sed '/error/d' text_1.txt # sed just reads the file and prints the modified output to stdout (your terminal).

# sed -i '/error/d' text_1.txt # to modify the file in place use the -i (in-place) option:

# sed, you can specify a range of lines

# sed -n 'START,ENDp' file.txt

# START → starting line number - start is optional 

# END → ending line number

# p → print

sed -n '2p' text_1.txt # error - line 2

sed -n '3,4p' text_1.txt 
# error - line 3
# error - line 4

# sed 'N i\TEXT' file.txt
# N → line number before which the text should be inserted.

# i → insert command.

# TEXT → the text you want to insert.

sed '2 i\error - line 2a' text_1.txt

# Quick memory trick:

# i → insert before

# a → append after

# c → change (replace line)