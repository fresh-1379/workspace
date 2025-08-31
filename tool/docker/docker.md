## Docker

### 安装docker 及基础配置
```
https://icnzf4iyui92.feishu.cn/wiki/UVNqwXZ0fiL7Egkq7HzcR9SLn3g
```

### 常用命令
#### 容器
```bash
# 查看容器
docker ps # 正在运行的容器
docker ps -a # 所有容器
```
```bash
# 启动容器
docker start <container_id>
# 停止容器
docker stop <container_id>
# 删除容器
docker rm <container_id>
```
```bash
# 基于镜像启动容器
function run_1688_docker() {
    docker run \
        -e LOCAL_USER_ID=`id -u` \
        --privileged \
        -v /dev:/dev -itd -v $2:/project/$1 \
        --name $1 bm1688_docker:latest /bin/bash 
}
#-e LOCAL_USER_ID=$(id -u)：将主机当前用户的UID传递给容器
#--privileged：给予容器几乎所有主机权限
#-v /dev:/dev：将主机设备目录映射到容器
#-v $2:/project/$1：将主机路径($2)映射到容器内的/project/$1
# -i : 保持标准输入打开（交互模式）
# -t : 创建一个伪终端（tty）
# -d : 后台运行容器（守护模式）
# --name 容器名称
# bm1688_docker:latest 镜像名称
#/bin/bash 启动shell

docker exec -it <container_id> /bin/bash
# 进入容器
exit
# 退出容器
```

#### 镜像
```bash
# 查看镜像
docker images
# 删除镜像
docker rmi <image_id>
```

#### 快照 (不保存元数据)
```bash
# 创建快照
docker export <container_id> > <file_name>.tar
# 导入快照
docker import <file_name>.tar <image_name>
```

#### 保存容器 （保存元数据）
```bash
# 创建镜像
docker commit <container_id> <image_name>
# 保存镜像
docker save <image_name> > <file_name>.tar
# 导入镜像
docker load < <file_name>.tar
```


### Dockerfile

