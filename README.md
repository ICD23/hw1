# ICD22 Homework1

## Docker

We provide a docker image for the environment, so you need install docker first.

More details can be found on [docker website](https://docs.docker.com/get-docker/),
and we provide part of Linux installation and Windows installation video here.

- Linux: (Arch Linux) (Recommend)
```bash
sudo pacman -S docker # install the docker from package

systemctl start docker.service # start the docker service
systemctl enable docker.service # start the docker service

gpasswd -a username docker # you should change the `username` into yours

newgrp docker # update the newgroup
```

- Linux: (Ubuntu)(Recommend)
```bash
sudo apt install docker.io

sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $(whoami) # Add yourself to docker group 
newgrp docker # update the newgroup


```

- Windows:

[![windows setup](https://i.ytimg.com/vi/HddnQnU4zXk/hqdefault.jpg)](https://www.youtube.com/watch?v=HddnQnU4zXk)


## Image and Container

Download the Git repository (via git or download as zip).

On \*nix (in terminal):
```
bash activate.sh # start the container, it will auto-pull the image if you didn't pull it
```

[![asciicast](https://asciinema.org/a/27ZqPcEUYkA6Ll0EqjyvlC5YQ.svg)](https://asciinema.org/a/27ZqPcEUYkA6Ll0EqjyvlC5YQ)

On CSCC workstation:
```
bash cscc-activate.sh
```

More information about cscc docker suuport, please refer [dosh](https://cscc.cs.nctu.edu.tw/workstation-dosh-guide)

[![asciicast](https://asciinema.org/a/R6lPjk7iwCXHVzGcGFBxAh4J3.svg)](https://asciinema.org/a/R6lPjk7iwCXHVzGcGFBxAh4J3)

On Windows (in cmd):
```
activate.bat
```

It will mount the repository to `/root/hw1`.
Note the script use the `--rm` flag on docker command,
which means it will remove the container every time you exit.

The container is for compilation, we simply provide `vim` in this container,
you can use any editor you like on your host machine.

## MobaXterm

If your platform is win7, there may exist some problems on docker volume setup

(you may try to install docker toolbox instead of docker desktop, but it may still not work)

You can install mobaXterm instead, but still need check your code can work on docker (you can try it on cscc workstation).

If you download the portable version, note that you may want to set the persistent home directory to prevent file missing every time you restart MobaXterm.

After you download MobaXterm, install the package it need to do your homework:

```
bash mobapkg.sh
```

More details could be found in the video:

[![windows setup](https://i.ytimg.com/vi/QQbeArOOC4o/hqdefault.jpg)](https://www.youtube.com/watch?v=QQbeArOOC4o)

# Assignment

Please follow the specification on E3 to implement the scanner.

You need provide two make commands for us to judge your work:
- make prepare (if any extra package is used)
- make (to build your binary)

We have provided these commands in the Makefile, feel free to modify them according your needs.

# Test

## Using docker(Recommend)
You can use the command `make test` for testing, and we will use the original test case result as your score, but the `test/` dir will be replaced when grading.

## Using github workflow
You can clone the github repo to your github account. Github CI will help to test the result of your scanner everytime you commit to master.

*Note: This is an alternative way for you to test your scanner which does not guarantee the result is the same as docker!!*

# DEBUG

You can use `./compare.sh` to find out the difference between your output and answer. Usage: `./compare.sh ({ID of the test case you wnat to see} | all)`

# Submission

You can use the `make pack` command to zip your work, and upload it to new E3.
