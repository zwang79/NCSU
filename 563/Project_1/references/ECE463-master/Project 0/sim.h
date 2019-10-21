#ifndef SIM_H_
#define SIM_H_

#include <stdio.h>
#include <string>
#include <string.h>


#define UNDEFINED 0xFFFFFFFF //constant used to initialize registers
#define NUM_SP_REGISTERS 9
#define NUM_GP_REGISTERS 32
#define NUM_OPCODES 10

#define BTABLE 50

//opcode library
/*
#define LW 0x01
#define SW 0x02
#define ADD 0x03
#define SUB 0x04
#define XOR 0x05
#define ADDI 0x06
#define SUBI 0x07
#define BNEZ 0x08
#define BLTZ 0x09
#define EOP 0x0A
*/

typedef enum {PC, NPC, IR, A, B, IMM, COND, ALU_OUTPUT, LMD} sp_register_t;

typedef enum {LW = 0x01, SW = 0x02, ADD = 0x03, ADDI = 0x06, SUB = 0x04, SUBI = 0x07, XOR = 0x05, BLTZ = 0x09, BNEZ = 0x08, EOP = 0x0A} opcode_t;

class sim{

	/* Add the data members required by your simulator's implementation here */
	
	
	//data memory - should be initialize to all 0xFF
	unsigned char *data_memory;

	//memory size in bytes
	unsigned data_memory_size;
	unsigned instruction_memory_size;
	
	//instruction memory
	unsigned int *instruction_memory;
	
	unsigned sp_reg[NUM_SP_REGISTERS];
	unsigned gp_reg[NUM_GP_REGISTERS];
	unsigned opcode[NUM_OPCODES];
	
	float clock_cycles;
	float instruction_count;
	
	unsigned stage;

public:

	//instantiates the simulator with a data memory of given size (in bytes)
	sim(unsigned data_mem_size);
	
	//de-allocates the simulator
	~sim();

	//loads the assembly program in file "filename" in instruction memory at the specified address
	void load_program(const char *filename, unsigned base_address=0x0);

	//runs the simulator for "cycles" clock cycles (run the program to completion if cycles=0) 
	void run(unsigned cycles=0);
	
	void fetch();

	void decode();

	void execute();

	void memory();

	void writeBack();

	//resets the state of the simulator
        /* Note: registers should be reset to UNDEFINED value */
	void reset();

	//returns value of the specified special purpose register
	/* Note: you are allowed to use a custom format for the IR register.
           Therefore, the test cases won't check the value of IR using this method. 
	   You can add an extra method to retrieve the content of IR */
	unsigned get_sp_register(sp_register_t reg);

	//returns value of the specified general purpose register
	unsigned get_gp_register(unsigned reg);

	//returns the IPC
	float get_IPC();

	//returns the number of instructions fully executed
	unsigned get_instructions_executed();

	void print_instruction_memory(unsigned start_address, unsigned end_address);

	//prints the content of the data memory within the specified address range
	void print_memory(unsigned start_address, unsigned end_address);

	// writes an integer value to data memory at the specified address (use little-endian format: https://en.wikipedia.org/wiki/Endianness)
	void write_memory(unsigned address, unsigned value);

	//prints the values of the registers 
	void print_registers();
	
	//returns the decimal value/address of a register
	unsigned get_register_value(std::string str);

};

#endif /*SIM_H_*/
