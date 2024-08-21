function command1 {
  echo "Command 1"
  return 0
}

function command2 {
  echo "Command 2"
  return 0
}

function command_that_takes_long {
  sleep 5
  echo "Command that takes long"
}

command1 && command2  # Run command2 only if command1 succeeds


command_that_takes_long &  # Run in background
wait  # Wait for background processes