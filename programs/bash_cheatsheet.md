# Bash Symbols Cheat Sheet

## 💲 Dollar (`$`)
| Symbol | Purpose | Example | Output / Meaning |
|--------|----------|---------|------------------|
| `$VAR` | Variable value | `echo $USER` | current username |
| `$1 $2 …` | Script arguments | `echo $1` | first argument |
| `$$` | Script PID | `echo $$` | process ID |
| `$?` | Exit code | `ls nofile; echo $?` | `2` (error code) |
| `$#` | Arg count | `echo $#` | number of args |
| `$@` | All args (separate) | `for a in "$@"; do echo $a; done` | each arg printed |
| `$*` | All args (one string) | `echo $*` | args as single string |

---

##  Curly Braces (`{}`)
| Symbol | Purpose | Example | Output / Meaning |
|--------|----------|---------|------------------|
| `${}` | Expansion | `echo ${USER}123` | `user123` |
| `{a,b,c}` | Brace expansion | `echo {x,y,z}` | `x y z` |
| `{1..3}` | Sequence | `echo {1..3}` | `1 2 3` |

---

##  Double Parentheses (`(( ))`)
| Symbol | Purpose | Example | Output / Meaning |
|--------|----------|---------|------------------|
| `(( ))` | Arithmetic | `echo $((3+2))` | `5` |
| `((a=7))` | Assign math | `echo $a` | `7` |
| `for ((i=0;i<3;i++))` | C-style loop | prints 0 1 2 |

---

## Brackets (`[ ]` and `[[ ]]`)
| Symbol | Purpose | Example | Output / Meaning |
|--------|----------|---------|------------------|
| `[ ]` | Old test | `[ 5 -gt 3 ] && echo ok` | `ok` |
| `[[ ]]` | New test (safer) | `[[ $a == "hi" ]]` | true if `$a` is hi |
| `[[ $str =~ ^h.*o$ ]]` | Regex | `hello` matches |

---

## Parentheses (`()`)
| Symbol | Purpose | Example | Output / Meaning |
|--------|----------|---------|------------------|
| `( )` | Subshell | `(cd /tmp; ls)` | runs in child shell |
| `(1 2 3)` | Array | `arr=(a b c)` | `${arr[1]} → b` |
| `${#VAR}` | String length | `echo ${#USER}` | e.g. `5` |
| `${VAR:1:3}` | Substring | `echo ${USER:1:3}` | chars 1–3 |
| `${VAR:-def}` | Default | `echo ${X:-hello}` | `hello` if X unset |
| `${VAR^^}` | Uppercase | `echo ${USER^^}` | ALL CAPS |
| `${VAR,,}` | Lowercase | `echo ${USER,,}` | all small |

## Functions
| Usage                        | Example                                                                    | What Happens                  |
| ---------------------------- | -------------------------------------------------------------------------- | ----------------------------- |
| **Echo (print to terminal)** | `bash myfunc(){ echo "hello"; } myfunc `                                   | Prints `hello` to screen      |
| **Echo + Capture**           | `bash myfunc(){ echo "hello"; } result=$(myfunc); echo "$result" `         | `result` gets `hello`         |
| **Echo + Redirect**          | `bash myfunc(){ echo "hello"; } myfunc > out.txt `                         | Writes `hello` into `out.txt` |
| **Return (status only)**     | `bash check(){ [ $1 -gt 0 ]; return $?; } check 5; echo $? `               | Prints `0` (success)          |
| **Return used in if**        | `bash is_even(){ (( $1 % 2 == 0 )); } if is_even 4; then echo "Even"; fi ` | Prints `Even`                 |

## [[ ... ]] vs (( ... )) in Bash
| Feature            | `[[ ... ]]` (Test command) | `(( ... ))` (Arithmetic evaluation)  |
| ------------------ | -------------------------- | ------------------------------------ |
| **Purpose**        | String/file/number tests   | Pure arithmetic & numeric conditions |
| **Numeric check**  | `[[ $a -eq 5 ]]`           | `(( a == 5 ))`                       |
| **String check**   | `[[ $str == "hi" ]]`       | ❌ Not supported                      |
| **Regex match**    | `[[ $str =~ ^h.*o$ ]]`     | ❌ Not supported                      |
| **File test**      | `[[ -f file.txt ]]`        | ❌ Not supported                      |
| **Math operators** | Needs `$((...))` inside    | Direct: `(( a+b > 10 ))`             |
| **Modulo (%)**     | `[[ $((a % 2)) -eq 0 ]]`   | `(( a % 2 == 0 ))` ✅ simpler         |
| **Exit status**    | 0 = true, 1 = false        | 0 = true, 1 = false                  |

## Numeric vs String Checks in Bash
| Check Type           | `[[ ... ]]` (Test style) | `(( ... ))` (Arithmetic style) | Example  |
| -------------------- | ------------------------ | ------------------------------ | -------- |
| **Equal**            | `[[ $a -eq $b ]]`        | `(( a == b ))`                 | 5 == 5 ✅ |
| **Not equal**        | `[[ $a -ne $b ]]`        | `(( a != b ))`                 | 5 != 3 ✅ |
| **Less than**        | `[[ $a -lt $b ]]`        | `(( a < b ))`                  | 3 < 5 ✅  |
| **Less or equal**    | `[[ $a -le $b ]]`        | `(( a <= b ))`                 | 5 <= 5 ✅ |
| **Greater than**     | `[[ $a -gt $b ]]`        | `(( a > b ))`                  | 7 > 3 ✅  |
| **Greater or equal** | `[[ $a -ge $b ]]`        | `(( a >= b ))`                 | 5 >= 5 ✅ |


## String Checks (only [[ ... ]])

| Check Type        | Example                | True if                    |
| ----------------- | ---------------------- | -------------------------- |
| **Equal**         | `[[ $str == "hi" ]]`   | `$str` exactly equals "hi" |
| **Not equal**     | `[[ $str != "hi" ]]`   | `$str` not equal to "hi"   |
| **Empty**         | `[[ -z $str ]]`        | `$str` is empty            |
| **Not empty**     | `[[ -n $str ]]`        | `$str` has length > 0      |
| **Pattern match** | `[[ $str == h* ]]`     | `$str` starts with "h"     |
| **Regex match**   | `[[ $str =~ ^h.*o$ ]]` | `$str` matches regex       |

## 📁 File Tests (only [[ ... ]])

| Test         | Example         | True if                        |
| ------------ | --------------- | ------------------------------ |
| Exists       | `[[ -e file ]]` | File exists                    |
| Regular file | `[[ -f file ]]` | File exists & is a normal file |
| Directory    | `[[ -d dir ]]`  | Directory exists               |
| Executable   | `[[ -x file ]]` | File is executable             |
| Readable     | `[[ -r file ]]` | File is readable               |
| Writable     | `[[ -w file ]]` | File is writable               |

## String Manipulation in Shell Scripts
| Operation                   | Syntax                 | Example                               | Result             |
| --------------------------- | ---------------------- | ------------------------------------- | ------------------ |
| **Length**                  | `${#str}`              | `str="Hello"; echo ${#str}`           | `5`                |
| **Substring**               | `${str:pos:len}`       | `str="Hello"; echo ${str:1:3}`        | `ell`              |
| **From position to end**    | `${str:pos}`           | `str="Hello"; echo ${str:2}`          | `llo`              |
| **Remove shortest prefix**  | `${str#pattern}`       | `str="file.txt"; echo ${str#*.}`      | `txt`              |
| **Remove longest prefix**   | `${str##pattern}`      | `str="file.txt.bak"; echo ${str##*.}` | `bak`              |
| **Remove shortest suffix**  | `${str%pattern}`       | `str="file.txt"; echo ${str%.*}`      | `file`             |
| **Remove longest suffix**   | `${str%%pattern}`      | `str="file.txt.bak"; echo ${str%%.*}` | `file`             |
| **Replace first match**     | `${str/pattern/repl}`  | `str="a_b_c"; echo ${str/_/-}`        | `a-b_c`            |
| **Replace all matches**     | `${str//pattern/repl}` | `str="a_b_c"; echo ${str//_/-}`       | `a-b-c`            |
| **Replace prefix if match** | `${str/#pattern/repl}` | `str="abc"; echo ${str/#a/Z}`         | `Zbc`              |
| **Replace suffix if match** | `${str/%pattern/repl}` | `str="abc"; echo ${str/%c/Z}`         | `abZ`              |
| **Default if empty/unset**  | `${var:-default}`      | `unset x; echo ${x:-"N/A"}`           | `N/A`              |
| **Assign default if unset** | `${var:=default}`      | `unset x; echo ${x:="Hi"}`            | sets & prints `Hi` |

## String Concatenation
| Operation                | Syntax             | Example                                            | Result          |
| ------------------------ | ------------------ | -------------------------------------------------- | --------------- |
| **Simple concatenation** | `"$str1$str2"`     | `str1="Hello"; str2="World"; echo "$str1$str2"`    | `HelloWorld`    |
| **With literal text**    | `"$str1, $str2!"`  | `str1="Hello"; str2="World"; echo "$str1, $str2!"` | `Hello, World!` |
| **Append to variable**   | `var+="more text"` | `str="Hello"; str+=" World"; echo "$str"`          | `Hello World`   |


## Arrays (())

| Symbol / Operation                 | Purpose                   | Example                                                    | Output / Meaning           |
| ---------------------------------- | ------------------------- | ---------------------------------------------------------- | -------------------------- |
| `arr=(a b c)`                      | Declare indexed array     | `arr=("Apple" "Banana")`                                   | array with 2 elements      |
| `${arr[0]}`                        | Access element            | `echo ${arr[0]}`                                           | `Apple`                    |
| `${#arr[@]}`                       | Array length              | `echo ${#arr[@]}`                                          | `2`                        |
| `${arr[@]:0:2}`                    | Slice array               | `echo ${arr[@]:0:2}`                                       | `Apple Banana`             |
| `arr+=(value)`                     | Append element            | `arr+=("Orange")`                                          | adds `Orange`              |
| `unset arr[1]`                     | Remove element            | `unset arr[1]`                                             | removes element at index 1 |
| `${!arr[@]}`                       | Get all indexes           | `echo ${!arr[@]}`                                          | `0 1 2`                    |
| `for e in "${arr[@]}"; do ...`     | Loop through array        | `for f in "${arr[@]}"; do echo $f; done`                   | prints each element        |
| `declare -A colors`                | Declare associative array | `declare -A colors`                                        | key-value array            |
| `${colors[key]}`                   | Access associative array  | `colors[apple]="red"; echo ${colors[apple]}`               | `red`                      |
| `for k in "${!colors[@]}"; do ...` | Loop associative array    | `for k in "${!colors[@]}"; do echo $k ${colors[$k]}; done` | prints key → value         |

## when to use $

| Context                                      | Use `$`?         | Example                                  | Notes                                                       |
| -------------------------------------------- | ---------------- | ---------------------------------------- | ----------------------------------------------------------- |
| Access variable normally                     | ✅ Yes            | `echo $VAR`                              | Prints the value of `VAR`                                   |
| Inside **parameter expansion**               | ❌ No             | `${VAR}`, `${#ARRAY[@]}`, `${ARRAY[$i]}` | `$` is not needed inside `{}`                               |
| Inside **arithmetic evaluation** `(( ... ))` | ⚪ Optional       | `(( a + 1 ))` or `(( $a + 1 ))`          | Bash allows both, `$` is optional                           |
| On left side of assignment                   | ❌ No             | `VAR=5`                                  | Don’t put `$` when assigning                                |
| Command substitution                         | ✅ Yes            | `result=$(echo $VAR)`                    | `$VAR` is expanded inside command                           |
| Array element access                         | ✅ Only for index | `${ARRAY[$i]}`                           | `$i` is value of index; ARRAY itself has no `$` inside `{}` |
| Default / fallback                           | ❌ No             | `${VAR:-default}`                        | `$` not needed inside `{}`                                  |



## Bash Symbols Cheat Sheet

| Symbol  | Purpose                                 | Example                                             | Output / Meaning                 |           |                             |       |                           |
| ------- | --------------------------------------- | --------------------------------------------------- | -------------------------------- | --------- | --------------------------- | ----- | ------------------------- |
| `$`     | Variable expansion                      | `echo $USER`                                        | prints value of `$USER`          |           |                             |       |                           |
| `${}`   | Parameter expansion                     | `echo ${USER}`                                      | prints value of `$USER`          |           |                             |       |                           |
| `$#`    | Number of script arguments              | `echo $#`                                           | `3` if 3 args passed             |           |                             |       |                           |
| `$@`    | All script arguments (separate)         | `for a in "$@"; do echo $a; done`                   | prints each arg separately       |           |                             |       |                           |
| `$*`    | All script arguments (single string)    | `echo $*`                                           | args as one string               |           |                             |       |                           |
| `$$`    | PID of current script                   | `echo $$`                                           | e.g. `12345`                     |           |                             |       |                           |
| `$?`    | Exit status of last command             | `ls nofile; echo $?`                                | `2` (error code)                 |           |                             |       |                           |
| `@`     | Array expansion                         | `echo "${arr[@]}"`                                  | prints all array elements        |           |                             |       |                           |
| `!`     | History / negation / indirect reference | `!$` → last argument; `! var` in indirect reference | depends on context               |           |                             |       |                           |
| `#`     | Comment                                 | `# this is a comment`                               | ignored by shell                 |           |                             |       |                           |
| `#`     | Length of variable                      | `echo ${#var}`                                      | length of `$var`                 |           |                             |       |                           |
| `*`     | Wildcard / glob                         | `ls *.txt`                                          | matches all `.txt` files         |           |                             |       |                           |
| `?`     | Single character wildcard               | `ls file?.txt`                                      | matches `file1.txt`, `fileA.txt` |           |                             |       |                           |
| `:`     | Null command / no-op                    | `:`                                                 | does nothing, returns 0          |           |                             |       |                           |
| `[]`    | Test / character class                  | `[ $a -eq $b ]` or `[a-z]`                          | conditional test                 |           |                             |       |                           |
| `[[ ]]` | Extended test                           | `[[ $str == hi* ]]`                                 | safer test for strings, regex    |           |                             |       |                           |
| `()`    | Subshell                                | `(cd /tmp; ls)`                                     | executes in child shell          |           |                             |       |                           |
| `( )`   | Array declaration                       | `arr=(a b c)`                                       | array with elements              |           |                             |       |                           |
| `(( ))` | Arithmetic evaluation                   | `((a=3+2))`                                         | calculates 5                     |           |                             |       |                           |
| `{}`    | Brace expansion                         | `echo {1..3}`                                       | `1 2 3`                          |           |                             |       |                           |
| `>`     | Redirect stdout                         | `echo hi > file.txt`                                | write to file                    |           |                             |       |                           |
| `>>`    | Append stdout                           | `echo hi >> file.txt`                               | append to file                   |           |                             |       |                           |
| `<`     | Redirect stdin                          | `cat < file.txt`                                    | read from file                   |           |                             |       |                           |
| `       \| `                                       | Pipe                                                | `ls                              \| grep txt` | pass stdout to next command |       |                           |
| `&`     | Background process                      | `sleep 5 &`                                         | run in background                |           |                             |       |                           |
| `&&`    | Logical AND                             | `cmd1 && cmd2`                                      | run second if first succeeds     |           |                             |       |                           |
| `\|`    | Logical OR                              | `cmd1 \| cmd2` | run second if first fails |
| `!`     | Logical NOT                             | `! true`                                            | returns 1 (false)                |           |                             |       |                           |
| `~`     | Home directory                          | `cd ~`                                              | switches to home dir             |           |                             |       |                           |
| `\`     | Escape character                        | `echo "Hello\$"`                                    | prints `Hello$`                  |           |                             |       |                           |
| `"`     | Double quotes                           | `"text $var"`                                       | expands variables                |           |                             |       |                           |
| `'`     | Single quotes                           | `'text $var'`                                       | literal, no expansion            |           |                             |       |                           |
| `` ` `` | Command substitution                    | ``echo `date` ``                                    | executes command                 |           |                             |       |                           |
| `$()`   | Command substitution                    | `result=$(date)`                                    | safer command execution          |           |                             |       |                           |
| `;`     | Command separator                       | `echo hi; echo bye`                                 | run commands sequentially        |           |                             |       |                           |
| `,`     | Brace expansion                         | `echo {a,b,c}`                                      | prints `a b c`                   |           |                             |       |                           |
| `%`     | Modulus / string suffix removal         | `${var%pattern}`                                    | remove shortest suffix           |           |                             |       |                           |
| `%%`    | Longest suffix removal                  | `${var%%pattern}`                                   | remove longest suffix            |           |                             |       |                           |
| `#`     | Prefix removal                          | `${var#pattern}`                                    | remove shortest prefix           |           |                             |       |                           |
| `##`    | Longest prefix removal                  | `${var##pattern}`                                   | remove longest prefix            |           |                             |       |                           |


## grep — Search for patterns in text

| Command                  | Description                     | Example                            | Output                    |   |
| ------------------------ | ------------------------------- | ---------------------------------- | ------------------------- | - |
| `grep "error" file`      | Print lines containing `error`  | `grep "error" log.txt`             | Show only error lines     |   |
| `grep -i "error" file`   | Case-insensitive search         | Matches `error`, `Error`, etc.     |                           |   |
| `grep -v "error" file`   | Invert match (exclude)          | Exclude lines with `error`         |                           |   |
| `grep -n "error" file`   | Show line numbers               | `12:error found`                   |                           |   |
| `grep -r "pattern" dir/` | Recursive search in a directory |                                    |                           |   |
| `grep -E "error\|fail"` | Extended regex (multiple patterns) | Matches `error` or `fail` |



## sed — Stream editor for find/replace & line edits

| Command                        | Description                               | Example | Output |
| ------------------------------ | ----------------------------------------- | ------- | ------ |
| `sed 's/error/fix/' file`      | Replace first `error` with `fix` per line |         |        |
| `sed 's/error/fix/g' file`     | Replace all occurrences per line          |         |        |
| `sed -i 's/error/fix/g' file`  | Replace in the actual file                |         |        |
| `sed '/error/d' file`          | Delete lines containing `error`           |         |        |
| `sed -n '2p' file`             | Print only line 2                         |         |        |
| `sed '2 i\Inserted line' file` | Insert before line 2                      |         |        |
| `sed '2 a\Appended line' file` | Append after line 2                       |         |        |
| `sed '2 c\New line' file`      | Replace line 2 completely                 |         |        |

awk — Pattern scanning and processing

| Command                                 | Description              | Example                            | Output |
| --------------------------------------- | ------------------------ | ---------------------------------- | ------ |
| `awk '{print $1}' file`                 | Print first column       |                                    |        |
| `awk '/error/' file`                    | Print lines with `error` |                                    |        |
| `awk '{print NR, $0}' file`             | Show line numbers        | `1 line1`, `2 line2`               |        |
| `awk -F ":" '{print $1}' file`          | Use `:` as delimiter     | Print first field before `:`       |        |
| `awk '{sum+=$2} END {print sum}' file`  | Sum of 2nd column        |                                    |        |
| `awk '{if ($3 > 50) print $1,$3}' file` | Conditional printing     | Print only rows where 3rd col > 50 |        |

---

## Pro Tips
- ✅ Prefer `[[ ]]` over `[ ]`  
- ✅ Always **quote vars**: `"$VAR"`  
- ✅ Use `(( ))` for math, not `expr`  
- ✅ Subshell `( )` doesn’t affect parent shell  
