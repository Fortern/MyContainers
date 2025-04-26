## example
```shell
sudo docker build -t leavesmc/minecraft-leaves-server:1.21.4-33 --build-arg URL=https://github.com/LeavesMC/Leaves/releases/download/1.21.4-33-c75affe/leaves-1.21.4.jar .
```

## run
默认以 UID 25565 和 GID 25565 运行 Java 进程。如果你指定了 --user 参数，则需要你手动处理 data 目录的权限。
```shell
sudo mkdir /srv/leaves && sudo chown -R 25565:25565 /srv/leaves
sudo docker run -dit --name leaves \
    --restart=unless-stopped \
    -p 25565:25565 \
    -e MEMORY_MAX=8G \
    -v /srv/leaves:/data \
    leavesmc/minecraft-leaves-server:1.21.4-33
```