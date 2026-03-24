ARG IMAGE=ubuntu:24.04

# Use base image as extractor for the zip file
FROM ${IMAGE} AS base

RUN apt-get -y update && \
    apt-get -y install zip

COPY st-stm32cubeide_2.1.1_28236_20260312_0043_amd64.deb_bundle.sh.zip /tmp/stm32cubeide-installer.sh.zip

# Unzip STM32 Cube IDE and delete zip file
RUN unzip -p /tmp/stm32cubeide-installer.sh.zip > /tmp/stm32cubeide-installer.sh && rm /tmp/stm32cubeide-installer.sh.zip

# Set environment variables and labels in the last tag
FROM ${IMAGE}
ENV STM32CUBEIDE_VERSION=2.1.1
ENV DEBIAN_FRONTEND=noninteractive
ENV LICENSE_ALREADY_ACCEPTED=1
ENV TZ=Etc/UTC
ENV PATH="${PATH}:/opt/st/stm32cubeide_${STM32CUBEIDE_VERSION}"
ENV DISPLAY=:0

LABEL org.opencontainers.image.authors="Xander Hendriks <xander.hendriks@nx-solutions.com>"

# Install dependencies
RUN <<EOF
    apt-get -y update
    apt-get -y install \
        gcc \
        g++ \
        x11-apps \
        libswt-gtk-4-java \
        curl \
        python3 \
        python3-pycryptodome \
        python3-ecdsa \
        python3-pyelftools \
        python3-numpy \
        git
    ln -s $(which python3) /usr/bin/python
EOF

COPY --from=base /tmp/stm32cubeide-installer.sh /tmp

# Install STM32 Cube IDE and delete installer
RUN <<EOF
    chmod +x /tmp/stm32cubeide-installer.sh
    /tmp/stm32cubeide-installer.sh
    rm /tmp/stm32cubeide-installer.sh
EOF
