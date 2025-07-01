#!/bin/bash

# Variables and Data Types in Shell Scripting, Along with Examples: 

# Declaring Variables
name="kalyan"
echo "Hello , $name"

# Integer Variable: 
age=25
echo "Age: $age years"

# Arithmetic Operations
x=5
y=10
sum=$(($x+$y))
echo "$sum"

# Concatenation:
greeting="Hello"
subject="kalyan"
echo "$greeting $subject how are you!"

# String Length:
string="Shell scripting"
length=${#string}
echo "$string is $length characters"

# Substring Extraction
substring=${string:0:5} #Extracts first five characters
echo "$substring" # prints shell

substring=${string:1:6} # extracts 6 characters from index 1
echo "$substring" # prints hell s

# Command Substitution
# Using backticks
current_date=`date`
echo "current date is:$current_date"

# Using $()
current_date=$(date)
echo "current date is: $current_date"
# Using date command with format  
formatted_date=$(date +"%Y-%m-%d %H:%M:%S")
echo "Formatted date is: $formatted_date"
# Using date command with custom format
custom_date=$(date +"%d-%m-%Y")
echo "Custom date is: $custom_date"

# Readonly Variables
readonly dhoni_jersey_number=7
echo "Dhoni's jersey number is: $dhoni_jersey_number"
# Uncommenting the next line will cause an error because dhoni_jersey_number is readonly
# dhoni_jersey_number=17

# Unsetting Variables
name="kalyan"
echo "Name before unset: $name"
unset name
echo "Name after unset: $name"   # This will print nothing because 'name' is unset

# Quoting Variables: Quoting variables properly is essential to preserve spaces and special characters: 
variable="Hello World*"
echo "uisng double quotes: $variable"  # uisng double quotes: Hello World*
echo 'using single quotes: $variable'  # using single quotes: $variable
echo using no quotes: $variable  # using no quotes: Hello World*
echo "Using double quotes: '$variable'" # Using double quotes: 'Hello World*'

# Escaping special characters
escaped_variable="Hello\$World"
echo "variable: $escaped_variable"  # Escaped variable: Hello$World