CC = g++
OPT = -O3
OPT = -g
WARN = -Wall
ERR = -Werror

CFLAGS = $(OPT) $(WARN) $(ERR) $(INC) $(LIB)

SIM_SRC = main.cc cache.cc

SIM_OBJ = main.o cache.o

folder = results

all: smp_cache
	@echo "Compilation Done ---> nothing else to make :) "

smp_cache: $(SIM_OBJ)
	$(CC) -o smp_cache $(CFLAGS) $(SIM_OBJ) -lm
	@echo "----------------------------------------------------------"
	@echo "-----------FALL19-506 SMP SIMULATOR (SMP_CACHE)-----------"
	@echo "----------------------------------------------------------"

.cc.o:
	$(CC) $(CFLAGS)  -c $*.cc

clean:
	rm -f *.o smp_cache

clobber:
	rm -f *.o

report:
	mkdir -p results
	./smp_cache 262144 8 64 4 0 ../trace/canneal.04t.longTrace -> results/cache_size_256K_MSI.log
	./smp_cache 262144 8 64 4 1 ../trace/canneal.04t.longTrace -> results/cache_size_256K_MESI.log
	./smp_cache 262144 8 64 4 2 ../trace/canneal.04t.longTrace -> results/cache_size_256K_Dragon.log
	./smp_cache 524288‬ 8 64 4 0 ../trace/canneal.04t.longTrace -> results/cache_size_512K_MSI.log
	./smp_cache 524288‬ 8 64 4 1 ../trace/canneal.04t.longTrace -> results/cache_size_512K_MESI.log
	./smp_cache 524288‬ 8 64 4 2 ../trace/canneal.04t.longTrace -> results/cache_size_512K_Dragon.log
	./smp_cache 1048576 8 64 4 0 ../trace/canneal.04t.longTrace -> results/cache_size_1M_MSI.log
	./smp_cache 1048576 8 64 4 1 ../trace/canneal.04t.longTrace -> results/cache_size_1M_MESI.log
	./smp_cache 1048576 8 64 4 2 ../trace/canneal.04t.longTrace -> results/cache_size_1M_Dragon.log
	./smp_cache 2097152 8 64 4 0 ../trace/canneal.04t.longTrace -> results/cache_size_2M_MSI.log
	./smp_cache 2097152 8 64 4 1 ../trace/canneal.04t.longTrace -> results/cache_size_2M_MESI.log
	./smp_cache 2097152 8 64 4 2 ../trace/canneal.04t.longTrace -> results/cache_size_2M_Dragon.log
	./smp_cache 1048576 4 64 4 0 ../trace/canneal.04t.longTrace -> results/assoc_4_MSI.log
	./smp_cache 1048576 4 64 4 1 ../trace/canneal.04t.longTrace -> results/assoc_4_MESI.log
	./smp_cache 1048576 4 64 4 2 ../trace/canneal.04t.longTrace -> results/assoc_4_Dragon.log
	./smp_cache 1048576 8 64 4 0 ../trace/canneal.04t.longTrace -> results/assoc_8_MSI.log
	./smp_cache 1048576 8 64 4 1 ../trace/canneal.04t.longTrace -> results/assoc_8_MESI.log
	./smp_cache 1048576 8 64 4 2 ../trace/canneal.04t.longTrace -> results/assoc_8_Dragon.log
	./smp_cache 1048576 16 64 4 0 ../trace/canneal.04t.longTrace -> results/assoc_16_MSI.log
	./smp_cache 1048576 16 64 4 1 ../trace/canneal.04t.longTrace -> results/assoc_16_MESI.log
	./smp_cache 1048576 16 64 4 2 ../trace/canneal.04t.longTrace -> results/assoc_16_Dragon.log
	./smp_cache 1048576 8 64 4 0 ../trace/canneal.04t.longTrace -> results/block_size_64_MSI.log
	./smp_cache 1048576 8 64 4 1 ../trace/canneal.04t.longTrace -> results/block_size_64_MESI.log
	./smp_cache 1048576 8 64 4 2 ../trace/canneal.04t.longTrace -> results/block_size_64_Dragon.log
	./smp_cache 1048576 8 128 4 0 ../trace/canneal.04t.longTrace -> results/block_size_128_MSI.log
	./smp_cache 1048576 8 128 4 1 ../trace/canneal.04t.longTrace -> results/block_size_128_MESI.log
	./smp_cache 1048576 8 128 4 2 ../trace/canneal.04t.longTrace -> results/block_size_128_Dragon.log
	./smp_cache 1048576 8 256 4 0 ../trace/canneal.04t.longTrace -> results/block_size_256_MSI.log
	./smp_cache 1048576 8 256 4 1 ../trace/canneal.04t.longTrace -> results/block_size_256_MESI.log
	./smp_cache 1048576 8 256 4 2 ../trace/canneal.04t.longTrace -> results/block_size_256_Dragon.log
	./smp_cache 1048576 8 128 4 0 ../trace/canneal.04t.longTrace -> results/protocol_MSI.log
	./smp_cache 1048576 8 128 4 1 ../trace/canneal.04t.longTrace -> results/protocol_MESI.log
	./smp_cache 1048576 8 128 4 2 ../trace/canneal.04t.longTrace -> results/protocol_Dragon.log

