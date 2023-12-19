# stm32cubeide

[stm32cubeide](https://github.com/xanderhendriks/docker-stm32cubeide): the STM32 Cube Integrated Development
Environment docker container.

## Build

To create the image `xanderhendriks/stm32cubeide`, execute the following command in the
`docker-stm32cubeide` folder:

    docker build -t xanderhendriks/stm32cubeide .

You can now tag the repo and push the changes to the docker hub:

    docker build -t xanderhendriks/stm32cubeide:4.0 .
    docker push xanderhendriks/stm32cubeide:4.0

## Run

    $ docker pull xanderhendriks/stm32cubeide

    $ docker run -it --name stm32cubeide \
        -v c:\GIT\repo:/workspace \
        xanderhendriks/stm32cubeide

## STM32 Cube IDE Versions

The major.minor version number indicates the version of the underlying [STM32CubeIde docker image](https://hub.docker.com/repository/docker/xanderhendriks/stm32cubeide) being used. The bug fix number shows updates to this build action only:
- 1.0: STM32 Cube IDE: 1.4.0
- 2.0: STM32 Cube IDE: 1.5.0
- 3.0: STM32 Cube IDE: 1.6.0
- 4.0.2: STM32 Cube IDE: 1.7.0
- 5.0: STM32 Cube IDE: 1.8.0
- 6.0: STM32 Cube IDE: 1.9.0
- 7.0: STM32 Cube IDE: 1.10.1
- 8.0: STM32 Cube IDE: 1.11.2
- 9.0: STM32 Cube IDE: 1.12.1
- 10.0: STM32 Cube IDE: 1.13.1
- 11.0: STM32 Cube IDE: 1.14.0

NOTE: Bug fixes are only implemented for older versions if requested.
