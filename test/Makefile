EXE     := ../scanner
SRCS    := $(wildcard *.p)
OBJS    := $(patsubst %.p,output/%.phony,$(SRCS))

all: output $(EXE) $(OBJS)

output/%.phony: %.p
	@-./$(EXE) $^ > $(patsubst %.phony,%.token.src,$@) 2>$(patsubst %.phony,%.token,$@)

test: all
	@bash test.sh

output:
	mkdir -p $@

clean:
	$(RM) -rf output
