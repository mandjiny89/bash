# Passing variables at command line so it can use in variables
# the correct way to execute the command is ./commandline_var.sh Shivan Parvathi

#!/bin/bash

echo "Enter the Username"
USERNAME=$1

echo "Enter the Password"
PASSWORD=$2

echo "This is your $USERNAME and $PASSWORD"

 
