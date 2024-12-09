FROM debian:buster

ARG USER
ARG UID
ARG HOME
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install --yes --no-install-recommends \
    arch-test \
    autoconf \
    automake \
    autotools-dev \
    bash-completion \
    bc \
    binfmt-support \
    bison \
    bsdmainutils \
    build-essential \
    cpio \
    curl \
    diffstat \
    flex \
    g++-riscv64-linux-gnu \
    gawk \
    gcc-riscv64-linux-gnu \
    gdb \
    gettext \
    git \
    git-lfs \
    gperf \
    groff \
    less \
    libelf-dev \
    lsb-release \
    mmdebstrap \
    ninja-build \
    patchutils \
    perl \
    pkg-config \
    psmisc \
    qemu-user-static \
    rsync \
    ruby \
    ssh \
    strace \
    texinfo \
    traceroute \
    unzip \
    vim \
    zlib1g-dev \
    lsb-release \
    wget \
    gnupg \
    cmake \
    libdw-dev \
    libssl-dev \
    kmod \
    zsh \
    pigz \
    sudo \
    iputils-ping \
    debhelper \
	ccache \
    trash-cli \
    zstd \
    libcap-dev \
    clang \
    lld \
    llvm \
    git qemu-kvm udev iproute2 busybox-static \
    coreutils libvirt-clients kbd kmod file rsync zstd \
    locales
# virtiofsd

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# poky gatesgarth
RUN apt-get install --yes --no-install-recommends gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev

RUN apt-get update

# RUN echo "deb http://deb.debian.org/debian bookworm-backports main" >> /etc/apt/sources.list.d/backports.list


# Install virtme-ng v1.31, requires Debian Trixie's rustc version
# RUN apt-get install --yes --no-install-recommends python3-pip flake8 pylint cargo rustc qemu-system-x86 pipx # pipx/bookworm-backports
# RUN mkdir -p /usr/local/src
# RUN git clone --recurse-submodules https://github.com/arighi/virtme-ng.git /usr/local/src/virtme-ng
# RUN cd /usr/local/src/virtme-ng && git checkout v1.31 && BUILD_VIRTME_NG_INIT=1 PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin PIPX_MAN_DIR=/usr/local/share/man pipx install .

RUN echo "$USER *=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir -p $HOME
RUN useradd -rm -d $HOME -s /usr/bin/zsh -g root -G sudo -u $UID $USER
USER $USER
WORKDIR $HOME
