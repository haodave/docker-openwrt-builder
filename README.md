# Docker OpenWrt Builder

Build [OpenWrt](https://openwrt.org/) images in a Docker container. This is sometimes necessary when building OpenWrt on the host system fails, e.g. when some dependency is too new.

The docker image is based on Debian Buster.
Works with LEDE-17.01, OpenWrt-18.06 and newer.

## Prerequisites

- Podman or Docker installed and configured.

## Build Docker image with Podman or Docker
```sh
git clone https://github.com/da7eh/docker-openwrt-builder
cd docker-openwrt-builder

# Important: 
# Before build the docker image, edit the sed command to use the apt source
# that suit your needs.

docker build . -t openwrt_builder
```

## Build OpenWRT image inside the Docker container
Create a build folder and link it into a new docker container:
```sh
mkdir ~/mybuild
docker run -v ~/mybuild:/home/user -it openwrt_builder /bin/bash
```

Here we use customized OpenWRT source code in this git repo: [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede/). If were to use the official OpenWRT source code, replace the git repo with https://git.openwrt.org/openwrt/openwrt.git accordingly.
```sh
git clone https://github.com/coolsnowwolf/lede
cd lede
./scripts/feeds update -a
./scripts/feeds install -a

# Generate make config file via menuconfig. Or not. Just use the .config file
# attached in the repo.
make menuconfig

# build the image
# replace 1 with the threads number to be used for the build
make -j1 V=s
```

After the build, the images will be inside `~/mybuild/openwrt/bin/target/`.

## Other Projects
* [docker-openwrt-buildroot](https://github.com/noonien/docker-openwrt-buildroot)
* [openwrt-docker-toolchain](https://github.com/mchsk/openwrt-docker-toolchain)

