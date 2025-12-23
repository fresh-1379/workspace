# UART 
(Universal Asynchronous Receiver/Transmitter)通用异步接收器/发送器
特性：串行、异步、全双工

## UART 引脚
RX
TX
一般还要接一个GNG

## 数据帧
1 位起始位（Start Bit） #低电平，空闲状态为高电平
5~9 位数据（Data Bit） #一般是 8 位
可选的 1 位奇偶校验位（Parity Bit） #偶校验：偶个1
1~2 位停止位（Stop Bit） #高电平

## 串口波特率
一位数据时间的倒数 

## TOOL
SSCOM、XCOM、SecureCRT、MobaxTerm、Putty

