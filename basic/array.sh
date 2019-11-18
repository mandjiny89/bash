#!/bin/bash
# This program will hold a array and display the value it stored

SERVERLIST=("server1" "server2" "server3" "server4")
COUNT=0

for i in ${SERVERLIST[@]}; do
        echo "This is server count: ${SERVERLIST[COUNT]}" # Here it get the count value as 0 as first declared value
        COUNT="`expr $COUNT + 1`" # This count will trigger after the first count get the value currently the value is 0 + 1, next 1 + 1 and go on. 
done
