ARG UBUNTU_CODENAME=focal
FROM ubuntu:${UBUNTU_CODENAME}

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    PATH="/scripts:${PATH}"

RUN echo 'APT::Install-Recommends "false";' >/etc/apt/apt.conf.d/00recommends \
  && echo 'APT::Install-Suggests "false";' >>/etc/apt/apt.conf.d/00recommends

RUN apt-get -q update && apt-get -q install --no-install-recommends --yes \
        gnupg \
        iproute2 \
        zip unzip \
        mc \
        wget \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get -q update && apt-get -q install --no-install-recommends --yes \
        build-essential \
        libglib2.0-dev \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get -q update && apt-get -q install --no-install-recommends --yes \
        python3 python3-pip python3-setuptools python3-wheel \
        devscripts \
        dpkg-dev \
        libdistro-info-perl \
        lintian \
        git \
        openssh-client \
        equivs \
        coreutils \
        nasm \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install --upgrade 'gbp == 0.9.10' \
  || pip3 install --upgrade 'gbp == 0.9.10'

RUN git config --system user.name "Kurento" \
  && git config --system user.email "info@kurento.org"

RUN sed --in-place "s|^[^/]|//|" /etc/apt/apt.conf.d/docker-clean

COPY *.list /etc/apt/sources.list.d/
