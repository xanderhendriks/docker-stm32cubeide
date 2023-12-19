FROM ubuntu:22.04

LABEL org.opencontainers.image.authors="Xander Hendriks <xander.hendriks@nx-solutions.com>"

ENV STM32CUBEIDE_VERSION=1.14.0

ENV DEBIAN_FRONTEND=noninteractive

ENV LICENSE_ALREADY_ACCEPTED=1

ENV TZ=Etc/UTC

ENV PATH="${PATH}:/opt/st/stm32cubeide_${STM32CUBEIDE_VERSION}"

RUN apt-get -y update && \
	apt-get -y install zip

COPY en.st-stm32cubeide_1.14.0_19471_20231121_1200_amd64.deb_bundle.sh.zip /tmp/stm32cubeide-installer.sh.zip

# Unzip STM32 Cube IDE and delete zip file
RUN unzip -p /tmp/stm32cubeide-installer.sh.zip > /tmp/stm32cubeide-installer.sh && rm /tmp/stm32cubeide-installer.sh.zip

# Install STM32 Cube IDE and delete installer
RUN chmod +x /tmp/stm32cubeide-installer.sh && \
    /tmp/stm32cubeide-installer.sh && \
    rm /tmp/stm32cubeide-installer.sh

# Install dependencies
RUN apt-get -y -f install
