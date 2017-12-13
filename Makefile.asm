AS = as
CC = cc

ASFLAGS = -g
LDFLAGS = -nostartfiles
LDLIBS = test.o

%.bin: %.o $(LDLIBS)
	$(CC) $(LDFLAGS) $< $(LDLIBS) -o $@
