FROM eclipse-temurin:21-jdk

ARG URL
ADD "${URL}" /opt/leaves/leaves.jar
COPY --chmod=755 run_leaves.sh /opt/leaves

EXPOSE 25565
ENV MEMORY_MIN="2G" MEMORY_MAX="4G" JAVAFLAGS="-Dcom.mojang.eula.agree=true"
VOLUME /data
WORKDIR /data

RUN apt update && apt install -y gosu && apt clean && rm -rf /var/lib/apt/lists/*

CMD ["/opt/leaves/run_leaves.sh"]