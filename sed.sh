#!/bin/bash

# Use sed to replace the user agent "Chrome" with "Firefox" in the data

# RegExpression 
# 
sed 's/Chrome/Firefox/g' file.txt > sed_example_output.csv
