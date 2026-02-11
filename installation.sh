#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run this script with root user access"
    exit 1
fi
echo "Installing Nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
   echo "Installing Nginx ... failed"
   exit 1
else 
    echo "Installing Nginx .... Success"
fi
