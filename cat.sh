#!/bin/bash
file.txt | grep "pattern"

# This command will extract all IP addresses from the file:
grep -oP '^\d{1,3}(\.\d{1,3}){3}' file.txt | grep "Chrome"

#fgrep -v "pattern" file.txt

#filter the lines where the action is LOGGED_IN and extract only the IP addresses:
grep "LOGGED_IN" file.txt | grep -oP '^\d{1,3}(\.\d{1,3}){3}'

