FROM alpine:3.7

LABEL maintainer "Phil K (ucode1337/ucode.space)"

EXPOSE 25565/tcp
EXPOSE 25565/udp

ENV Xms=1G
ENV Xmx=4G

RUN apk add --update --no-cache openjdk8-jre wget

RUN mkdir /pixelmon && \
mkdir /pixelmon/mods && \
wget -O /pixelmon/forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar && \
wget -O /pixelmon/mods/spongeforge.jar https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.2.2/spongeforge-1.12.2-2838-7.2.2.jar && \
wget -O /pixelmon/mods/Pixelmon-server.jar https://download.nodecdn.net/containers/reforged/server/release/8.0.2/Pixelmon-1.12.2-8.0.2-server.jar && \
cd /pixelmon && \
echo eula=true > eula.txt && \
java -jar forge-installer.jar --installServer && \
ln -s forge-1.12.2-14.23.5.2854-universal.jar forge.jar && \
rm -f forge-installer.jar && \
echo \#\!/bin/sh > /pixelmon/start-server.sh && \
echo cd '"$(dirname "$(readlink -fn "$0")")"' >> /pixelmon/start-server.sh && \
echo java -Xms${Xms} -Xmx${Xmx} -jar forge.jar >> /pixelmon/start-server.sh && \
chmod +x /pixelmon/start-server.sh && \
cp -r /pixelmon /opt/

VOLUME /pixelmon

CMD ["/bin/sh", "/pixelmon/start-server.sh"]
