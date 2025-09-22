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