# ICD20 Homework1

## Environment

We provide a docker image for the environment:
(you need install docker by yourself first)

```
make pull # fetch the image
make activate # start the container, it will auto-pull the image if you didn't pull it
```

It will mount the repository to `/root/hw1`.

# Assignment

You need provide two make command for us to judge you work:
- make prepare (if any extra package is used)
- make (to build your binary)

We have provided these commands in the Makefile, feel free to modify them according your needing.

# Submission

You can use the `make pack` command to zip your work, and upload to new E3.
