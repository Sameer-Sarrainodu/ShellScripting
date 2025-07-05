#!/bin/bash
red="\[31m"
green="\[32m"
yellow="\033[1;33m"
nc="\[0m"
logsdir="/var/log/shellscript-logs"
scriptname=$(basename "$0" | cut -d "." -f1)
logfile="$logsdir/$scriptname.log"
packages=("mysql" "nginx","python")


mkdir -p $logsdir
echo "the dir is creted$(date)"|tee -a$logfile




userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo -e "${red} Error:you are not a sudo $nc"|tee -a$logfile
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
# for package in ${packages[@]}
for package in "$@"
do
    dnf list installed $package&..$logfile
    if [ $? -ne 0 ]
    then
        echo -e"$red error:$nc $package is not installed"|tee -a$logfile
        dnf install $package -y&>>$logfile
        validate $? "$package"
    else
        echo -e"$yellow $package is already installed$nc"|tee -a$logfile
    fi
done


