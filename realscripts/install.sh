#!/bin/bash

#sql installation

userid=$(id -u)
if [ $userid -eq 0 ]
then
    echo "you are root"
else
    echo "error: run as root"
    exit 1
fi
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed"
    dnf install mysql -y"
    if [ $? -eq 0]
    then
        echo "successful installed mysql"
    else
        "it faied"
        exit 1
    fi
else
    echo "already installed"
fi