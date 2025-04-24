## example
```shell
sudo docker build -t leavesmc/minecraft-leaves-server:1.21.4-33 --build-arg URL=https://github.com/LeavesMC/Leaves/releases/download/1.21.4-33-c75affe/leaves-1.21.4.jar .
```

## run
This data directory needs to be writable by the Leaves process, which runs as UID 25565 and GID 25565.
```shell
sudo mkdir /srv/leaves && sudo chown -R 25565:25565 /srv/leaves
sudo docker run -dit --name leaves \
    --restart=unless-stopped \
    -p 25565:25565 \
    -e MEMORY_MAX=8G \
    -v /srv/leaves:/data \
    leavesmc/minecraft-leaves-server:1.21.4-33
```