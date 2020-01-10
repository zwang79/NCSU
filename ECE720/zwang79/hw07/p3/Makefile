
PROGNAME = gregoryleibniz

# The following 9 lines were taken from ${RISCV}/riscv-tests/benchmarks/Makefile
XLEN ?= 64
RISCV_PREFIX ?= riscv$(XLEN)-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -DPREALLOCATE=1 -mcmodel=medany -static -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf
RISCV_LINK ?= $(RISCV_GCC) -T $(RISCV)/riscv-tests/benchmarks/common/test.ld $(incs)
RISCV_LINK_OPTS ?= -static -nostdlib -nostartfiles -lm -lgcc -T $(RISCV)/riscv-tests/benchmarks/common/test.ld
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.data
RISCV_SIM ?= spike --isa=rv$(XLEN)gc
incs  += -I$(RISCV)/riscv-tests/env -I$(RISCV)/riscv-tests/benchmarks/common


OBJDUMP = riscv64-unknown-elf-objdump
EMULATOR = emulator-freechips.rocketchip.system-DefaultConfig
DISASSEMBLE = spike-dasm


#$(PROGNAME).riscv: $(wildcard *.c) $(wildcard *.h) $(wildcard *.S) 
#	$(RISCV_GCC) $(incs) $(RISCV_GCC_OPTS) -o $@ $(PROGNAME).c $(wildcard $(RISCV)/riscv-tests/benchmarks/common/*.c) $(wildcard $(RISCV)/riscv-tests/benchmarks/common/*.S) $(RISCV_LINK_OPTS)
#	$(OBJDUMP) -d -S $(PROGNAME).riscv > $(PROGNAME).riscv.dump


sim: $(PROGNAME).riscv
	time $(RISCV_SIM) -l $(PROGNAME).riscv 2> $(PROGNAME).spike.out

vsim: $(PROGNAME).riscv
	time $(EMULATOR) +max-cycles=100000000 +verbose $(PROGNAME).riscv 3>&1 1>&2 2>&3 | $(DISASSEMBLE) > $(PROGNAME).emulator.out

clean:
	#-rm -f $(OBJ) $(PROGNAME).riscv $(PROGNAME).riscv.dump 
	-rm -f $(PROGNAME).spike.out $(PROGNAME).emulator.out 

