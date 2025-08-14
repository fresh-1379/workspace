#!/bin/bash

# 配置 pinmux
cvi_pinmux -w I2S0_SCLK/GPIO0
cvi_pinmux -w I2S0_WSI/GPIO1
cvi_pinmux -w I2S0_SDI0/GPIO2
cvi_pinmux -w I2S0_SDI1/GPIO3
# 导出 gpio
echo 480 > /sys/class/gpio/export
echo 481 > /sys/class/gpio/export
echo 482 > /sys/class/gpio/export
echo 483 > /sys/class/gpio/export
# 设置方向
echo out > /sys/class/gpio/gpio480/direction
echo out > /sys/class/gpio/gpio481/direction
echo in > /sys/class/gpio/gpio482/direction
echo in > /sys/class/gpio/gpio483/direction
