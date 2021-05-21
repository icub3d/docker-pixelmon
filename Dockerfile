FROM alpine:3.7

LABEL maintainer "Phil K (ucode1337/ucode.space)"

EXPOSE 25565/tcp
EXPOSE 25565/udp

ENV Xms=1G
ENV Xmx=4G

RUN apk add --update --no-cache openjdk8-jre wget

VOLUME /data

COPY files /data

WORKDIR /data

ENTRYPOINT ["java", "-Xms1G", "-Xmx4G", "-server", "-jar", "/data/forge.jar", "nogui"]
