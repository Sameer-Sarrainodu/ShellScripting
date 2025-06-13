#!/bin/bash
greet(){
    echo "no of arg: $#"
    for arg in $@
    do
        echo $arg
    done
    echo $*
    echo "$*"

}
greet "apple" "banana" "mango"