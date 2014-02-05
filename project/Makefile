TOOLS	= ../../tools/
PMCC	= $(TOOLS)vbccpm
PMAS    = $(TOOLS)pmas
PMUSB   = $(TOOLS)PokeFlash
PMEMU   = $(TOOLS)PokeMini
TARGET  = main


all: $(TARGET).min

$(TARGET).min: $(TARGET).asm
	$(PMAS) $(TARGET).asm $(TARGET).min

$(TARGET).asm: *.c *.h
	$(PMCC) main.c
	
.PHONY: clean again install

clean:
	rm -f $(TARGET).min $(TARGET).asm

again: clean $(TARGET).min

install: $(TARGET).min
	$(PMUSB) -f $(TARGET).min

run: $(TARGET).min
	$(PMEMU) $(TARGET).min
