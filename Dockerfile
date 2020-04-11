FROM debian:buster

RUN sed -i 's/http.*debian\.org\(.*\)$/http\:\/\/mirrors.tuna.tsinghua.edu.cn\1 contrib non-free/' /etc/apt/sources.list &&\ 
    apt-get update &&\
    apt-get install -y sudo wget build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3.5 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf &&\
    apt-get clean && \
    useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

USER user
WORKDIR /home/user
