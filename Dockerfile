FROM debian:bookworm

ARG USER
ARG UID
ARG HOME
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg

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
    liburing-dev \
    lsb-release \
    mmdebstrap \
    ninja-build \
    patchutils \
    perl \
    pkg-config \
    psmisc \
    python-is-python3 \
    python3-venv \
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
    software-properties-common \
    gnupg \
    cmake \
    libdw-dev \
    libssl-dev \
    python3-docutils \
    kmod \
    zsh \
    pigz \
    sudo \
    iputils-ping \
    debhelper \
	ccache \
    trash-cli \
    zstd \
    clang-13 \
    libcap-dev

# autossh dwarves golang gcc-multilib

RUN apt update

RUN echo "$USER *=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN useradd -rm -d $HOME -s /usr/bin/zsh -g root -G sudo -u $UID $USER
USER $USER
WORKDIR $HOME
