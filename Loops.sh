#!/bin/bash
echo "for loop:"
for i in {1..5}
do
echo "$i"
done

for ((i=0; i<5;i++))
do
echo "$i"
done

echo "while loop:"
count=1
while [ $count -le 3 ]
do
echo "$count"
((count++))
done