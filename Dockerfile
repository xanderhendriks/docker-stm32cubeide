FROM ubuntu:20.04

MAINTAINER Xander Hendriks <xander.hendriks@nx-solutions.com>

ENV STM32CUBEIDE_VERSION=1.10.1

ENV DEBIAN_FRONTEND=noninteractive

ENV LICENSE_ALREADY_ACCEPTED=1

ENV TZ=Etc/UTC

ENV PATH="${PATH}:/opt/st/stm32cubeide_${STM32CUBEIDE_VERSION}"

RUN apt-get -y update && \
	apt-get -y install zip curl

# Download and install STM32 Cube IDE
RUN curl --insecure -o /tmp/stm32cubeide-installer.sh.zip "https://test.nx-solutions.com/en.st-stm32cubeide_1.10.1_12716_20220707_0928_amd64.deb_bundle.sh.zip" && \
    unzip -p /tmp/stm32cubeide-installer.sh.zip > /tmp/stm32cubeide-installer.sh && rm /tmp/stm32cubeide-installer.sh.zip

# Using expect to install STM32 Cube IDE automatically.
RUN chmod +x /tmp/stm32cubeide-installer.sh && \
    /tmp/stm32cubeide-installer.sh && \
    rm /tmp/stm32cubeide-installer.sh

# Install dependencies
RUN apt-get -y -f install
