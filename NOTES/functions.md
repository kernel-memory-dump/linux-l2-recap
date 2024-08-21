In Bash, functions do not have a traditional return statement like in some other programming languages. Instead, they return an exit status (a number between 0 and 255) using the `return` command. This exit status can be used to indicate success or failure.

To return a value other than an exit status, you typically use **echo** to output the value, which can then be captured using command substitution.

### **1. Returning an Exit Status**
- By default, a Bash function returns the exit status of the last executed command.
- You can explicitly set the return status using the `return` command.

```bash
my_function() {
    local var="local_value"
    if [[ "$1" == "success" ]]; then
        return 0  # Success
    else
        return 1  # Failure
    fi
}

my_function "success"
echo "Function exited with status: $?"  # $? captures the exit status

my_function "failure"
echo "Function exited with status: $?"  # $? captures the exit status
```
- **Output**:
  - If the argument is "success", the function returns 0.
  - If the argument is anything else, the function returns 1.
  - `$?` contains the exit status of the last command (0 for success, non-zero for failure).

### **2. Returning a Value**
- To return a string or numeric value, you can use `echo` and capture the output with command substitution.

```bash
my_function() {
    local var="Hello, $1"
    echo "$var"  # Return a string by echoing it
}

result=$(my_function "World")
echo "Function returned: $result"
```
- **Output**:
  - The variable `result` will contain the string "Hello, World".

### **3. Combining Exit Status and Returned Value**
You can return a value via `echo` and still use an exit status to indicate success or failure.

```bash
my_function() {
    if [[ -z "$1" ]]; then
        echo "Error: No argument provided"
        return 1  # Failure
    else
        echo "Hello, $1"
        return 0  # Success
    fi
}

result=$(my_function "World")
status=$?

if [[ $status -eq 0 ]]; then
    echo "Function succeeded, returned: $result"
else
    echo "Function failed"
fi
```
- **Output**:
  - If an argument is provided, the function returns the greeting and an exit status of 0.
  - If no argument is provided, the function returns an error message and an exit status of 1.

### **Key Points**
- **Exit Status**: Use `return` to set the function's exit status (0 for success, non-zero for failure).
- **Returning Values**: Use `echo` to return a value, which can be captured with command substitution (`$()`).
- **Checking Success**: Use `$?` to check the exit status after calling the function.