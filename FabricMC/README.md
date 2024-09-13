example
```shell
docker build -t minecraft-fabric-server:1.21.1-0.16.5 --build-arg URL=https://meta.fabricmc.net/v2/versions/loader/1.21.1/0.16.5/1.0.1/server/jar .
```

run
```shell
docker run -dit --name fabric \
    --restart=unless-stopped \
    -p 25565:25565/tcp \
    -p 25565:25565/udp \
    -e MEMORY_MAX=8G \
    -v /srv/fabric:/data \
    minecraft-fabric-server:1.21.1-0.16.5
```