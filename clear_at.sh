#!/bin/bash

task=$(atq -q r | cut -f1 )
if [ -z "$task" ]; then
    echo "No task in queue r."
    exit 0
fi

for t in $task //遍历数组
do
    atrm $t
done
