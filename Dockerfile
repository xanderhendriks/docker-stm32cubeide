FROM debian:jessie

MAINTAINER Xander Hendriks <xander.hendriks@nx-solutions.com>

ENV DEBIAN_FRONTEND noninteractive

ENV STM32CUBEIDE_VERSION 1.4.0

RUN apt-get -y update && \
	apt-get -y install unzip curl expect

# Download and install STM32 Cube IDE
# Downloaded from test.nx-solutions.com
RUN curl --insecure -o /tmp/stm32cubeide-installer.sh.zip "https://test.nx-solutions.com/en.st-stm32cubeide_1.4.0_7511_20200720_0928_amd64.deb_bundle_sh.zip" && \
    unzip -p /tmp/stm32cubeide-installer.sh.zip > /tmp/stm32cubeide-installer.sh && rm /tmp/stm32cubeide-installer.sh.zip

COPY noninteractive-install.sh .

# Using expect to install STM32 Cube IDE automatically.
RUN chmod +x noninteractive-install.sh /tmp/stm32cubeide-installer.sh && \
    ./noninteractive-install.sh && \
    rm /tmp/stm32cubeide-installer.sh noninteractive-install.sh &&\

ENV PATH="${PATH}:/opt/st/stm32cubeide_${STM32CUBEIDE_VERSION}"

# Install dependencies
RUN apt-get -y -f install
