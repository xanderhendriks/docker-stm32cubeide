FROM ubuntu:18.04

MAINTAINER Xander Hendriks <xander.hendriks@nx-solutions.com>

ENV STM32CUBEIDE_VERSION 1.7.0

ENV PATH="${PATH}:/opt/st/stm32cubeide_${STM32CUBEIDE_VERSION}"

RUN apt-get -y update && \
	apt-get -y install zip curl expect

# Download and install STM32 Cube IDE
# Downloaded from test.nx-solutions.com
RUN curl --insecure -o /tmp/stm32cubeide-installer.sh.zip "https://test.nx-solutions.com/en.st-stm32cubeide_1.7.0_10852_20210715_0634_amd64.deb_bundle.sh_v1.7.0.zip" && \
    unzip -p /tmp/stm32cubeide-installer.sh.zip > /tmp/stm32cubeide-installer.sh && rm /tmp/stm32cubeide-installer.sh.zip

COPY noninteractive-install.sh .

# Using expect to install STM32 Cube IDE automatically.
RUN chmod +x noninteractive-install.sh /tmp/stm32cubeide-installer.sh && \
    ./noninteractive-install.sh && \
    rm /tmp/stm32cubeide-installer.sh noninteractive-install.sh

# Install dependencies
RUN apt-get -y -f install
