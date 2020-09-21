# ICD20 Homework1

## Environment

We provide a docker image for the environment:
(you need install docker by yourself first)

On \*nix:
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

On Windows:
```
activate.bat
```
[![windows setup](https://i.ytimg.com/vi/HddnQnU4zXk/hqdefault.jpg)](https://www.youtube.com/watch?v=HddnQnU4zXk)

It will mount the repository to `/root/hw1`.
Note the script use the `--rm` flag on docker command,
which means it will remove the container every time you exit.

The container is for compilation, we simply provide `vim` in this container,
you can use any editor you like on your host machine.


# Assignment

Please follow the specification on E3 to implement the scanner.

You need provide two make commands for us to judge your work:
- make prepare (if any extra package is used)
- make (to build your binary)

We have provided these commands in the Makefile, feel free to modify them according your needs.

# Test

You can use the command `make test` for testing, and we will use the original test case result as your score, but the `test/` dir will be replaced when grading.


# Submission

You can use the `make pack` command to zip your work, and upload it to new E3.
