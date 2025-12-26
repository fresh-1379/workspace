# some knowledge in linux 



## 设备启动流程：--以bm1688为例

### FSBL :  
ROM  -->  ATF (BL2)-->  u-boot (BL33) 

ROM : 固化的引导程序  
SPL 或 FSPL : 启动程序  作为ATF中的BL2
运行在RAM中 初始化DDR　
（->BL31->BL32->BL31->BL33）
u-boot : 引导程序  BL33

### U-boot

### initramfs  
(Buildroot的根文件系统，busybox) 

### rootfs (overly)

### systemd



