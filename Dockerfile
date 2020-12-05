FROM alpine:3.7

LABEL maintainer "Phil K (ucode1337/ucode.space)"

EXPOSE 25565/tcp
EXPOSE 25565/udp

ENV Xms=1G
ENV Xmx=4G

RUN apk add --update --no-cache openjdk8-jre wget

RUN mkdir -p /pixelmon/mods && mkdir /data
RUN wget -O /pixelmon/forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar && \
    wget -O /pixelmon/mods/spongeforge.jar https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.2.2/spongeforge-1.12.2-2838-7.2.2.jar && \
    wget -O /pixelmon/mods/Pixelmon-server.jar https://download.nodecdn.net/containers/reforged/server/release/8.1.2/Pixelmon-1.12.2-8.1.2-server.jar
RUN cd /pixelmon && \
    echo eula=true > eula.txt && \
    java -jar forge-installer.jar --installServer && \
    ln -s forge-1.12.2*.jar forge.jar && \
    rm -f forge-installer.jar
ADD start-server.sh /pixelmon
RUN cp -r /pixelmon /opt/

WORKDIR /data
VOLUME /data

CMD ["/bin/sh", "/pixelmon/start-server.sh"]
