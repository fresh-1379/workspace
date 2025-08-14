#!/bin/bash
cvi_pinmux -w PCIE0_L0_WAKEUP_X/GPIO41
echo 457 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio457/direction
#echo ${2} > /sys/class/gpio/gpio457/value
#cat  /sys/class/gpio/gpio457/value
