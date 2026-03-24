# stm32cubeide

[STM32CubeIde docker image](https://hub.docker.com/r/xanderhendriks/stm32cubeide): STM32 Cube Integrated Development
Environment docker container.

**All commands have been tested on Windows 11 with WSL2 and powershell**. 

## Run

    $ docker pull xanderhendriks/stm32cubeide

    $ docker run -it --name stm32cubeide \
        -v c:\GIT\repo:/workspace \
        xanderhendriks/stm32cubeide

### Running with GUI support

    $ docker run -it --rm --name stm32cubeide -v c:\GIT\repo:/workspace -v /mnt/host/wslg/.X11-unix:/tmp/.X11-unix xanderhendriks/stm32cubeide:<tag>

#### Start stm32cubeide when running the docker

    $ docker run -it --rm --name stm32cubeide -v c:\GIT\repo:/workspace -v /mnt/host/wslg/.X11-unix:/tmp/.X11-unix xanderhendriks/stm32cubeide:<tag> stm32cubeide


## STM32 Cube IDE Versions
For ease of use the major.minor.bugfix version now matches the version of the STM32 Cube IDE. For bug fixes without updates to the ide -<a...z> is appended.
Check the versions on [hub.docker.com](https://hub.docker.com/r/xanderhendriks/stm32cubeide).

For older images the major.minor version number indicates the version of the STM32CubeIde inside the docker image according to the following lookup. The bug fix number shows updates to this build action only:
- 16.0: STM32 Cube IDE: 1.19.0
- 15.1: STM32 Cube IDE: 1.18.1 - Allows running of stm32cubeide GUI on xserver
- 15.0: STM32 Cube IDE: 1.18.0
- 14.0: STM32 Cube IDE: 1.17.0
- 13.1: STM32 Cube IDE: 1.16.0 - Reduced size
- 13.0: STM32 Cube IDE: 1.16.0
- 12.0: STM32 Cube IDE: 1.15.0
- 11.0: STM32 Cube IDE: 1.14.0
- 10.0: STM32 Cube IDE: 1.13.1
- 9.0: STM32 Cube IDE: 1.12.1
- 8.0: STM32 Cube IDE: 1.11.2
- 7.0: STM32 Cube IDE: 1.10.1
- 6.0: STM32 Cube IDE: 1.9.0
- 5.0: STM32 Cube IDE: 1.8.0
- 4.0.2: STM32 Cube IDE: 1.7.0
- 3.0: STM32 Cube IDE: 1.6.0
- 2.0: STM32 Cube IDE: 1.5.0
- 1.0: STM32 Cube IDE: 1.4.0
NOTE: Bug fixes are only implemented for older versions if requested.

## Usage
To build your application from the command line execute the following commands:

    stm32cubeide --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data /tmp/stm-workspace -import /workspace/applications/sample_application/targets/STM32
    headless-build.sh -data /tmp/stm-workspace -build sample_application/Debug

### Example code
To see how to use this docker image with the help of [action-build-stm32cubeide](https://github.com/xanderhendriks/action-build-stm32cubeide) in a github ci pipeline have a look at [stm32-sample-application](https://github.com/xanderhendriks/stm32-sample-application).

## Build

Note for myself for maintaining the docker image. Can also be of use to people who would like to create their own.

To create the image `xanderhendriks/stm32cubeide`, execute the following command in the
`docker-stm32cubeide` folder:

    docker build -t xanderhendriks/stm32cubeide:<tag> .

Now tag the repo and push the changes to the docker hub:

    docker push xanderhendriks/stm32cubeide:<tag>>
