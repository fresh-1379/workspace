
## 嵌入式Linux系统启动流程 

|阶段	|重点 |描述
|:-------|:--------:|:-------|
|BootROM |芯片内部固化程序 |1.初始化：配置最基本的CPU、时钟、内存控制器<br>2.确定启动设备：根据芯片引脚电平（Boot Mode）或内部寄存器，选择从哪个设备加载下一阶段代码（如：SD卡、eMMC、NAND Flash、UART、USB等）。<br>3.加载：从选定的启动设备中，将Bootloader（通常是其前一小部分）加载到芯片的内部SRAM中。
|Bootloader |uboot |1.硬件初始化：更完整地初始化DDR内存、网卡、存储控制器等外部设备。<br>2.加载内核映像：从存储介质（Flash、网络等）将Linux内核镜像（通常是zImage或uImage）和设备树二进制文件（dtb）加载到DDR内存的指定地址。<br>3.传递参数：为内核准备好启动参数（bootargs），包括控制台终端、根文件系统位置等关键信息。<br>4.跳转执行：将CPU的控制权移交给内核，跳转到内核入口地址。
|Linux内核 | 内核 |1.解压自解压：如果是压缩内核，先自解压。<br>2.体系结构相关初始化：继续初始化CPU、内存页表，建立虚拟内存空间。<br>3.解析设备树：读取Bootloader传递来的DTB文件，获取硬件拓扑结构，动态生成platform_device。<br>4.驱动初始化：按顺序调用内核和驱动中的初始化函数，初始化所有子系统（如进程调度、内存管理、VFS）。<br>5.挂载根文件系统：根据bootargs中的root=参数（例如root=/dev/mmcblk0p2或root=/dev/ram0），找到并挂载根文件系统。这是从内核空间到用户空间的关键一步。<br>6.启动第一个用户进程：执行根文件系统中的/sbin/init（PID=1）。控制权从此移交给用户空间。
|用户空间 |  应用程序 |1.Init进程启动：内核启动的第一个进程，是所有进程的祖先。<br>2.读取配置文件：<br>     传统SysV init：读取/etc/inittab，按脚本启动服务。<br>   主流Systemd：执行/lib/systemd/systemd，读取/etc/systemd/下的单元文件，并行、高效地启动服务。<br>    嵌入式常用BusyBox init：读取/etc/inittab，定义诸如::sysinit:/etc/init.d/rcS等动作。

