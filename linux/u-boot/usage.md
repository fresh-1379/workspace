##  u-boot  使用

```bash
 help 或 ?   
 ? bootz 或 help bootz 
 ```

###  查询命令
```bash
bdinfo   #板级信息
printenv #环境变量
version  #uboot版本信息
```

### 环境变量操作
#### 修改环境变量
```bash
setenv bootdelay 5
saveenv #保存
```
#### 新建环境变量
```bash
setenv author 'console=ttySTM0,115200 root=/dev/mmcblk2p2 rootwait rw '
saveenv
```
#### 删除环境变量
```bash
setenv author
saveenv
```

###  内存操作
#### 显示内存值
```bash
md[.b, .w, .l] address [# of objects]
eg:
     md.b 0x10000000 10
#.b, .w, .l :byte、word 和 long
#[# of objects]表示要查看的数据长度
```
#### 改变内存值
```bash
#修改单个地址
nm [.b, .w, .l] address
eg:
     nm.b 0x10000000
#地址递增
mm [.b, .w, .l] address
eg:
     mm.b 0x10000000
```


### 网络命令
### EMMC 和 SD 卡操作
#### 
```bash
mmc info #当前选中的mmc设备信息
mmc list #列出所有mmc设备
mmc rescan #重新扫描当前 MMC 设备
mmc dev [dev] [part] #切换当前 MMC 设备 dev: 设备编号，part: 分区编号
mmc part #列出当前 MMC 设备的分区信息
mmc read addr blk cnt  
#读数据到ddr, addr:ddr目标地址, blk:起始块号, cnt:块数 eg:=> mmc read 0x21000000 0x4000 0x100


```

### 文件系统操作



### boot操作
```bash
bootm [addr [arg ...]]
#用于启动 uImage 镜像文件,主要有三个参数addr是 Linux 镜像文件在 DRAM 中的位置，第二个参数就是 initrd 在 DRAM 中的地址，第三个参数，用来指定设备树在 DRAM 中的地址 ；如果不需要 initrd 的话第二个参数就用‘-’来代替
#example: bootm c2000000 - c4000000
bootz [addr [initrd[:size]] [fdt]]
#用于启动 zImage 镜像文件,用法与bootm相似
boot / bootd
#两个命令相同，boot 会读取环境变量bootcmd来启动Linux 系统
```

### 其他常用命令


### MII
```bash
# PHY 芯片 YT8531 u-boot驱动采用默认延时，不采用设备树配置
sophon# dhcp
ethernet@290e0000 Waiting for PHY auto negotiation to complete......... TIMEOUT !
phy_startup() failed: -110FAILED: -110ethernet@290f0000 Waiting for PHY auto negotiation to complete......... TIMEOUT !
phy_startup() failed: -110FAILED: -110s
```
```bash
# 手动配置PHY0（地址0）
# 1. 解锁扩展页（标准方法）
mii write 0 0x1E 0xA5B       # 设置扩展页地址
mii write 0 0x1F <value>     # 写扩展页数据（此处未指定）

# 2. 配置延迟（正确寄存器）
mii write 0 0x1E 0xA003      # 设置RGMII配置寄存器地址
mii write 0 0x1F 0x000F      # 示例：TX/RX延迟使能（根据表15配置）

# 3. 返回标准页
mii write 0 0x1E 0x0000      # 地址偏移归零

# 4. 完整重启自协商
mii write 0 0 0x9200         # 0x9200 = bit15(复位)+bit9(重启自协商)+bit12(使能)
```
或 
```bash
mii write 0 31 0xa5b       # 解锁扩展页0xA5B
mii write 0 27 0x003       # 使能TX和RX内部延迟
mii write 0 31 0           # 切换回标准页
mii write 0 0 0x1200       # 重启自动协商
```
基础寄存器直接读
```
# 读基本状态寄存器(0x01)
=> mii read 0 1
Reading from PHY 0 register 1: 782d  # 返回值16进制
```


### 实际用例 （算能BM688）
```
dhcp;setenv serverip 192.168.5.184;setenv netmask 255.255.255.0;saveenv #配通网络
tftp 0x100100000 fip.bin #下载镜像
mmc dev 0 1;mmc write 0x100100000 0 0x800 #保存镜像到emmc启动分区（boot0） 默认地址偏移 : 0  块数： hex 0x800 dec 2048
```



