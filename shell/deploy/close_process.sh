#!/bin/bash

if [ ! -n "$1" ] ;then
    echo "useage: ./close_process.sh [process_name]"
	exit
fi

process_name=$1

PID=`ps -ef | grep $1 | grep -v grep | awk '{print $2}'`
if [[ "" != "$PID" ]]; then                                             
echo "killing $PID"                                                     
kill -9 $PID                                                            
fi                                                                      