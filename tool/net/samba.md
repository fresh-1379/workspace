# samba 介绍
背景
Samba 文件共享服务

1987年，微软公司和英特尔公司共同制定了SMB（server Messages Block）协议用来解决局域网内的文件或打印机等的资源共享问题。但是这时后还是解决不了跨系统之间的文件共享。直到1991年，在读大学的Tridgwell 基于SMB协议开发能够解决Linux系统和windows系统之间的文件的问题——也就是SMBServer服务测序。后来被命名为samba（根据一个拉丁舞名字）。如今，samba服务测序成为了在Linux和windows系统之间共享文件的最佳选择

了解Samba
上面的是samba的来源介绍，那么什么是samba呢？

关于这个问题，可以从以下几点来理解：

1、samba是一组软件包，是Linux支持SMB/CIFS协议（也称S/C）

2、samba可以在几乎所有的类UNIX平台上运行。

功能：
1、使Linux主机成为Windows网络的一份子，与Windows网络相互分享资源

2、使Linux主机可以使用Windows体统共享的文件和打印机

3、使Linux主机成为文件服务器或打印服务器，为Linux 、Windows客户端提供文件共享服务和远程打印服务



需要启动的服务：
1、smb服务：管理SAMBA服务器共享什么目录、文件、打印机

2、nmb服务：管理群组和netbios name解析  






# 搭建samba 服务器
实现从 **window** 访问并写入 **Linux** 的 samba共享文件夹
## 更新系统并安装Samba
``` bash
apt update
apt install samba
```
## 检查Samba是否安装成功
``` bash
samba --version
```
## 创建共享文件夹
``` bash
mkdir -p workplace
chomod -R 777 workplace
```
## 创建Samba用户并设置密码    
``` bash
smbpasswd -a leslie
```
## 编辑Samba的配置文件
``` bash
vim /etc/samba/smb.conf
```
### 在文件末尾添加
``` ini
[workplace]
comment = samba share folder
path = /home/igotu/workplace
public = no
writable = yes
available = yes
browseable = yes
valid users = igotu
guest ok = no
```
## 设置防火墙允许Samba
``` bash
ufw allow samba
ufw reload
```
## 确保windows和linux在同一网络
``` bash
ping xxx.xxx.xxx.xxx
```
## 刷新一下windows samba的缓存，在window的cmd中运行
``` bash
net use * /delete
```