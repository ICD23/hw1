SCANNER = scanner
CC      = gcc
CFLAGS  = -Wall -Wextra -pedantic -g3
LEX     = flex
LIBS    = -lfl

all: $(SCANNER)

$(SCANNER): $(SCANNER).c
	$(CC) $(CCFLAGS) $< -o $(SCANNER) $(LIBS)

$(SCANNER).c: %.c: %.l
	$(LEX) -o $@ $<

prepare:
	apt install clang
	apt install g++

test:
	echo "test - not implemented yet"

.PHONY: clean

clean:
	$(RM) $(SCANNER) $(SCANNER:=.c)

DOCKERHUB_ACCOUNT=plaslab
IMAGE_NAME = compiler-f20-hw1
DOCKER_IMG = ${DOCKERHUB_ACCOUNT}/${IMAGE_NAME}:latest

pull:
	docker pull ${DOCKER_IMG}

activate:
ifeq ($(findstring cmd.exe,$(SHELL)),cmd.exe)
	docker run --rm -it -w /root -v %cd%:/root plaslab/compiler-f20-hw1 /bin/bash
else
	docker run --rm -it -w /root -v ${PWD}:/root plaslab/compiler-f20-hw1 /bin/bash
endif
