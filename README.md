stm32cubeide
=============

[stm32cubeide](https://github.com/xanderhendriks/docker-stm32cubeide): the STM32 Cube Integrated Development
Environment docker container.

Build
-----

To create the image `xanderhendriks/stm32cubeide`, execute the following command in the
`docker-stm32cubeide` folder:

    docker build -t xanderhendriks/stm32cubeide .

You can now push the new image to the public registry:
    
    docker push xanderhendriks/stm32cubeide


Run
---

    $ docker pull xanderhendriks/stm32cubeide

    $ docker run -it --name stm32cubeide \
        -v /path/to/mplab/projects:/path/to/mplab/projects \
        xanderhendriks/stm32cubeide

