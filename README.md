# Docker-Pixelmon v7.3.1
![ydaft](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)
<br>
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg) 
<br>
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2d4b9c99d204400fa5ee652734d25974)](https://www.codacy.com/manual/ucodespace/docker-pixelmon?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=ucodespace/docker-pixelmon&amp;utm_campaign=Badge_Grade)
<br>
[![Mirroredfromucode](https://img.shields.io/badge/Mirrored-from%20ucodespace--git-blue)](https://git.ucode.space)

DockerFile for Pixelmon Mod
## Versions
pixelmon reforged v7.3.1<br/>
spongeforge v2768-7.1.5<br/>
forge v14.23.5.2838<br/>

## Installation

### If you want to have a 4gb ram Server just do
```bash
docker run -d -p 25565:25565/tcp -p 25565:25565/udp ucode1337/pixelmon_reforged
```

### If you want to have a X gb ram Server just do
```bash
mkdir build
cd build
wget https://raw.githubusercontent.com/ucodespace/docker-pixelmon/master/Dockerfile
```
#### EDIT THE Dockerfile e.x. nano Dockerfile
```bash
docker build -t pixelmon-local .
docker run -d -p 25565:25565/tcp -p 25565:25565/udp pixelmon-local
cd ..
rm -rf build
```

#### Enjoy
