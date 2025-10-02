#!/bin/bash

# Arrays

# Arrays in shell scripts are 0-indexed

fruits=("Apple" "Banana" "Orange")

echo "first Fruit: ${fruits[0]}" # first Fruit: Apple
echo "second Fruit: ${fruits[1]}" # second Fruit: Banana
echo "third Fruit: ${fruits[2]}"  # third Fruit: Orange
echo "fourth Fruit: ${fruits[3]}" # fourth Fruit:

#Looping Through Arrays

# for loop

for fruit in "${fruits[@]}"; do 
  echo "Fruit: $fruit"
done

# Fruit: Apple
# Fruit: Banana
# Fruit: Orange

# while loop
index=0
while [[ $index -lt ${#fruits[@]} ]]; do 
  echo "fruit: ${fruits[$index]}"
  index=$((index + 1))
done

# fruit: Apple
# fruit: Banana
# fruit: Orange


#  Array Manipulation:

#  adding, removing, and updating  elements


# adding an element 

fruits+=("Grapes")

printf "%s," "${fruits[@]}" # Apple,Banana,Orange,Grapes,

fruits[1]="Chiku"

printf "\n"
printf "%s," "${fruits[@]}" # Apple,Chiku,Orange,Grapes,

#  Removing an element  

unset fruits[0]

printf "\n"
printf "%s," "${fruits[@]}" # Chiku,Orange,Grapes,
