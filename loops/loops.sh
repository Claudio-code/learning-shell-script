#!/bin/bash

for i in $(seq 10); do
  echo "counting $i"
done

COUNTER=0
while [ $COUNTER -lt 5 ]; do
  printf "$COUNTER :), "

  let COUNTER=COUNTER+1;
done

# until repeat while the condition is false
until ps -e | grep firefox > /dev/null
do
  echo "the firefox browser not is open"
done