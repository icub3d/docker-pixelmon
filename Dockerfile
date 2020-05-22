FROM alpine:3.7

LABEL maintainer "Phil K (ucode1337/ucode.space)"

EXPOSE 25565/tcp
EXPOSE 25565/udp

RUN apk add --update --no-cache openjdk8-jre wget

RUN mkdir /pixelmon && \
mkdir /pixelmon/mods && \
wget -O /pixelmon/forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2838/forge-1.12.2-14.23.5.2838-installer.jar && \
wget -O /pixelmon/mods/spongeforge-1.12.2-2768-7.1.5.jar https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.1.9/spongeforge-1.12.2-2838-7.1.9.jar && \
wget -O /pixelmon/mods/Pixelmon-1.12.2-7.2.0-server.jar https://download.nodecdn.net/containers/reforged/server/release/7.3.1/Pixelmon-1.12.2-7.3.1-server.jar && \
cd /pixelmon && \
echo eula=true > eula.txt && \
java -jar forge-installer.jar --installServer && \
ln -s forge-1.12.2-14.23.5.2838-universal.jar forge.jar && \
rm -f forge-installer.jar && \
echo \#\!/bin/sh > /pixelmon/start-server.sh && \
echo cd '"$(dirname "$(readlink -fn "$0")")"' >> /pixelmon/start-server.sh && \
echo java -Xms1G -Xmx4G -jar forge.jar >> /pixelmon/start-server.sh && \
chmod +x /pixelmon/start-server.sh && \
cp -r /pixelmon /opt/

VOLUME /pixelmon

CMD ["/bin/sh", "/pixelmon/start-server.sh"]
