#!/bin/bash
red="\[31m"
green="\[32m"
yellow="\[33m"
nc="\[0m"
logsdir="/var/log/shellscript-logs"
scriptname="echo $0 | cut -d "." -f1"
logfile="$lgosdir/$scriptname.log"

mkdir -p $logsdir
echo "the dir is creted$(date)"|tee -a$logfile




userid=$(id -u)
if [$userid -ne 0 ]
then
    echo -e "$red Error:you are not a sudo $nc"|tee -a$logfile
    exit 1
else
    echo -e "$green success$nc: you are sudo"|tee -a$logfile
fi
validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$red error:$2 is not installed $nc" |tee -a$logfile
        exit 1
    else
        echo -e "$green success:$nc installed $2 successfully"|tee -a$logfile
    fi

}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e"$red error:$nc mysql is not installed"|tee -a$logfile
    dnf install mysql -y&>>$logfile
    validate $? "mysql"
else
    echo -e"$yellow mysql is already installed$nc"|tee -a$logfile
fi
dnf list installed nginx &>>$logfile
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it" | tee -a $LOG_FILE
    dnf install nginx -y &>>$logfile
    VALIDATE $? "nginx"
else
    echo -e "Nothing to do nginx... $yellow already installed $nc" | tee -a $LOG_FILE
fi