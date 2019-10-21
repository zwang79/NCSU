// ECE #563 Project1 Integer Pipeline
// Zhiping Wang 
// UnityID: zwang79
// StudentID: 200265085

#ifndef SIM_PIPE_H_
#define SIM_PIPE_H_

#include <stdio.h>
#include <string>

using namespace std;

#define PROGRAM_SIZE 50

#define UNDEFINED 0xFFFFFFFF //used to initialize the registers
#define NUM_SP_REGISTERS 9
#define NUM_GP_REGISTERS 32
#define NUM_OPCODES 16 
#define NUM_STAGES 5

typedef enum {PC, NPC, IR, A, B, IMM, COND, ALU_OUTPUT, LMD} sp_register_t;

typedef enum {LW, SW, ADD, ADDI, SUB, SUBI, XOR, BEQZ, BNEZ, BLTZ, BGTZ, BLEZ, BGEZ, JUMP, EOP, NOP} opcode_t;

typedef enum {IF, ID, EXE, MEM, WB} stage_t;

typedef enum {UNKNOWN, MEMO, ARITH, ARITHI, BRANCH, SYS} op_t;

typedef enum {NON, DATA, CONTROL, STRUCT} hazard_t;

typedef struct{
        opcode_t opcode; //opcode
        unsigned src1; //first source register in the assembly instruction (for SW, register to be written to memory)
        unsigned src2; //second source register in the assembly instruction
        unsigned dest; //destination register
        unsigned immediate; //immediate field
        string label; //for conditional branches, label of the target instruction - used only for parsing/debugging purposes
} instruction_t;

class sim_pipe{

	
    unsigned clock_cycles;
    unsigned instructions_executed;
    unsigned stalls;
    bool     stall;

    // hazard related
    hazard_t hazard;
    bool stall_stack;
    hazard_t stall_stack_type;
    bool last_pipe;

        // structual
        unsigned structual_stalls;
        bool structual_hazard;

        // control
        bool control_hazard;

        // data
        bool data_hazard;

    /* Add the data members required by your simulator's implementation here */
    unsigned gp_register[NUM_GP_REGISTERS];
    unsigned sp_register[NUM_STAGES][NUM_SP_REGISTERS];
    

        //instruction memory 
        instruction_t instr_memory[PROGRAM_SIZE];
        instruction_t Ins[NUM_STAGES];

        //base address in the instruction memory where the program is loaded
        unsigned instr_base_address;

	//data memory - should be initialize to all 0xFF
	unsigned char *data_memory;

	//memory size in bytes
	unsigned data_memory_size;
	
	//memory latency in clock cycles
	unsigned data_memory_latency;


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

	// write menory
	void write_memory(unsigned address, unsigned value);

	// read memory
	unsigned read_memory(unsigned address);

	//runs the simulator for "cycles" clock cycles (run the program to completion if cycles=0) 
	void run(unsigned cycles=0);

    // IF stage
	void InstrFetch();

	// ID stage
	void InstrDecode();

	// EXE stage
	void Execute();

	// MEM stage
	void Memory();

	// WB stage
	bool WriteBack();

	// operation type
	unsigned op_type(opcode_t op);

	// data hazard detector
	bool DATA_hazard_detect();

	// control hazard detector
	bool CONTROL_hazard_detect();

	// hazard handling
	void hazard_handling();
	
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

	//returns the number of clock cycles 
	unsigned get_clock_cycles();

	//returns the number of stalls added by processor
	unsigned get_stalls();

	//prints the content of the data memory within the specified address range
	void print_memory(unsigned start_address, unsigned end_address);


	//prints the values of the registers 
	void print_registers();

};

#endif /*SIM_PIPE_H_*/
