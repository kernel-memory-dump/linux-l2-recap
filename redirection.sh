#!/bin/bash

# > - Redirect output to a file (overwrite).
# >> - Append output to a file.
# < - Redirect input from a file.
# 2> - Redirect error output.
# Use &> to combine standard output and error output: 
# Redirect both standard output and error output to the same file using &>.

#ls > output.txt 2> error.txt

echo "nesto" >> output.txt



 ls -000 &>> both-output-and-error.txt


