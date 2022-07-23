#!/bin/sh
[ ! -d "/data/mods" ] && cp -rf /pixelmon/* /data

java -Xms1G -Xmx4G -server -jar /pixelmon/forge.jar nogui
