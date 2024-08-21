### Bash Programming Course - Quick Reference Notes

#### **1. Syntax Overview**
- **Shebang**: `#!/bin/bash`
  - Defines the interpreter for the script.
- **Basic Structure**:
  ```bash
  #!/bin/bash
  # Comments are prefixed with #
  
  variable="value"  # Variable assignment (no spaces around =)
  echo "Hello, $variable"  # Variable usage
  
  if [[ condition ]]; then
      # Code block
      some_functions arg1 arg2
  fi
  
  for var in list; do
      # Code block
  done
  ```



### Comparison Operators in Bash

#### Integer Comparison

In Bash, comparison operators like `-gt` (greater than) and `-eq` (equal to) are used to compare integer values. 


- **`-gt`**: Greater than (>)
- **`-lt`**: Less than (<)
- **`-eq`**: Equal to (==)
- **`-ne`**: Not equal to (!=)
- **`-ge`**: Greater than or equal to (>=)
- **`-le`**: Less than or equal to (<=)


#### **Basic String Comparison**

In Bash, string comparison is typically done using the `==` and `!=` operators within `[[ ... ]]` or `[ ... ]` test expressions. These expressions allow you to compare strings for equality or inequality.

1. **Equality (`==`)**:
   ```bash
   if [[ "$str1" == "$str2" ]]; then
       echo "Strings are equal"
   fi
   ```

[>>MORE ON COMPARISON OPERATORS<<](NOTES/comparison.md)


#### **2. Best Practices**
- **Script Naming**: Use lowercase, hyphen-separated names (e.g., `backup-script.sh`).
- **Comments**: Add comments to explain complex logic.
- **Error Handling**: 
  - Use `set -e` to exit on error.
  - Use `set -u` to treat unset variables as errors.
  - Use `trap` to clean up resources on exit.
- **Indentation**: Use 2 or 4 spaces for readability.
- **Quoting**: Always quote variables (`"$var"`) to prevent word splitting.

#### **3. Variables and Functions**
- **Variable Declaration**: `VAR="value"`
- **Accessing Variables**: `$VAR` or `${VAR}`
- **Arrays**:
  ```bash
  arr=("item1" "item2" "item3")
  echo "${arr[0]}"  # Accessing elements
  ```
- **Functions**:
  ```bash
  my_function() {
      local var="local_value"  # Local variable
      echo "Function with $1"  # $1 is the first argument
  }
  my_function "argument"
  ```

  In Bash, functions do not have a traditional return statement like in some other programming languages. Instead, they return an exit status (a number between 0 and 255) using the return command. This exit status can be used to indicate success or failure. 
  
  To return a value other than an exit status, you typically use echo to output the value, which can then be captured using **command substitution**:

  ```bash
  # capture function result and exit status
  result=$(my_function "World")
  status=$?

  if [[ $status -eq 0 ]]; then
      echo "Function succeeded, returned: $result"
  else
      echo "Function failed"
  fi
  ```

[>>MORE ON FUNCTIONS<<](NOTES/functions.md)


#### **4. Process Handling**
- **Running Commands**:
  ```bash
  command &  # Run in background
  wait  # Wait for background processes
  ```
- **Process Management**:
  - `ps aux` - List running processes.
  - `kill PID` - Terminate a process by PID.
  - `trap 'cleanup_function' SIGINT SIGTERM` - Handle signals (e.g., `Ctrl+C`).
  
#### **5. Pipe and Stream Handling**
- **Pipe (`|`)**: Pass output of one command as input to another.
  ```bash
  cat file.txt | grep "pattern"
  ```
- **Redirection**:
  - `>` - Redirect output to a file (overwrite).
  - `>>` - Append output to a file.
  - `<` - Redirect input from a file.
  - `2>` - Redirect error output.
  ```bash
  ls > output.txt 2> error.txt
  ```

[>>MORE ON REDIRECTION<<](NOTES/redirection.md)

- **Here Document**:
  ```bash
  cat <<EOF
  This is
  a multi-line
  text block.
  EOF
  ```

#### **6. Sourcing and Libraries**
- **Source another script**:
  ```bash
  source /path/to/another_script.sh
  ```
  - or `. /path/to/another_script.sh`
- **Commonly Used Libraries**:
  - `awk`, `sed` - Text processing.
  - `grep`, `find` - Search utilities.
  - `curl`, `wget` - HTTP requests.
  - `jq` - JSON parsing.

#### **7. Best Practices for Scripts Handling Streams and Processes**
- **Chaining Commands**: Use `&&` and `||` to chain commands based on success or failure.
  ```bash
  command1 && command2  # Run command2 only if command1 succeeds
  ```
- **Using `xargs`**: Efficiently handle input from pipes.
  ```bash
  echo "arg1 arg2" | xargs -n 1 command
  ```
- **Avoiding Subshells**: Use loops over command substitution when possible to avoid creating subshells.
  ```bash
  while read line; do
      echo "$line"
  done < file.txt
  ```
