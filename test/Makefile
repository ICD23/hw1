EXE     := ../scanner
SRCS    := $(wildcard *.p)
OBJS    := $(patsubst %.p,output/%.out,$(SRCS))

all: output $(OBJS)

output/%.out: %.p
	@-./$(EXE) $^ > $@ 2>&1

output:
	mkdir -p $@

clean:
	$(RM) -rf output
