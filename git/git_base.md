### 基本操作
```
#添加文件到暂存区
git add .
#提交到本地仓库  
git commit -m "xxx"
#撤回提交  
git reset --soft  HEAD~1
```
用户名与邮箱 
```
仅当前项目生效  
git config user.name "zx.Ling"  
git config user.email "lingzhixin@cs-t.cn"  
全局有效  
git config --global user.name "zx.Ling"  
git config --global user.email "lingzhixin@cs-t.cn"  
```
查看配置  
```
git config --local --list  
git config --global --list
```
### Git 查看提交历史
```bash
#查看提交日志  
#git log 命令用于查看 Git 仓库中提交历史记录
git log
    -n :显示最近n条提交
    -p：显示提交的补丁（具体更改内容）。
    --oneline：以简洁的一行格式显示提交信息。
    --graph：以图形化方式显示分支和合并历史。
    --decorate：显示分支和标签指向的提交。
    --author=<作者>：只显示特定作者的提交。
    --since=<时间>：只显示指定时间之后的提交。
    --until=<时间>：只显示指定时间之前的提交。
    --grep=<模式>：只显示包含指定模式的提交消息。
    --no-merges：不显示合并提交。
    --stat：显示简略统计信息，包括修改的文件和行数。
    --abbrev-commit：使用短提交哈希值。
    --pretty=<格式>：使用自定义的提交信息显示格式。
    --reverse: 倒序显示提交

#git blame 命令用于逐行显示指定文件的每一行代码是由谁在什么时候引入或修改的。
git blame [选项] <文件路径>
    -L <起始行号>,<结束行号>：只显示指定行号范围内的代码注释。
    -C：对于重命名或拷贝的代码行，也进行代码行溯源。
    -M：对于移动的代码行，也进行代码行溯源。
    -C -C 或 -M -M：对于较多改动的代码行，进行更进一步的溯源。
    --show-stats：显示包含每个作者的行数统计信息。
```
#### 恢复和回退
```bash
1.git checkout：检查出特定版本的文件
#恢复工作目录中的文件到某个提交：
git checkout <commit> -- <filename>
#切换到特定提交：
git checkout <commit>
#这种方式切换到特定的提交时，处于分离头指针（detached HEAD）状态

2.git reset：重置工作目录
    --soft：只重置 HEAD 到指定的提交，暂存区和工作目录保持不变。
    --mixed（默认）：重置 HEAD 到指定的提交，暂存区重置，但工作目录保持不变。
    --hard：重置 HEAD 到指定的提交，暂存区和工作目录都重置。
    git reset --soft <commit>
例如：
    git reset --soft  HEAD~1

3.git revert：撤销某次提交
git revert 命令创建一个新的提交，用来撤销指定的提交，它不会改变提交历史，适用于已经推送到远程仓库的提交

4、git reflog：查看历史操作记录
git reflog 命令记录了所有 HEAD 的移动。即使提交被删除或重置，也可以通过 reflog 找回。
```

### Git 分支管理
创建分支
```
git checkout -b <branchname> #创建分支并切换到该分支
git checkout (branchname) #切换到已有分支
```












### 远程仓库
```bash
# 1. 首先添加远程仓库（如果尚未添加）
git remote add origin <远程仓库URL>
# 4. 推送到远程仓库
git push -u origin main
```
