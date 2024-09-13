FROM eclipse-temurin:21-jre

ARG URL

ADD "${URL}" /opt/minecraft/fabric.jar

EXPOSE 25565

ENV MEMORY_MIN="2G"
ENV MEMORY_MAX="4G"
ENV JAVAFLAGS="-Dcom.mojang.eula.agree=true"

VOLUME /data
WORKDIR /data

ENTRYPOINT ["sh", "-c", "exec java -jar -Xms$MEMORY_MIN -Xmx$MEMORY_MAX $JAVAFLAGS /opt/minecraft/fabric.jar nogui"]
