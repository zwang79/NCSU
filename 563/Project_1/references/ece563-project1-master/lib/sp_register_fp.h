//
// Created by Joshmosh on 3/2/2019.
//

#ifndef ECE563_PROJECT1_SP_REGISTER_FP_H
#define ECE563_PROJECT1_SP_REGISTER_FP_H

#include <stdio.h>
#include <string>

using namespace std;
#define UNDEFINED 0xFFFFFFFF
#define NUM_SP_REGISTERS 9
#define NUM_STAGES 5
#define NUM_SP_INT_REGISTERS 15

typedef enum {
    PC, NPC, IR, A, B, IMM, COND, ALU_OUTPUT, LMD
} sp_register_t;

typedef enum {
    LW,
    SW,
    ADD,
    ADDI,
    SUB,
    SUBI,
    XOR,
    BEQZ,
    BNEZ,
    BLTZ,
    BGTZ,
    BLEZ,
    BGEZ,
    JUMP,
    EOP,
    NOP,
    LWS,
    SWS,
    ADDS,
    SUBS,
    MULTS,
    DIVS
} opcode_t;

typedef enum {
    IF, ID, EXE, MEM, WB
} stage_t;

typedef struct {
    opcode_t opcode; //opcode
    unsigned src1; //first source register in the assembly instruction (for SW, register to be written to memory)
    unsigned src2; //second source register in the assembly instruction
    unsigned dest; //destination register
    unsigned immediate; //immediate field
    string label; //for conditional branches, label of the target instruction - used only for parsing/debugging purposes
    unsigned inum; //number of instruction in program order
} instruction_t;

typedef enum {
    RAW, WAR, WAW, STRUCTURAL, CONTROL
} hazard_type_t;

typedef struct {
    bool in_stall;
    hazard_type_t hazard_type;
    unsigned reg;
} stall_t;

class sp_register_fp {
private:
    //Separate data structure for holding the spregister IR
    instruction_t instr_register[NUM_STAGES];
    //Special Registers used during the pipeline (stage num 0-4 / register number 0-8
    unsigned spRegisters[NUM_STAGES][NUM_SP_REGISTERS];

public:
    //sp_register();
    //~sp_register();
    void set_sp_register(sp_register_t reg, stage_t s, unsigned value);

    unsigned get_sp_register(sp_register_t reg, stage_t s);

    void set_ir_register(instruction_t instruction, stage_t s);

    instruction_t get_ir_register(stage_t s);

    instruction_t *get_ir_registers();

    void clear_sp_registers(stage_t s);

    void reset();
};


#endif //ECE563_PROJECT1_SP_REGISTER_FP_H
