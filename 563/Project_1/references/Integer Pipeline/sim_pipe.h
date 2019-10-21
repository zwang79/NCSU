
/*PROJECT 1 : INTERGER PIPELINE SIMULATOR */

// 	NAME 			: SUDHARSHAN KANNAN
// 	UNITY ID		: skannan4
// 	EMAIL 			: skannan4@ncsu.edu
//	STUDENT ID		: 200152199


/*********************************************************************/

#ifndef SIM_PIPE_H_
#define SIM_PIPE_H_

#include <stdio.h>
#include <string>
#include <list>
#include <iostream>

#define UNDEFINED 0xFFFFFFFF //constant used to initialize registers
#define NUM_SP_REGISTERS 9
#define NUM_GP_REGISTERS 32
#define NUM_OPCODES 23
#define NUM_STAGES 5
#define BASE_ADDRESS 0x10000004

typedef enum {PC, NPC, IR, A, B, IMM, COND, ALU_OUTPUT, LMD} sp_register_t;

// The NOP instruction should be automatically inserted by the processor to implement pipeline bubbles
typedef enum { ADD, ADDI, SUB, SUBI, XOR, XORI, OR, ORI, AND, ANDI, MULT, DIV, BEQZ, BNEZ, BLTZ, BGTZ, BLEZ, BGEZ, JUMP, EOP, NOP,LW, SW} opcode_t;

typedef enum {IF, ID, EX, MEM, WB} stage_t;

typedef enum   {terminated,in_progress} fsm_state;

typedef enum {not_stalled,stalled} pipeline_state;

typedef struct finite_state_machine {
    
    fsm_state s;
    
}fsm;



class sim_pipe{

	/* Add the data members required by your simulator's implementation here */
	
        unsigned clock_cycles;
        unsigned num_instructions;
        unsigned num_stalls;
	//data memory - should be initialize to all 0xFF
	unsigned char *data_memory;

	//memory size in bytes
	unsigned data_memory_size;
        
        // Memory Latency 
        
        unsigned memory_wall;
        
        // Array of integers to represent general purpose registers
        signed int regs[32];
        
        // Special purpose registers
        unsigned sp_PC,sp_NPC,sp_A,sp_B,sp_IMM,sp_COND,sp_ALU_OUTPUT,sp_LMD;

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
        
        fsm engine(unsigned);

};


/* Class to represent x86 assembly instructions*/


class instruction {
    
    friend class sim_pipe;
    opcode_t opcode;
    unsigned char bin_op;
    int address;
    int source_1_index;
    int source_2_index;
    int destination_index;
    int imm;
    int base_reg_index;
    int offset;
    int branch_offset;
    int target_address;
    std::string label;
    stage_t stage;
    pipeline_state status;
    bool fetch;
    bool decode;
    bool execute;
    bool mem;
    
    
};

/* Class to represent pipeline registers */

class pipeline_reg {
    
    
    friend class sim_pipe;
    instruction IR;
    unsigned PC,NPC,COND,ALU_OUTPUT,LMD,A,B,IMM;
  
    
public :
    pipeline_reg (void);
 
};


/* Class to represent Symbol table - offset of instruction from NPC*/

class Entry {
    
public :
    std::string label;
    unsigned target;
    int npc_offset;
    
public :
    void insert_elt(Entry&);
    unsigned find_elt(std::string&);
  
    
};







#endif /*SIM_PIPE_H_*/

