FROM eclipse-temurin:21-jdk

ARG URL
ADD --chown=25565:25565 --chmod=755 "${URL}" /opt/leaves/leaves.jar
COPY --chown=25565:25565 --chmod=755 run_leaves.sh /opt/leaves
EXPOSE 25565
ENV MEMORY_MIN="2G" MEMORY_MAX="4G" JAVAFLAGS="-Dcom.mojang.eula.agree=true"

VOLUME /data
WORKDIR /data
RUN set -eux; \
    groupadd --system --gid 25565 leaves;\
    useradd --system --uid 25565 --gid 25565 --home-dir /opt/leaves --no-create-home leaves;\
    chmod -R a+rw /data

USER leaves:leaves
CMD ["/opt/leaves/run_leaves.sh"]