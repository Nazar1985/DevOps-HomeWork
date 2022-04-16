#!/usr/bin/env bash

hosts=("192.168.0.1:80" "173.194.222.133:80" "87.250.250.242:80" "90.150.52.49:80")

while True; do
  for host in "${hosts[@]}"; do
    for i in {1..2}; do
      status=$(curl -Is --connect-timeout 5 "$host" | grep HTTP | awk '{print $2 " " $3 " " $4}' )
      err_status=$(curl -Is --connect-timeout 5 "$host" 2>&1)
      echo $err_status
#      if [[ $status=~"curl: (" ]] ; then
#        echo 25
#      fi
      echo "$host" "status = $status" >> hosts.log
    done
  done
done

sleep 10
