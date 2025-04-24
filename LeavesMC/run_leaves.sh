#!/bin/sh
exec java -jar -Xms$MEMORY_MIN -Xmx$MEMORY_MAX $JAVAFLAGS /opt/leaves/leaves.jar nogui