#!/bin/bash
FILENAME="$1"
if [ -e "$FILENAME" ];
then
  for ip in $(cat $FILENAME);
  do
    ping -c 1 $ip | grep "bytes from" | cut -d " " -f4 | cut -d ":" -f1 &
  done
else
  echo "You must specify an input file!"
fi
wait
