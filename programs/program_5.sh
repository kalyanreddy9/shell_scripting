#!/bin/bash
# Functions

greet() {
  echo "hi , good morning"
}
#call the greet function
greet # hi , good morning


print_args() {
  echo "first Argument: $1" #first Argument: hi
  echo "second Argumnet: $2" # second Argumnet: kalyan
  echo "$@" # hi kalyan
  echo "$*" # hi kalyan
}

print_args hi kalyan

# exit status of a function to convey success (0) or failure (non-zero)

calculate_sum() {
  num1=$1
  num2=$2
  sum=$((num1+num2))
  echo "$sum" # 15
}

calculate_sum 10 5

# Capture with command substitution
# echo still prints, but since you wrapped the function call with $(...),
# the printed value is captured into a variable instead of being shown directly.
result=$(calculate_sum 20 5)
echo "sum: $result" # sum: 25

# So the rule is:
# echo inside a function always prints to stdout.
# If you just call the function → you see it in the terminal.
# If you use $(...) → you capture it into a variable.
# If you redirect (> file) → it goes into the file

# Using return (exit status only)

is_even() {
  local n="$1"
  if (( n % 2 == 0 )); then
    return 0;
  else
    return 1
  fi
}

if is_even 4; then
  echo "Even" # ven
else
  echo "Odd"
fi
