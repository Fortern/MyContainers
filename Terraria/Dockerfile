FROM debian:latest

COPY Linux start-tr.sh /opt/terraria/

EXPOSE 7777/tcp

WORKDIR /opt/terraria

RUN chmod +x start-tr.sh

ENTRYPOINT ["sh", "./start-tr.sh"]

