example
```shell
docker build -t leavesmc/minecraft-leaves-server:1.21.1-56 --build-arg URL=https://github.com/LeavesMC/Leaves/releases/download/1.21.1-9338453/leaves-1.21.1.jar .
```

run
```shell
docker run -dit --name leaves \
    --restart=unless-stopped \
    -p 25565:25565/tcp \
    -p 25565:25565/udp \
    -e MEMORY_MAX=8G \
    -v /srv/leaves:/data \
    leavesmc/minecraft-leaves-server:1.21.1-56
```