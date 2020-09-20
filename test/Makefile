EXE     := ../scanner
SRCS    := $(wildcard *.p)
OBJS    := $(patsubst %.p,output/%.out,$(SRCS))

all: output $(OBJS)

output/%.out: %.p
	./$(EXE) $^ > $@

output:
	mkdir -p $@

clean:
	$(RM) -rf output
