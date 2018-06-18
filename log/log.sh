#!/bin/bash

while true
do
	ping -c 1 -w 2 192.0.2.3 > /dev/null

if [ $? -eq 0 ]
	then
		echo -n "."
	else
		echo -n "!"
		beep
	fi

sleep 10
done
