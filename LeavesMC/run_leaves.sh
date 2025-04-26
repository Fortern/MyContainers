#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
  LEAVES_USER='leaves'
  LEAVES_GROUP='leaves'
  
  if ! id "$LEAVES_USER" >/dev/null 2>&1; then
    groupadd --system --gid 25565 $LEAVES_USER
    useradd --system --uid 25565 --gid 25565 --home-dir /opt/leaves --no-create-home $LEAVES_GROUP
  fi

  chown -R $LEAVES_USER:$LEAVES_GROUP /data /opt/leaves
  echo "running as uid $LEAVES_USER:$LEAVES_GROUP"
  JAVA_CMD="gosu $LEAVES_USER:$LEAVES_GROUP java"
else
  echo "running as uid $(id -u)"
  JAVA_CMD="java"
fi

exec $JAVA_CMD -jar -Xms$MEMORY_MIN -Xmx$MEMORY_MAX $JAVAFLAGS /opt/leaves/leaves.jar nogui