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
    libcap-dev \
    clang \
    lld \
    llvm \
    git qemu-kvm udev iproute2 busybox-static \
    coreutils python3-requests python3-argcomplete libvirt-clients kbd kmod file rsync zstd
# virtiofsd

RUN echo "deb http://deb.debian.org/debian bookworm-backports main" >> /etc/apt/sources.list.d/backports.list

RUN apt-get update

# autossh dwarves golang gcc-multilib virtiofsd/bookworm-backports

# Install virtme-ng v1.31, requires Debian Trixie's rustc version
RUN apt-get install --yes --no-install-recommends python3-pip flake8 pylint cargo rustc qemu-system-x86 pipx # pipx/bookworm-backports
RUN mkdir -p /usr/local/src
RUN git clone --recurse-submodules https://github.com/arighi/virtme-ng.git /usr/local/src/virtme-ng
RUN cd /usr/local/src/virtme-ng && git checkout v1.31 && BUILD_VIRTME_NG_INIT=1 PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin PIPX_MAN_DIR=/usr/local/share/man pipx install .

RUN echo "$USER *=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN useradd -rm -d $HOME -s /usr/bin/zsh -g root -G sudo -u $UID $USER
USER $USER
WORKDIR $HOME
