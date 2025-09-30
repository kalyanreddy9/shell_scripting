#!/bin/bash

#conditional statements 

num=10
if [ $num -gt 11 ]; then
  echo "Number is greater than 11"
elif [ $num -eq 10 ]; then 
  echo "Number is equal to 10"
else 
  echo "Number is less than 10"
fi

# case 

fruit="Apple"

case $fruit in
  "banana")
    echo "It's a banana"
    ;;
  "Apple")
    echo "It's an Apple"
    ;;
  "orange")
    echo "It's an Orange"
    ;;
  *)
    echo "Unknown fruit"
    ;;
esac
