#!/bin/bash
# String Manipulation in Shell Scripts
# Concatenation

string1="Hello, "
string2="world"
result=$string1$string2
echo "Concatenated string: $result" # Concatenated string: Hello, world

#Substring Extraction

substring=${result:7:5}
echo "substring: $substring" # substring: world

# searching and replacing 

# | **Replace first match**     | `${str/pattern/repl}`  | `str="a_b_c"; echo ${str/_/-}`        | `a-b_c`            |


# Inside ${...} the name of the variable is referenced directly, without $.

# Bash already knows string is a variable because of the ${...} syntax.

# Using $string inside ${...} like ${$string/.../...} is invalid syntax.


string="abc_abc_abc"
replace="_"
replace_with="-"
result=${string/$replace/$replace_with}

echo "final String: $result" # final String: abc-abc_abc


# | **Replace all matches**     | `${str//pattern/repl}` | `str="a_b_c"; echo ${str//_/-}`       | `a-b-c`            |

result=${string//$replace/$replace_with}

echo "final String: $result" # final String: final String: abc-abc-abc


