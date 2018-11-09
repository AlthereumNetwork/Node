kill $(ps aux | grep 'bootnode' | awk '{print $2}')
kill $(ps aux | grep 'geth' | awk '{print $2}')
