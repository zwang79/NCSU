//ECE 463 Project 1
//Author William Shaw email wtshaw@ncsu.edu

#ifndef SIM_PIPE_H_
#define SIM_PIPE_H_

#include <stdio.h>
#include <string>
#include <string.h>

#define UNDEFINED 0xFFFFFFFF //constant used to initialize registers
#define NUM_SP_REGISTERS 9
#define NUM_GP_REGISTERS 32
#define NUM_OPCODES 23
#define NUM_STAGES 5
#define BTABLE 50 //size of table for recording branche labels
#define MAX_STALL 2 // MAX_STALL = latency of execution and memory stage. If one stage become more cycles recompute and put answer here.

typedef enum {PC = 0, NPC = 1, IR = 2, A = 3, B = 4, IMM = 5, COND = 6, ALU_OUTPUT = 7, LMD = 8} sp_register_t;

// The NOP instruction should be automatically inserted by the processor to implement pipeline bubbles
typedef enum {LW = 1, SW = 2, ADD = 3, ADDI = 4, SUB = 5, SUBI = 6, XOR = 7, XORI = 8, OR = 9, ORI = 10
			, AND = 11, ANDI = 12, MULT = 13, DIV = 14, BEQZ = 15, BNEZ = 16, BLTZ = 17, BGTZ = 18
			, BLEZ = 19, BGEZ = 20, JUMP = 21, EOP = 22, NOP = 23} opcode_t;

typedef enum {IF = 1, ID = 2, EX = 3, MEM = 4, WB = 5} stage_t;

class sim_pipe{

	//data memory - should be initialize to all 0xFF
	int *data_memory;

	//memory size in bytes
	unsigned data_memory_size;
	unsigned instruction_memory_size;
	unsigned pc;
	unsigned base_Address;
	//instruction memory
	unsigned int *instruction_memory;

	/* Add the data members required by your simulator's implementation here */
	unsigned if_id_pipe[NUM_SP_REGISTERS];
	unsigned id_ex_pipe[NUM_SP_REGISTERS];
	unsigned ex_mem_pipe[NUM_SP_REGISTERS];
	unsigned mem_wb_pipe[NUM_SP_REGISTERS];
	unsigned gp_reg[NUM_GP_REGISTERS];
	unsigned opcode[NUM_OPCODES];
	unsigned stall_table[MAX_STALL];

	float clock_cycles;
	float instruction_count;
	float stalls;

	bool eop;
	bool stalled;

public:

	//instantiates the simulator with a data memory of given size (in bytes) and latency (in clock cycles)
	/* Note: 
           - initialize the registers to UNDEFINED value 
	   - initialize the data memory to all 0xFF values
	*/
	sim_pipe(unsigned data_mem_size, unsigned data_mem_latency);
	
	//de-allocates the simulator
	~sim_pipe();

	//loads the assembly program in file "filename" in instruction memory at the specified address
	void load_program(const char *filename, unsigned base_address=0x0);

	//runs the simulator for "cycles" clock cycles (run the program to completion if cycles=0) 
	void run(unsigned cycles=0);
	
	//resets the state of the simulator
        /* Note: 
	   - registers should be reset to UNDEFINED value 
	   - data memory should be reset to all 0xFF values
	*/
	void reset();

	// returns value of the specified special purpose register for a given stage (at the "entrance" of that stage)
        // if that special purpose register is not used in that stage, returns UNDEFINED
        //
        // Examples (refer to page C-37 in the 5th edition textbook, A-32 in 4th edition of textbook)::
        // - get_sp_register(PC, IF) returns the value of PC
        // - get_sp_register(NPC, ID) returns the value of IF/ID.NPC
        // - get_sp_register(NPC, EX) returns the value of ID/EX.NPC
        // - get_sp_register(ALU_OUTPUT, MEM) returns the value of EX/MEM.ALU_OUTPUT
        // - get_sp_register(ALU_OUTPUT, WB) returns the value of MEM/WB.ALU_OUTPUT
	// - get_sp_register(LMD, ID) returns UNDEFINED
	/* Note: you are allowed to use a custom format for the IR register.
           Therefore, the test cases won't check the value of IR using this method. 
	   You can add an extra method to retrieve the content of IR */
	unsigned get_sp_register(sp_register_t reg, stage_t stage);

	//returns value of the specified general purpose register
	int get_gp_register(unsigned reg);

	// set the value of the given general purpose register to "value"
	void set_gp_register(unsigned reg, int value);

	//returns the IPC
	float get_IPC();

	//returns the number of instructions fully executed
	unsigned get_instructions_executed();

	//returns the number of stalls added by processor
	unsigned get_stalls();

	//returns the number of clock cycles
	unsigned get_clock_cycles();

	//prints the content of the data memory within the specified address range
	void print_memory(unsigned start_address, unsigned end_address);

	// writes an integer value to data memory at the specified address (use little-endian format: https://en.wikipedia.org/wiki/Endianness)
	void write_memory(unsigned address, unsigned value);

	//prints the values of the registers 
	void print_registers();
	///////////////////////////////////////////////////////		USER MADE FUNCTIONS ////////////////////////////////////////////////////////
	void fetch();

	void decode();

	void execute();

	void memory();

	void writeBack();

	//returns the decimal value/address of a register
	unsigned get_register_value(std::string str);

	//returns the index of the first letter/number in the string
	unsigned get_first_letter(std::string str, unsigned start);

	//returns the index of the next space or tab
	unsigned find_end_of_argument(std::string str, unsigned start);

	//returns the int value of a string
	int convert_string_to_number(std::string str);

	void print_instruction_memory(unsigned start_address, unsigned end_address);

	//returns true if opcode condition and matches the value of a
	//returns false if not
	bool branchIf(unsigned opcode, unsigned a);
};

#endif /*SIM_PIPE_H_*/
