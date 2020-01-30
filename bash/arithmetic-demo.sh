#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

firstnum=5
secondnum=2
sum=$((firstnum + secondnum))
dividend=$((firstnum / secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

cat <<EOF
$firstnum plus $secondnum is $sum
$firstnum divided by $secondnum is $dividend
  - More precisely, it is $fpdividend
EOF

variable1=8
variable2=2
sumofvariables=$((variable1 + variable2))
dividend=$((variable1 / variable2))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $variable1/$variable2}")

cat <<EOF
$variable1 plus $variable2 is $sumofvariables
$firstnum divided by $secondnum is $dividend
  - More precisely, it is $fpdividend
EOF

variable1=6
variable2=4
productofvariables=$((variable1 * variable2))
dividend=$((variable1 / variable2))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $variable1/$variable2}")

cat <<EOF
$variable1 multiply $variable2 is $productofvariables
$variable1 divided by $variable2 is $dividend
  - More precisely, it is $fpdividend
EOF
