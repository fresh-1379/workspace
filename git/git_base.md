## 本地仓库

保存到index  
git add .

提交到本地仓库  
git commit -m ""

撤回提交  
git reset --soft  HEAD~1

查看提交日志  
git log

用户名与邮箱 
```
仅当前项目生效  
git config user.name ""  
git config user.email ""  
全局有效  
git config --global user.name ""  
git config --global user.email ""  
```
查看配置  
```
git config --local --list  
git config --global --list
```
创建分支



## 远程仓库
```bash
# 1. 首先添加远程仓库（如果尚未添加）
git remote add origin <远程仓库URL>
# 4. 推送到远程仓库
git push -u origin main
```
