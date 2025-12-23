# SSH

## 介绍
SSH（Secure Shell）是一种加密的网络传输协议，用于在不安全的网络中提供安全的远程登录和其他安全网络服务。

### SSH 主要功能
远程登录（替代 Telnet、rlogin）
安全文件传输（SCP、SFTP）
端口转发
远程命令执行


## 使用  
### 安装
```bash
sudo apt update
sudo apt install openssh-server openssh-client
```
### 服务管理
```bash
sudo systemctl start sshd         # systemd
sudo service ssh start            # SysVinit
```
### 远程登录/远程命令执行
```bash
# 基本语法
ssh [选项] [用户名@]主机名 [命令]

# 示例
ssh user@192.168.1.100
ssh -p 2222 user@example.com
ssh user@server "ls -la"

# 常用选项
-p port      指定端口
-i file      指定私钥文件
-l user      指定用户名
-v           详细模式（调试）
-q           安静模式
-X           启用X11转发    
-C           启用压缩
-f           后台运行
-N           不执行远程命令
-L           本地端口转发
-R           远程端口转发
-D           动态端口转发
```
### 文件传输/管理
#### SCP（Secure Copy）
```bash
# 复制本地文件到远程
scp file.txt user@hostname:/path/to/destination/
scp -P 2222 file.txt user@hostname:~/backup/

# 复制远程文件到本地
scp user@hostname:/path/to/file.txt /local/destination/
scp -r user@hostname:/remote/directory/ /local/destination/

# 常用选项
-r   递归复制目录
-P   指定端口
-C   启用压缩
-p   保留文件属性
-q   安静模式
```
#### SFTP（SSH File Transfer Protocol）
SFTP 是 SSH 的一个扩展，提供了文件传输功能。
```bash
# 连接SFTP
sftp user@hostname
sftp -P 2222 user@hostname

# SFTP常用命令
sftp> help                     # 查看帮助
sftp> ls                       # 列出文件
sftp> pwd                      # 显示远程当前目录
sftp> lpwd                     # 显示本地当前目录
sftp> cd /remote/path          # 切换远程目录
sftp> lcd /local/path          # 切换本地目录
sftp> get remote.txt           # 下载文件
sftp> put local.txt            # 上传文件
sftp> mget *.txt               # 下载多个文件
sftp> mput *.txt               # 上传多个文件
sftp> mkdir newdir             # 创建目录
sftp> rm file.txt              # 删除文件
sftp> rename old.txt new.txt   # 重命名
sftp> exit                     # 退出
```

### SSH 密钥认证
SSH 密钥认证是一种更安全的登录方式，它使用公钥/私钥对进行认证，私钥必须由用户自行生成，公钥由 SSH 服务器生成并存储在服务器上。
1. 生成密钥对
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" # 生成RSA密钥（推荐4096位）
ssh-keygen -t ed25519 -C "your_email@example.com"    # 生成Ed25519密钥
ssh-keygen -t ecdsa -b 521 -C "your_email@example.com" # 生成ECDSA密钥
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_work  # 指定密钥文件名
```
2. 将公钥添加到 authorized_keys 文件中
```bash
cat ~/.ssh/id_rsa.pub | ssh user@host "cat >> ~/.ssh/authorized_keys"
```
3. 测试
```bash
ssh user@host
```
4.密钥说明
```bash
~/.ssh/id_rsa          # 私钥文件（必须保密）
~/.ssh/id_rsa.pub      # 公钥文件（可以公开）
~/.ssh/authorized_keys # 服务器上的授权公钥列表
~/.ssh/known_hosts     # 已知主机公钥缓存
~/.ssh/config          # SSH客户端配置文件
```
5.密钥使用
```bash
# 指定密钥文件连接
ssh -i ~/.ssh/id_rsa_work user@hostname

# 使用ssh-agent管理密钥
eval $(ssh-agent)          # 启动agent
ssh-add ~/.ssh/id_rsa      # 添加私钥
ssh-add -l                 # 列出已加载密钥
ssh-add -D                 # 删除所有密钥
```


