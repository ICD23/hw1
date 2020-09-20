EXE     := ../scanner
SRCS    := $(wildcard *.p)
OBJS    := $(patsubst %.p,output/%.out,$(SRCS))

all: output $(OBJS)

output/%.out: %.p
	@-./$(EXE) $^ > $@ 2>&1

test: all
	@bash test.sh

output:
	mkdir -p $@

clean:
	$(RM) -rf output
