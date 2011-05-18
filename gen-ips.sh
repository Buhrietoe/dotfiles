#!/bin/bash
filename="ips.txt"
rm -f $filename
echo "start generating all ip addresses"
for ip1 in $(seq 10 10);
do
  for ip2 in $(seq 0 0);
  do
    echo "$ip1.$ip2.xxx.xxx"
    for ip3 in $(seq 0 1);
    do
      for ip4 in $(seq 1 254);
      do
        echo "$ip1.$ip2.$ip3.$ip4" >> $filename
      done
    done
  done
done
for ip1 in $(seq 192 192);
do
  for ip2 in $(seq 168 168);
  do
    echo "$ip1.$ip2.xxx.xxx"
    for ip3 in $(seq 0 1);
    do
      for ip4 in $(seq 1 254);
      do
        echo "$ip1.$ip2.$ip3.$ip4" >> $filename
      done
    done
  done
done
