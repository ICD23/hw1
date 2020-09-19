# ICD20 Homework1

## Environment

We provide a docker image for the environment:
(you need install docker by yourself first)

```
make pull # fetch the image
make activate # start the container, it will auto-pull the image if you didn't pull it
```

It will mount the repository to `/root/hw1`.
Note the `make activate` use the `--rm` flag on docker command,
which means it will remove the container every time you exit.

The container is for compilation, we simply provide `vim` in this container,
you can use any editor you like on your host machine.

[![asciicast](https://asciinema.org/a/a0V4V43hzTTfmCmHErcDkjitr.svg)](https://asciinema.org/a/a0V4V43hzTTfmCmHErcDkjitr)

# Assignment

Please follow the specification on E3 to implement the scanner.

You need provide two make commands for us to judge your work:
- make prepare (if any extra package is used)
- make (to build your binary)

We have provided these commands in the Makefile, feel free to modify them according your needs.

# Submission

You can use the `make pack` command to zip your work, and upload it to new E3.
