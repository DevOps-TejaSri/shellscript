#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/c/DevOps/shellscript "
LOGS_FILE="/c/DevOps/shellscript/$0.log"

if [ $USERID -ne 0 ]; then
    echo "please run this script with root user access"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
     if [ $1 -ne 0 ]; then
        echo "$2 ... failed" | tee -a $LOGS_FIL
        exit 1
     else 
        echo "$2 .... Success" | tee -a $LOGS_FIL
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
        echo "$package already installed,skipping"
    fi
done