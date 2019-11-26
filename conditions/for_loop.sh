#!/bin/bash

# Using for loop to display all the files and cat out in the folder we run


LIST=`ls *.sh`

for SHELLSCRIPT in $LIST
  do
    DISPLAY="`cat $SHELLSCRIPT`" 
    echo "File=$i - Content=$DISPLAY"
    echo ""
    echo "=========================================================================="
done
