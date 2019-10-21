//---------- ECE #563 Project #2 ----------
//----------Student ID: 200265085----------
//----------    Zhiping Wang     ----------

#ifndef SIM_OO_H_
#define SIM_OO_H_

#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <cstring>
#include <sstream>

using namespace std;

#define UNDEFINED 0xFFFFFFFF //constant used for initialization
#define NUM_GP_REGISTERS 32
#define NUM_OPCODES 24
#define NUM_STAGES 4
#define MAX_UNITS 10 
#define PROGRAM_SIZE 50 

// instructions supported
typedef enum {LW, SW, ADD, ADDI, SUB, SUBI, XOR, AND, MULT, DIV, BEQZ, BNEZ, BLTZ, BGTZ, BLEZ, BGEZ, JUMP, EOP, LWS, SWS, ADDS, SUBS, MULTS, DIVS} opcode_t;

// reservation stations types
typedef enum {INTEGER_RS, ADD_RS, MULT_RS, LOAD_B} res_station_t;

// execution units types
typedef enum {INTEGER, ADDER, MULTIPLIER, DIVIDER, MEMORY} exe_unit_t;

// stages names
typedef enum {ISSUE, EXECUTE, WRITE_RESULT, COMMIT} stage_t;

// operation type
typedef enum {UNKNOWN, MEMO, ARITH, ARITHI, BRANCH, FP, SYS} op_t;

// instruction data type
typedef struct{
        opcode_t opcode; //opcode
        unsigned src1; //first source register in the assembly instruction (for SW, register to be written to memory)
        unsigned src2; //second source register in the assembly instruction
        unsigned dest; //destination register
        unsigned immediate; //immediate field
        string label; //for conditional branches, label of the target instruction - used only for parsing/debugging purposes
} instruction_t;

// execution unit
typedef struct{
        exe_unit_t type;  // execution unit type
        unsigned latency; // execution unit latency
        unsigned busy;    // 0 if execution unit is free, otherwise number of clock cycles during
                          // which the execution unit will be busy. It should be initialized
                          // to the latency of the unit when the unit becomes busy, and decremented
                          // at each clock cycle
        unsigned pc; 	  // PC of the instruction using the functional unit
} unit_t;

// entry in the "instruction window"
typedef struct{
	unsigned pc;	// PC of the instruction
	unsigned issue;	// clock cycle when the instruction is issued
	unsigned exe;	// clock cycle when the instruction enters execution
	unsigned wr;	// clock cycle when the instruction enters write result
	unsigned commit;// clock cycle when the instruction commits (for stores, clock cycle when the store starts committing 
} instr_window_entry_t;

// ROB entry
typedef struct{
	bool busy;	
	bool ready;	// ready field
	unsigned pc;  	// pc of corresponding instruction (set to UNDEFINED if ROB entry is available)
	stage_t state;	// state field
	unsigned destination; // destination field
	unsigned value;	      // value field
	bool operand_is_int;
	opcode_t opcode;
}rob_entry_t;

// reservation station entry
typedef struct{
	res_station_t type; // reservation station type
	unsigned name;	    // reservation station name (i.e., "Int", "Add", "Mult", "Load") for logging purposes
	unsigned pc;  	    // pc of corresponding instruction (set to UNDEFINED if reservation station is available)
	unsigned value1;    // Vj field
	unsigned value2;    // Vk field
	unsigned tag1;	    // Qj field
	unsigned tag2;	    // Qk field
	unsigned destination; // destination field
	unsigned address;     // address field (for loads and stores)
	bool busy;
	bool des_is_int;
	opcode_t opcode;
	unsigned label;
}res_station_entry_t;

//instruction window 
typedef struct{
	unsigned num_entries;
	instr_window_entry_t *entries;
} instr_window_t;

// ROB
typedef struct{
	unsigned num_entries;
	rob_entry_t *entries;
} rob_t;

// reservation stations
typedef struct{
	unsigned num_entries;
	res_station_entry_t *entries;
}res_stations_t;

typedef struct{
	unsigned pc;
	bool is_load;
	unsigned busy;
}mem_access_t;

typedef struct{
	unsigned rob_entry;
	unsigned output;
}update_t;

typedef struct{
	unsigned tag;
	unsigned pc;
}renaming_t;

class sim_ooo{

	/* Add the data members required by your simulator's implementation here */
	unsigned gp_int_register[NUM_GP_REGISTERS];
	unsigned gp_fp_register[NUM_GP_REGISTERS];
	renaming_t renaming_table[2*NUM_GP_REGISTERS];
	bool store_begin;
	unsigned store_pc;
	unsigned store_tag;

	unsigned flush_log_value;
	unsigned flush_log_pc;

   // bool cond // branch condition
    
    unsigned wr_tag[MAX_UNITS]; // clear res entry on next cycle
    unsigned wr_tag_count;
    unsigned wr_tag_load; // clear load res entry on next cycle
    unsigned memory_latency;

    unsigned last_free_rob_entry;
   // bool mem_haz;

	/* end added data members */

	//issue width
	unsigned issue_width;
	
	//instruction window
	instr_window_t pending_instructions;

	//reorder buffer
	rob_t rob;

	//reservation stations
	res_stations_t reservation_stations;

	//execution units
        unit_t exec_units[MAX_UNITS];
        unsigned num_units;
        unsigned output[MAX_UNITS];

	//instruction memory
	instruction_t instr_memory[PROGRAM_SIZE];

	// instruction fetched
	instruction_t Ins;

        //base address in the instruction memory where the program is loaded
        unsigned instr_base_address;

        //start PC
        unsigned PC;

        // BRANCH PC
        unsigned BRANCH_PC;

	//data memory - should be initialize to all 0xFF
	unsigned char *data_memory;

	//memory size in bytes
	unsigned data_memory_size;
	
	//instruction executed
	unsigned instructions_executed;

	//clock cycles
	unsigned clock_cycles;

	//execution log
	stringstream log;

	//ins that need to access memory
	mem_access_t mem_ins;

	unsigned commit_tag;

	//update type
	update_t update[MAX_UNITS], update_load;

	// prediction
	bool mispredict;

	// eop
	unsigned eop_pc;
	bool end = false;

public:

	/* Instantiates the simulator
          	Note: registers must be initialized to UNDEFINED value, and data memory to all 0xFF values
        */
	sim_ooo(unsigned mem_size, 		// size of data memory (in byte)
		unsigned rob_size, 		// number of ROB entries
                unsigned num_int_res_stations,	// number of integer reservation stations 
                unsigned num_add_res_stations,	// number of ADD reservation stations
                unsigned num_mul_res_stations, 	// number of MULT/DIV reservation stations
                unsigned num_load_buffers,	// number of LOAD buffers
		unsigned issue_width=1		// issue width
        );	
	
	//de-allocates the simulator
	~sim_ooo();

        // adds one or more execution units of a given type to the processor
        // - exec_unit: type of execution unit to be added
        // - latency: latency of the execution unit (in clock cycles)
        // - instances: number of execution units of this type to be added
        void init_exec_unit(exe_unit_t exec_unit, unsigned latency, unsigned instances=1);

	//related to functional unit
	unsigned get_free_unit(opcode_t opcode);

	//loads the assembly program in file "filename" in instruction memory at the specified address
	void load_program(const char *filename, unsigned base_address=0x0);

	//runs the simulator for "cycles" clock cycles (run the program to completion if cycles=0) 
	void run(unsigned cycles=0);

	bool Issue();

	void Execute();

	void WriteResult();

	void Commit();
	
	void flush_all();

	void flush_rob();

	void flush_exe();

	void flush_res();

	void flush_renaming();

	void flush_window();

	//resets the state of the simulator
        /* Note: 
	   - registers should be reset to UNDEFINED value 
	   - data memory should be reset to all 0xFF values
	   - instruction window, reservation stations and rob should be cleaned
	*/
	void reset();
    
    // check if there is bypass possibility
	unsigned check_bypass(unsigned address, unsigned pc);

	// get available rob entry
	unsigned get_free_rob();

	// get available resevation station entry
    unsigned get_free_res(opcode_t op);

    // write rob
    void write_rob(unsigned rob_entry, instruction_t Ins, unsigned PC);

    // write reservation station
    void write_res(unsigned res_entry, unsigned rob_entry, instruction_t Ins, unsigned PC);

    void write_window(unsigned rob_entry, stage_t stage);

    // mem access record
    void write_mem_access(unsigned pc, bool is_load);

    void decrement_mem_access_time();

    void clear_mem_access();
    
    // renaming at ISSUE
    unsigned get_renaming_tag(unsigned src, bool is_int);

    // return rob entry according to pc
    unsigned get_rob_entry(unsigned pc);

    // return res entry according to pc
    unsigned get_res_entry(unsigned pc);

    // update rob after exe
    void update_rob(unsigned b, unsigned output);

    // update res after exe
    void update_res(unsigned b, unsigned output);

    // clear res entry after WR
    void clear_res(unsigned tag);

    // clear rob entry after COMMIT and ISSUE
    void clear_rob(unsigned tag);

    // clear window entry
    void clear_window(unsigned tag);

	//return type of instruction
    unsigned op_type(opcode_t op);

    // busy--
    void decrement_units_busy_time();

       //returns value of the specified integer general purpose register
        int get_int_register(unsigned reg);

        //set the value of the given integer general purpose register to "value"
        void set_int_register(unsigned reg, unsigned value);

        //returns value of the specified floating point general purpose register
        float get_fp_register(unsigned reg);

        //set the value of the given floating point general purpose register to "value"
        void set_fp_register(unsigned reg, float value);

	// returns the index of the ROB entry that will write this integer register (UNDEFINED if the value of the register is not pending
	unsigned get_int_register_tag(unsigned reg);

	// returns the index of the ROB entry that will write this floating point register (UNDEFINED if the value of the register is not pending
	unsigned get_fp_register_tag(unsigned reg);

	//returns the IPC
	float get_IPC();

	//returns the number of instructions fully executed
	unsigned get_instructions_executed();

	//returns the number of clock cycles 
	unsigned get_clock_cycles();

	//prints the content of the data memory within the specified address range
	void print_memory(unsigned start_address, unsigned end_address);

	// writes an integer value to data memory at the specified address (use little-endian format: https://en.wikipedia.org/wiki/Endianness)
	void write_memory(unsigned address, unsigned value);

	unsigned read_memory(unsigned address);

	//prints the values of the registers 
	void print_registers();

	//prints the status of processor excluding memory
	void print_status();

	// prints the content of the ROB
	void print_rob();

	//prints the content of the reservation stations
	void print_reservation_stations();

	//print the content of the instruction window
	void print_pending_instructions();

	//initialize the execution log
	void init_log();

	//commit an instruction to the log
	void commit_to_log(instr_window_entry_t iwe);

	//print log
	void print_log();

};

#endif /*SIM_OOO_H_*/
