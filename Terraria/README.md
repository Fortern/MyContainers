进入目录Terraria

build

```shell
chmod +x docker-build.sh
./docker-build.sh $version $image_name
```

run

```shell
docker run -dit --name terraria \
    -p 7777:7777 \
    -e PASSWORD=password \
    -e LANG=zh\Hans \
    -e PLAYERS=8 \
    -v /srv/terraria:/Terraria \
    terraria:1449
```
