stm32cubeide
=============

[stm32cubeide](https://github.com/xanderhendriks/docker-stm32cubeide): the STM32 Cube Integrated Development
Environment docker container.

Build
-----

To create the image `xanderhendriks/stm32cubeide`, execute the following command in the
`docker-stm32cubeide` folder:

    docker build -t xanderhendriks/stm32cubeide .

You can now tag the repo and push the changes to the docker hub:

    docker build -t xanderhendriks/stm32cubeide:4.0 .
    docker push xanderhendriks/stm32cubeide:4.0


Run
---

    $ docker pull xanderhendriks/stm32cubeide

    $ docker run -it --name stm32cubeide \
        -v c:\GIT\repo:/workspace \
        xanderhendriks/stm32cubeide

