AS = as
CC = cc

ASFLAGS = -g
LDFLAGS = -nostartfiles
LDLIBS =

%.bin: %.o
	$(CC) $(LDFLAGS) $< $(LDLIBS) -o $@
