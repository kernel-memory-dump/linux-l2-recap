#!/bin/bash

# Find all log files larger than 100MB in the /var/log directory and delete them

# Searches the /var/log directory
# -type f: Only finds files
# -name "*.log": Matches files with a .log extension
# -size +100M: Finds files larger than 100MB
find /var/log -type f -name "*.log" -size +100M | \
            # Pipes the output of find (a list of log files) to xargs
            xargs -d '\n' \
            # Specifies that xargs should treat newlines as delimiters, ensuring it handles filenames with spaces correctly
            -I {} \
            # Tells xargs to replace {} with the actual filename in the command that follows
            rm -v "{}"
            # rm -v: Deletes the file and prints the name of the file being deleted
            # "{}": Represents the filename provided by xargs
