UserId=$(id -u)
R="\e[31m"
N="\e[0m"
G="\e[32m"
Y="\e[33m"

LogsFolder="/var/log/shellscript-logs"
scriptname=$(echo $0 | cut -d "." -f1)
Log_File="$LogsFolder/$scriptname.log"
sourcedir=/home/ec2-user/app-logs

mkdir -p $LogsFolder

if [ $UserId -ne 0 ]
then
    echo " eRROR you are not a root" | tee -a $Log_File
    exit 1
else
    echo " you are running with root access" | tee -a $Log_File
fi



validate(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is $G successs $N" | tee -a $Log_File
    else
        echo -e "$R $2 is failure" | tee -a $Log_File
    fi
}

files_delete=$(find $sourcedir -name "*.log" -mtime +14)

while IFS= read -r filepath
do
    echo "deleting file: $filepath" | tee -a $Log_File
    rm -f $filepath
done <<< $files_delete

echo "execution completed"