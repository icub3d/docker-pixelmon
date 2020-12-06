# Docker-Pixelmon 1.12.2-8.1.2
![ydaft](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)
<br>
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg) 
<br>
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2d4b9c99d204400fa5ee652734d25974)](https://www.codacy.com/manual/ucodespace/docker-pixelmon?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=ucodespace/docker-pixelmon&amp;utm_campaign=Badge_Grade)
<br>
[![Mirroredfromucode](https://img.shields.io/badge/Mirrored-from%20ucodespace--git-blue)](https://git.ucode.space)

DockerFile for Pixelmon Mod
## Versions
pixelmon reforged 1.12.2-8.1.2<br/>
spongeforge 1.12.2-2838-7.2.2<br/>
forge 1.12.2-14.23.5.2854<br/>

## Installation

### If you want to have a 4gb ram Server just do
```bash
docker run -dit -p 25565:25565/tcp -p 25565:25565/udp --name yourcontainername ucode1337/pixelmon_reforged
```

### If you want to have a X gb ram Server just do
```bash
docker run -dit -e Xms=1G -e Xmx=6G -p 25565:25565/tcp -p 25565:25565/udp --name yourcontainername ucode1337/pixelmon_reforged
```
Xms = Min Memory Allocation
Xmx = Max Memory Allocation

### To attach to console
```docker attach yourcontainername
```
Run your commands
To exit: CTRL+P CTRL+Q


### Build from Source
```bash
git clone https://git.ucode.space/Phil/docker-pixelmon-reforged.git
cd docker-pixelmon-reforged
nano Dockerfile # if you want to change something
docker build . -t pixelmon
docker run -d -e Xms=1G -e Xmx=6G -p 25565:25565/tcp -p 25565:25565/udp pixelmon
```
#### Enjoy
