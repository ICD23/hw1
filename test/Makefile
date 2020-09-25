EXE     := ../scanner
SRCS    := $(wildcard *.p)
OBJS    := $(patsubst %.p,output/%.token,$(SRCS))

all: output $(OBJS)

output/%.token: %.p
	@-./$(EXE) $^ > $@.src 2>$@

test: all
	@bash test.sh

output:
	mkdir -p $@

clean:
	$(RM) -rf output
