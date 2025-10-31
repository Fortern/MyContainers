FROM bellsoft/liberica-openjdk-debian:21

EXPOSE 25565
ENV MEMORY_MIN="2G" MEMORY_MAX="4G" TIME_ZONE="UTC" JVM_ARGS="" EULA_AGREE="false" ENABLE_MAXIN="false"
VOLUME /data
WORKDIR /data

RUN apt update && apt install -y gosu && apt clean && rm -rf /var/lib/apt/lists/*
COPY --chmod=755 run_leaves.sh /opt/leaves/

ARG URL
ADD "${URL}" /opt/leaves/leaves.jar

CMD ["/opt/leaves/run_leaves.sh"]
