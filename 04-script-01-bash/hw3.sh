#!/usr/bin/env bash

hosts=("192.168.0.1:80" "173.194.222.133:80" "87.250.250.242:80")

for host in "${hosts[@]}"; do
  for i in {1..5}; do
    status=$(curl -Is --connect-timeout 5 "$host" | grep HTTP | awk '{print $2 " " $3 " " $4}')
    echo "$host" "status = $status" >> hosts.log
  done
done
