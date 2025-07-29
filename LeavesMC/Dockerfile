FROM eclipse-temurin:21-jdk

EXPOSE 25565
ENV MEMORY_MIN="2G" MEMORY_MAX="4G" TIME_ZONE="UTC" JVM_ARGS=""
VOLUME /data
WORKDIR /data

RUN apt update && apt install -y gosu && apt clean && rm -rf /var/lib/apt/lists/*

ARG URL
ADD "${URL}" /opt/leaves/leaves.jar
COPY --chmod=755 run_leaves.sh /opt/leaves

CMD ["/opt/leaves/run_leaves.sh"]