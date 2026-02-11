#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/c/DevOps/shellscript "
LOGS_FILE="/c/DevOps/shellscript/$0.log"
R="\e[31m"
G="\e[31m"
Y="\e[31m"
B="\e[31m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo -e "$R please run this script with root user access"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
     if [ $1 -ne 0 ]; then
        echo  -e "$2 ... $R failed" | tee -a $LOGS_FIL
        exit 1
     else 
        echo -e "$2 ....$G  Success" | tee -a $LOGS_FIL
    fi
}

for package in $@
do 
    dnf list installed $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then 
      echo "$package not installed,installing"
      dnf install $package -y &>>$LOGS_FILE
      VALIDATE $? "$package installation"
    else
        echo -e "$package already installed, $Y skipping $N"
    fi
done