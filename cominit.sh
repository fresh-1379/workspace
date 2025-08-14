#!/bin/bash

cvi_pinmux -w PAD_VIVO0_D13/GPIO131
echo 355 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio355/direction
echo 1 > /sys/class/gpio/gpio355/value
