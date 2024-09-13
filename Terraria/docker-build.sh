#!/bin/bash

wget -O t.zip https://terraria.org/api/download/pc-dedicated-server/terraria-server-$1.zip
unzip -q t.zip && rm t.zip
mv $1/Linux ./ && rm -rf $1
docker build -t $2:$1 . && rm -rf Linux

