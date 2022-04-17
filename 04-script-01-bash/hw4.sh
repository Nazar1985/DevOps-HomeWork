#!/usr/bin/env bash

hosts=("192.168.0.1" "173.194.222.133" "87.250.250.242" "90.150.52.49")

while true; do
  for host in "${hosts[@]}"; do
    for i in {1...5}; do
      nc -z -v -w3 $host 80 2>/dev/null
      res=$?
      if [ "$res" != 0 ]; then
        echo "`date` $host port 80 is closed" >> hosts.log
        exit
      else
        echo "`date` $host port 80 is open" >> hosts.log
      fi
    done
  done
done