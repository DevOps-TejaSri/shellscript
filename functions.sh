#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run this script with root user access"
    exit 1
fi

VALIDATE(){
     if [ $1 -ne 0 ]; then
        echo "$2 ... failed"
        exit 1
     else 
        echo "$2 .... Success"
fi
}

dnf install nginx -y
VALIDATE $? "Installing Nginx"

dnf install mysql -y
VALIDATE $? "Installing Mysql"

dnf install nodejs -y
VALIDATE $? "Installing nodejs"


