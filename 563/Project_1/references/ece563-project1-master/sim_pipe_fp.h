#ifndef SIM_PIPE_FP_H_
#define SIM_PIPE_FP_H_

#include <stdio.h>
#include <string>
#include "lib/sp_register_fp.h"

using namespace std;

#define PROGRAM_SIZE 50
#define DEBUG   1
#define UNDEFINED 0xFFFFFFFF
#define NUM_SP_REGISTERS 9
#define NUM_SP_INT_REGISTERS 15
#define NUM_GP_REGISTERS 32
#define NUM_OPCODES 22
#define NUM_STAGES 5
#define MAX_UNITS 10

typedef enum {
    INTEGER, ADDER, MULTIPLIER, DIVIDER
} exe_unit_t;

// execution unit
typedef struct {
    exe_unit_t type;  // execution unit type
    unsigned latency; // execution unit latency
    unsigned busy;    // 0 if execution unit is free, otherwise number of clock cycles during
    // which the execution unit will be busy. It should be initialized
    // to the latency of the unit when the unit becomes busy, and decremented
    // at each clock cycle
    int npc;
    unsigned a;
    unsigned b;
    unsigned imm;
    instruction_t instruction; // instruction using the functional unit
} unit_t;

class sim_pipe_fp {

    bool running;
    bool end;
    //class containing all sp_regisiters
    sp_register_fp *sp_registers;
    //object containing all info on stalls
    stall_t stall[NUM_STAGES];
    //Current Amount of clockcycles each stage has left to execute before completing
    int latency[NUM_STAGES];
    bool stall_inserted;
    //number of cycles ran
    int clock_cycles_executed;
    //number of instructions executed
    unsigned int instructions_executed;
    //number of Stalls
    unsigned int stalls;
    //Register File for all other registers
    unsigned *registerFile;
    //fp registers
    unsigned *registerFile_fp;

    //instruction memory
    instruction_t instr_memory[PROGRAM_SIZE];

    //base address in the instruction memory where the program is loaded
    unsigned instr_base_address;

    //data memory - should be initialize to all 0xFF
    unsigned char *data_memory;

    //memory size in bytes
    unsigned data_memory_size;

    //memory latency in clock cycles
    unsigned data_memory_latency;

    //execution units
    unit_t exec_units[MAX_UNITS];
    unsigned num_units;

public:

    //instantiates the simulator with a data memory of given size (in bytes) and latency (in clock cycles)
    /* Note:
           - initialize the registers to UNDEFINED value 
       - initialize the data memory to all 0xFF values
    */
    sim_pipe_fp(unsigned data_mem_size, unsigned data_mem_latency);

    //de-allocates the simulator
    ~sim_pipe_fp();

    // adds one or more execution units of a given type to the processor
    // - exec_unit: type of execution unit to be added
    // - latency: latency of the execution unit (in clock cycles)
    // - instances: number of execution units of this type to be added
    void init_exec_unit(exe_unit_t exec_unit, unsigned latency, unsigned instances = 1);

    //loads the assembly program in file "filename" in instruction memory at the specified address
    void load_program(const char *filename, unsigned base_address = 0x0);

    //runs the simulator for "cycles" clock cycles (run the program to completion if cycles=0)
    void run(unsigned cycles = 0);

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

    //returns value of the specified integer general purpose register
    int get_int_register(unsigned reg);

    //set the value of the given integer general purpose register to "value"
    void set_int_register(unsigned reg, int value);

    //returns value of the specified floating point general purpose register
    float get_fp_register(unsigned reg);

    //set the value of the given floating point general purpose register to "value"
    void set_fp_register(unsigned reg, float value);

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

    // writes an integer value to data memory at the specified address (use little-endian format: https://en.wikipedia.org/wiki/Endianness)
    void write_memory(unsigned address, unsigned value);
    void write_memory_fp(unsigned address, float value);

    //loads an register from memory
    unsigned load_memory(unsigned address);

    //prints the values of the registers
    void print_registers();

    //ADDED functions
    //Pipeline Functions
    void fetch();

    void decode();

    void execute();

    void memory();

    void writeback();

    void check_stall(stage_t, instruction_t);

    bool isStall(stage_t);

private:

    // returns a free exec unit for the particular instruction type
    unsigned get_free_unit(opcode_t opcode);

    //reduce execution unit busy time (to be invoked at every clock cycle
    void decrement_units_busy_time();

    //debug units
    void debug_units();

    void execute_integer(const instruction_t &ir, unsigned int a, unsigned int b, unsigned int aluoutput) const;

    void checkWAW(int i, const unit_t &unit, instruction_t ir);
};

#endif /*SIM_PIPE_FP_H_*/
