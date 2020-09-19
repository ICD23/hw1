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
	# we have installed the package meet the basic needs
	# you can prepare the extra package you need here, e.g.
	#apt install clang
	#apt install g++

test:
	echo "test - not implemented yet"

pack:
	zip -r icd20-hw1.zip . -x ".*" -x "*.zip"

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
	docker run --rm -it -w /root -v %cd%:/root/hw1 plaslab/compiler-f20-hw1 /bin/bash
else
	docker run --rm -it -w /root -v ${PWD}:/root/hw1 plaslab/compiler-f20-hw1 /bin/bash
endif
