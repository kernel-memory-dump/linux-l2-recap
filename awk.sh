# Use awk to count the number of times each IP address appears
# in the log data and display it.
awk -F, '
BEGIN { print "IP Address, Count" }
NR>1 { ip_count[$1]++ }
END {
  for (ip in ip_count) {
    print ip ", " ip_count[ip]
  }
}' file.txt


