
#!/bin/bash
#This script is intended to show how to do simple substitution

 

shopt -s expand_aliases  # This will allow alias to work within the code, rather to declare each alias in every system
 

alias TODAY="date"  # Here we are not calling the date function, we are just assinging a value to TODAY as date with double quotes

alias UFILES="find /home -user $USER"
 

TODAYSDATE=`date`

USERFILES=`find /home -user $USER`


echo "========================This is normal variable called in echo=========================================="

echo "Today's Date: $TODAYSDATE"

echo "All Files Owned by USER: $USERFILES"

echo "==================================================================="


A=`TODAY` #For some strange reason in shell script to call Alias I  have to declare as variable and call it 

B=`UFILES`


echo "=======================This is alias result============================================="
echo "With Alias, TODAY is: $A"

echo "With Alias, UFILES is: $B"

echo "===================================================================="
