#!/bin/bash

# Script to create users, set initial password, and force password reset upon first login.
# Takes input file with user names
# on the command line as the first argument
# Reset the <PASSWORD> value below with whatever initial password you wish to set for your users.

#User List File
USERLIST=$1

if [ "$USERLIST" = "" ]
then
	echo "Please specify an input file!"
	exit 10
elif test -e $USERLIST
then
	for user in `cat $USERLIST`
	do
    		echo "Creating the "$user" user and setting initial password..."
		useradd -m $user && echo $user:<PASSWORD> | chpasswd && passwd -e $user			
	done
		echo "User must change password upon first login."
	exit 20
else
	echo "Invalid input file specified!"
	exit 30
fi
