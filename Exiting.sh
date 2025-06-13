#!/bin/bash
userid=$(id -u)
if [ $userid -eq 0 ]
then
    echo "matched success"
else
    echo "unsuccess"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "my sql not installed"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "it is successful"
    else
        echo "mysql is not installed"
    fi
else
    echo "it is installed already"
fi


