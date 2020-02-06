#!/bin/bash
###############
# Variables   #
###############
name="$USER"
hostname="$(hostname)"
day=$(date +%A)
currenttime=$(date +%I:%M\ %p)
###############
# Main        #
###############
if [ "$day" = Monday ]
then
cows="Welcome to planet $hostname, joyful $name!"
elif [ "$day" = Tuesday ]
then
cows="Welcome to planet $hostname, knowing $name!"
elif [ "$day" = Wednesday ]
then
cows="Welcome to planet $hostname, knowledgeable $name!"
elif [ "$day" = Thursday ]
then
cows="Welcome to planet $hostname, ladylike $name!"
elif [ "$day" = Friday ]
then
cows="Welcome to planet $hostname, alluring $name!"
elif [ "$day" = Saturday ]
then
cows="Welcome to planet $hostname, loyal $name!"
else
cows="Welcome to planet $hostname, musical $name!"
fi
cowsay "$cows It is $currenttime on $day ."
