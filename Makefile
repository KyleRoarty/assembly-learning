AS = as
LD = ld

ASFLAGS = -g
LDFLAGS =
BLFLAGS = $(LDFLAGS) --oformat binary -Ttext 0x7c00

$(P): $(P).s
	 $(AS) $(ASFLAGS) $(P).s -o $(P).o

asm_dbg: $(P)
	$(LD) $(LDFLAGS) $(P).o -o $(P).bin

asm: asm_dbg
	rm -f $(P).o

bl_dbg: $(P)
	$(LD) $(BLFLAGS) $(P).o -o $(P).bin

bl: bl_dbg
	rm -f $(P).o

clean:
	rm -f $(P).o $(P).bin
