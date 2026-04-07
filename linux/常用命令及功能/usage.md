## Linux 常用命令

### 重定向
```bash
ls -l > file.txt #标准输出
#标准输出和标准错误都重定向到同一个文件
your_command > output.log 2>&1  #或
your_command &> output.log
ls -l >> file.txt #追加写
```

```bash
usermod -aG sudo username #将用户添加到sudo组
groups username #查看用户所属组
```


## Kernel

### 启动地址
```
root@sophon:/home/linaro# cat /proc/iomem
100000000-103ffffff : System RAM
100000000-10009ffff : reserved
1001f2000-1001fdfff : reserved
100200000-10131ffff : Kernel code  #代码
101320000-10157ffff : reserved
101580000-10177ffff : Kernel data  #数据
102e00000-102ffffff : reserved
10386f000-103ffffff : reserved
```


### FIT镜像
[text](https://www.cnblogs.com/arnoldlu/p/17912109.html)

hexdump -C /dev/mmcblk0boot1

### DKMS

```
#dkms.conf,保存到源码目录
PACKAGE_NAME="multi_port"
PACKAGE_VERSION="1.0.7"
BUILT_MODULE_NAME[0]="multi_port"
DEST_MODULE_LOCATION[0]="/kernel/extra"
AUTOINSTALL="yes"
MAKE[0]="make -C \${kernel_source_dir} M=\${dkms_tree}/\${PACKAGE_NAME}/\${PACKAGE_VERSION}/build modules"
```

步骤
```
1. sudo cp -r /home/l/workplace/X200/DEngine_edge10_v1.17.0/tydpf/download_package/edge-driver/usb /usr/src/multi_port-1.0.7 #拷贝源码到/usr/src/<PACKAGE_NAME>-<PACKAGE_VERSION>
2. sudo dkms add -m multi_port -v 1.0.7
3. sudo dkms build -m multi_port -v 1.0.7
4. sudo dkms install -m multi_port -v 1.0.7
5. sudo modprobe multi_port 


6. sudo dkms remove -m multi_port -v 1.0.7 --all
7. sudo dkms uninstall -m multi_port -v 1.0.7
8. sudo dkms status

```
