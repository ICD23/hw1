EXE     := ../scanner
SRCS    := $(wildcard *.p)
OBJS    := $(patsubst %.p,output/%.out,$(SRCS))

all: output $(OBJS)

output/%.out: %.p
	@-./$(EXE) $^ > $@ 2>$@.src

test: all
	@bash test.sh

check: all
	@bash check.sh

output:
	mkdir -p $@

clean:
	$(RM) -rf output
