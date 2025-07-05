#!/bin/bash
red="\[31m"
green="\[32m"
yellow="\[33m"
nc="\[0m"

userid=$(id -u)
if [$userid -ne 0 ]
then
    echo -e "$red Error:you are not a sudo $nc"
    exit 1
else
    echo -e "$green success$nc: you are sudo"
fi
validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$red error:$2 is not installed $nc" 
        exit 1
    else
        echo -e "$green success:$nc installed $2 successfully"
    fi

}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e"$red error:$nc mysql is not installed"
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e"$green mysql is already installed"
fi