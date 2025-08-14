#!/bin/bash

cvi_pinmux -w UART1_TX/UART1_TX 
cvi_pinmux -w UART1_RX/UART1_RX

stty -F /dev/ttyS1 115200 cs8 -cstopb -parenb -crtscts
