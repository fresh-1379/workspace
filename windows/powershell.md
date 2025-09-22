## powershell 

### openssh
```powershell
Start-Service sshd # 启动服务
netstat -an | findstr /i ":22" # 查看端口
Set-Service -Name sshd -StartupType 'Automatic' # 设置服务开机启动

```
