## 网路工具

### SSH
####  windows server openssh
```powershell
Start-Service sshd # 启动服务
netstat -an | findstr /i ":22" # 查看端口
Set-Service -Name sshd -StartupType 'Automatic' # 设置服务开机启动
```


### NFS
#### client
```bash
#Ubuntu
apt-get install nfs-common
# 挂载 (-o nfsvers=4.0 指定nfs版本)
mount -t nfs <service ip> :service_path local_path -o nfsvers=4.0
umount local_path # 卸载
```
#### server
```bash
apt-get install nfs-kernel-server
mkdir -p /var/nfs/share
chmod -R 777 /var/nfs/share
echo "/var/nfs/share 192.168.5*(rw,sync,no_root_squash)" >> /etc/exports
exportfs -a # 刷新exports
#启动服务
#SysVinit 
service nfs-kernel-server restart 
#或
/etc/init.d/nfs-kernel-server start
#systemd
systemctl start nfs-kernel-server
```

