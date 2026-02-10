#!/bin/bash

echo "All args passed to script: $@"
echo " Number of variables passed : $#"
echo "script name: $0"
echo "present directory: $PWD"
echo "who is running: $USER"
echo "Home directory of current user: $HOME"
echo "PID of this cript: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"