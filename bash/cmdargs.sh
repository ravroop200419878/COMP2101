#!/bin/bash
# This script demonstrates how the shift command works
# create an empty array to put the command line arguments into
myargs=()
# loop through the command line arguments
while [ $# -gt 0 ]; do
# tell the user of how many things are present on the command line
echo "There are $# things left to process on the command line."
# adding whatever exists in $1 to the myargs array
myargs+=("$1")
# inform the user about the things we did
echo "Added \'$1\' to the arguments array"
echo "Processing '$1'."
case $1 in
-h )
echo 'Added "-h" for help.'
;;
-v )
echo 'Added "-v" for varbose.'
;;
-d )
case "$2" in
[1-5] )
echo "Added -d for debug level $2."
shift
;;
*)
echo "The -d option must be followed with a number [1-5]. "
shift
esac
shift
;;
*)
errors=$1
echo "Error: unkown value $errors"
;;
esac
# In the loop, shift the arguments left
# this decrements the argument count for us
shift
# informs the user about shifted things
echo "Shifted command line, leaving $# things left to process."
echo "========================================================"
# check again if something is left to be done
done
echo "Done"
