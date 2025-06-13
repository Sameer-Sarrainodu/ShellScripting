#!/bin/bash
fruits=("apple" "banana" "mango" "jackfruit")

echo ${fruits[0]}
echo ${fruits[2]}

fruits[3]="guava"
fruits[4]="mangoes"

echo ${#fruits[@]}

echo ${fruits[@]}
echo ${fruits[*]}

echo ${!fruits[@]}

for fruit in "${fruits[@]}"
do
    echo "$fruit"
done
