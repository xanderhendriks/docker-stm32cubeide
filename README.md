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
- 12.0: STM32 Cube IDE: 1.15.0
- 13.0: STM32 Cube IDE: 1.16.0
- 13.1: STM32 Cube IDE: 1.16.0 - Reduced size
- 14.0: STM32 Cube IDE: 1.17.0
- 15.0: STM32 Cube IDE: 1.18.0

NOTE: Bug fixes are only implemented for older versions if requested.

## Usage
To build your application from the command line execute the following commands:

    stm32cubeide --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data /tmp/stm-workspace -import /workspace/applications/sample_application/targets/STM32
    headless-build.sh -data /tmp/stm-workspace -build sample_application/Debug

### Example code
To see how to use this docker image with the help of [action-build-stm32cubeide](https://github.com/xanderhendriks/action-build-stm32cubeide) in a github ci pipeline have a look at [stm32-sample-application](https://github.com/xanderhendriks/stm32-sample-application).
