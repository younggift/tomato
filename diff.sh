#!/bin/bash

# time to have a break
task=$(atq -q r | cut -f2 | cut -d' ' -f 1,2,3,4,5 | sort | sed -n 2p )
# Normally, two task in the queue. 1. prebreak, 2. break.
if [ -z "$task" ]; then
    echo "No more than 1 minute left to have a break."
    exit 0
fi
task=$(date -d "$task" +%s)

# difference between task time to now
now=$(date -d "$(date)" +%s)

diff=$(($task-$now))
minute=$((diff/60))
sec=$((diff%60)) 

# format of seconds. If the second part is 1 digital, fill in zero before it.
if [ "$sec" -lt "10" ]; then
    sec=0$sec
else
    sec=$sec
fi

echo "$minute:$sec left to have a break."