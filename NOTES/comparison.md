
### Integer Comparison Operators in Bash

Here’s how you can use these comparison operators in a simple `if` statement:

```bash
#!/bin/bash

# Define two integer variables
num1=10
num2=20

# Check if num1 is greater than num2
if [ $num1 -gt $num2 ]; then
  echo "$num1 is greater than $num2"
else
  echo "$num1 is not greater than $num2"
fi

# Check if num1 is equal to num2
if [ $num1 -eq $num2 ]; then
  echo "$num1 is equal to $num2"
else
  echo "$num1 is not equal to $num2"
fi
```

### Explanation:

- **`[ $num1 -gt $num2 ]`**: This checks if `num1` is greater than `num2`. If `num1` is greater, the `then` branch is executed; otherwise, the `else` branch is executed.
- **`[ $num1 -eq $num2 ]`**: This checks if `num1` is equal to `num2`.

### Output:

If you run the script with `num1=10` and `num2=20`, the output will be:

```
10 is not greater than 20
10 is not equal to 20
```


In Bash, string comparison is typically done using the `==` and `!=` operators within `[[ ... ]]` or `[ ... ]` test expressions. These expressions allow you to compare strings for equality or inequality.

### **Basic String Comparison**

1. **Equality (`==`)**:
   ```bash
   if [[ "$str1" == "$str2" ]]; then
       echo "Strings are equal"
   fi
   ```

2. **Inequality (`!=`)**:
   ```bash
   if [[ "$str1" != "$str2" ]]; then
       echo "Strings are not equal"
   fi
   ```

### **Using `[ ... ]` for Comparison**

- You can also use `[ ... ]` for string comparison, but be cautious with whitespace and quotes:
  ```bash
  if [ "$str1" = "$str2" ]; then
      echo "Strings are equal"
  fi
  ```

### **Other String Comparison Operators**

1. **Check if a string is non-empty**:
   ```bash
   if [[ -n "$str" ]]; then
       echo "String is not empty"
   fi
   ```

2. **Check if a string is empty**:
   ```bash
   if [[ -z "$str" ]]; then
       echo "String is empty"
   fi
   ```

### **Case-Insensitive Comparison**
To perform a case-insensitive string comparison, you can use `,,` or `^^` to convert the strings to lowercase or uppercase before comparing:

```bash
if [[ "${str1,,}" == "${str2,,}" ]]; then
    echo "Strings are equal (case-insensitive)"
fi
```
- `${str1,,}` converts the string to lowercase.

### **Example Usage**

```bash
str1="Hello"
str2="hello"

# Case-sensitive comparison
if [[ "$str1" == "$str2" ]]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi

# Case-insensitive comparison
if [[ "${str1,,}" == "${str2,,}" ]]; then
    echo "Strings are equal (case-insensitive)"
else
    echo "Strings are not equal (case-insensitive)"
fi
```

### **Summary**
- Use `[[ "$str1" == "$str2" ]]` for comparing strings for equality.
- Use `[[ "$str1" != "$str2" ]]` for comparing strings for inequality.
- Use `[[ -z "$str" ]]` to check if a string is empty.
- Use `[[ -n "$str" ]]` to check if a string is non-empty.
- Use case modification (`,,` or `^^`) for case-insensitive comparisons.
