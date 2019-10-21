//
// Created by Joshmosh on 2/20/2019.
//

#include "sp_register.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <cstring>
#include <string>
#include <iomanip>
#include <map>


void sp_register::set_sp_register(sp_register_t reg, stage_t s, unsigned value) {
    spRegisters[s][reg] = value;
}

unsigned sp_register::get_sp_register(sp_register_t reg, stage_t s) {
    return spRegisters[s][reg];
}

void sp_register::set_ir_register(instruction_t instruction, stage_t s) {
    instr_register[s] = instruction;
}

instruction_t sp_register::get_ir_register(stage_t s) {
    return instr_register[s];
}

instruction_t *sp_register::get_ir_registers() {
    return instr_register;
}

void sp_register::reset() {
    memset(spRegisters, UNDEFINED, sizeof(spRegisters)); //clear 3D array

    //configure all IR registers to execute NOP (IF will obviously not execute NOP right away however)
    for (int k = 0; k < NUM_STAGES; ++k) {
        instr_register[k].opcode = NOP;
        instr_register[k].src1 = UNDEFINED;
        instr_register[k].src2 = UNDEFINED;
        instr_register[k].dest = UNDEFINED;
        instr_register[k].immediate = UNDEFINED;
    }
}

void sp_register::clear_sp_registers(stage_t s) {
    for (int i = 0; i < NUM_SP_REGISTERS; ++i) {
        spRegisters[s][i] = UNDEFINED;
    }
}
