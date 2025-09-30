#!/bin/bash
# Looping 

# for Loop
# Used to iterate over lists, arrays, or ranges.
for i in {1..5}; do
  echo "iteration $i"
done

# while loop
# Executes commands as long as a specified condition is true.

count=1
while [ $count -le 5 ]; do
  echo "Count: $count"
  ((count++))
done


#until 
# runs commands until a condition becomes true (opposite logic of while)

until [ $count -ge 10 ]; do
  echo "Count: $count"
  ((count++))
done


