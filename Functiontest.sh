#!/bin/bash
greet(){
    echo "no of arg: $#"
    for arg in $@
    do
        echo "$arg"
    done
   for arg in "$*"
   do
    echo "$arg"
    done

}
greet "apple" "banana" "mango"