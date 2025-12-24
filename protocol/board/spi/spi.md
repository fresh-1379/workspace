# SPI 协议
Serial Perripheral Interface 串行外围设备接口

串行，同步，全双工

## SPI 引脚
①、CS/SS，Slave Select/Chip Select，这个是片选信号线，用于选择需要进行通信的从设备。
I2C 主机是通过发送从机设备地址来选择需要进行通信的从机设备的，SPI 主机不需要发送从机
设备，直接将相应的从机设备片选信号拉低即可。
②、SCK，Serial Clock，串行时钟，和 I2C 的 SCL 一样，为 SPI 通信提供时钟。
③、MOSI/SDO，Master Out Slave In/Serial Data Output，简称主出从入信号线，这根数据线
只能用于主机向从机发送数据，也就是主机输出，从机输入。
④、MISO/SDI，Master In Slave Out/Serial Data Input，简称主入从出信号线，这根数据线只
能用户从机向主机发送数据，也就是主机输入，从机输出。

## 工作模式 
主从机双方需要确定工作模式
SPI 有四种工作模式，通过串行时钟极性(CPOL)和相位(CPHA)的搭配来得到四种工作模式：
①、CPOL=0，串行时钟空闲状态为低电平。
②、CPOL=1，串行时钟空闲状态为高电平，此时可以通过配置时钟相位(CPHA)来选择具
体的传输协议。
③、CPHA=0，串行时钟的第一个跳变沿(上升沿或下降沿)采集数据。
④、CPHA=1，串行时钟的第二个跳变沿(上升沿或下降沿)采集数据。

