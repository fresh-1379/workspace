## Systemd  
开机时，Systemd只执行/etc/systemd/system目录里面的配置文件  
```
systemctl enable httpd  
```
相当于在/etc/systemd/system目录添加一个符号链接，指向/usr/lib/systemd/system里面的httpd.service文件

### 基本使用
#### 显示全部服务
```
systemctl list-units --type=service
```


