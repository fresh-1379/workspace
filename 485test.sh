#!/bin/bash
echo $0
echo $1

if [ "$1" = "1" ]; then  # ✅ 修正空格问题
	  echo 1 > /sys/class/gpio/gpio457/value
	    echo "you can send somedata..." > /dev/ttyS1
    else
	      echo "you will receive data..."
	        echo 0 > /sys/class/gpio/gpio457/value
		  cat /dev/ttyS1
fi
