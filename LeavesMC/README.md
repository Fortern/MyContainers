## Example

```shell
docker build -t leavesmc/minecraft-leaves-server:1.21.8-72 --build-arg URL=https://api.leavesmc.org/v2/projects/leaves/versions/1.21.8/builds/72/downloads/application .
```

## Run

默认以 UID 1500 和 GID 1500 运行 Java 进程。请提前处理好 data 目录的权限和所有者。

```shell
sudo mkdir /srv/leaves && sudo chown -R 1500:1500 /srv/leaves
```

运行容器

```shell
sudo docker run -dit --name leaves \
    --restart=unless-stopped \
    -p 25565:25565 \
    -e MEMORY_MAX=8G \
    -e TIME_ZONE="Asia/Shanghai" \
    -v /srv/leaves:/data \
    leavesmc/minecraft-leaves-server:1.21.8-72
```

## Supported Docker Environment Variables

| Variable       | Purpose                                                                              |     Sample Value      |
|----------------|--------------------------------------------------------------------------------------|:---------------------:|
| **MEMORY_MIN** | 添加JVM参数"-Xms$MEMORY_MIN", Default: 2G                                                |          3G           |
| **MEMORY_MAX** | 添加JVM参数"-Xms$MEMORY_MAX", Default: 4G                                                |          12G          |
| **TIME_ZONE**  | 如果设置则添加JVM参数"-Duser.timezone=$TIME_ZONE", Default: "UTC"                             |     Asia/Shanghai     |
| **EULA_AGREE** | 添加JVM参数"-Dcom.mojang.eula.agree=$EULA_AGREE", Default: "false"。 如果在eula.txt中设置，则忽略此项 |         true          |
| **JVM_ARGS**   | 其他的JVM参数                                                                             | -Dhttp.proxyPort=2080 |
