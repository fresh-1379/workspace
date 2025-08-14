#!/bin/bash

cvi_pinmux -w PWR_UART_TX/UART3_TX 
cvi_pinmux -w PWR_UART_RX/UART3_RX

stty -F /dev/ttyS3 115200 cs8 -cstopb -parenb -crtscts -echo	
