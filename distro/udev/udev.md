## udev

udev是Linux系统中的一个设备管理器，它可以根据设备的属性动态地创建设备文件，并执行特定的命令，通常用来处理热插拔。

### udev规则介绍  
udev 使用一组规则来定义设备的特性和行为。这些规则存放在/etc/udev/rules.d/ 目录下的规则文件中，这些文件命名"XX-名称 .rules"，其中"XX"是文件的优先级，按顺序执行。名字可以是任何有描述性的名称。
```bash
ACTION=="action", KERNEL=="kernel", ATTR{attribute}=="value", ... , RUN{command}
```
ACTION：触发规则的事件类型，例如 add、remove、change 等。
KERNEL：设备的内核名称，通常是 /dev 下设备文件的名称，不包括 /dev/ 前缀。
ATTR{attribute}：设备的属性，通常与 sysfs 文件系统中的属性相对应。
VALUE：属性的值
RUN{command}：当规则匹配时要执行的命令。规则文件中的每一行通常是一个单独的规则，或者可以通过 \ 符号将一条规则延续到下一行，注释以 # 开头。

==：表示等于。
!=：表示不等于。 >、<、>=、<= ：表示大小比较。
RUN{}：在规则匹配时运行的程序，RUN+ 表示在所有规则处理完毕后运行。
IMPORT{}：导入一个外部程序的结果到环境中。
NAME：设置设备节点的名称。
SYMLINK：为设备节点创建符号链接。
OWNER、GROUP、MODE：设置设备节点的所有权、组和权限。

![alt text](image.png)


重新加载 udev 规则
```bash
sudo udevadm control --reload-rules  # 重新加载 udev 规则
sudo udevadm trigger # 触发 udev 规则
sudo udevadm monitor # 监视正在运行的 udev 事件
sudo udevadm info /dev/sdX
```


