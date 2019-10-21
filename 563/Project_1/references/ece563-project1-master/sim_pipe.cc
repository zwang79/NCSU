#include "sim_pipe.h"
#include "lib/sp_register.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <cstring>
#include <string>
#include <iomanip>
#include <map>

//#define DEBUG

using namespace std;

//used for debugging purposes
static const char *reg_names[NUM_SP_REGISTERS] = {"PC", "NPC", "IR", "A", "B", "IMM", "COND", "ALU_OUTPUT", "LMD"};
static const char *stage_names[NUM_STAGES] = {"IF", "ID", "EX", "MEM", "WB"};
static const char *instr_names[NUM_OPCODES] = {"LW", "SW", "ADD", "ADDI", "SUB", "SUBI", "XOR", "BEQZ", "BNEZ", "BLTZ",
                                               "BGTZ", "BLEZ", "BGEZ", "JUMP", "EOP", "NOP"};





/* =============================================================

   HELPER FUNCTIONS

   ============================================================= */


/* converts integer into array of unsigned char - little indian */
inline void int2char(unsigned value, unsigned char *buffer) {
    memcpy(buffer, &value, sizeof value);
}

/* converts array of char into integer - little indian */
inline unsigned char2int(unsigned char *buffer) {
    unsigned d;
    memcpy(&d, buffer, sizeof d);
    return d;
}

/* implements the ALU operations */
unsigned alu(unsigned opcode, unsigned a, unsigned b, unsigned imm, unsigned npc) {
    switch (opcode) {
        case ADD:
            return (a + b);
        case ADDI:
            return (a + imm);
        case SUB:
            return (a - b);
        case SUBI:
            return (a - imm);
        case XOR:
            return (a ^ b);
        case LW:
        case SW:
            return (a + imm);
        case BEQZ:
        case BNEZ:
        case BGTZ:
        case BGEZ:
        case BLTZ:
        case BLEZ:
        case JUMP:
            return (npc + imm);
        default:
            return (-1);
    }
}

/* =============================================================

   CODE PROVIDED - NO NEED TO MODIFY FUNCTIONS BELOW

   ============================================================= */

/* loads the assembly program in file "filename" in instruction memory at the specified address */
void sim_pipe::load_program(const char *filename, unsigned base_address) {

    /* initializing the base instruction address */
    instr_base_address = base_address;
    //added this line to set inital pc
    sp_registers->set_sp_register(PC, IF, base_address);

    /* creating a map with the valid opcodes and with the valid labels */
    map<string, opcode_t> opcodes; //for opcodes
    map<string, unsigned> labels;  //for branches
    for (int i = 0; i < NUM_OPCODES; i++)
        opcodes[string(instr_names[i])] = (opcode_t) i;

    /* opening the assembly file */
    ifstream fin(filename, ios::in | ios::binary);
    if (!fin.is_open()) {
        cerr << "error: open file " << filename << " failed!" << endl;
        exit(-1);
    }

    /* parsing the assembly file line by line */
    string line;
    unsigned instruction_nr = 0;
    while (getline(fin, line)) {
        // set the instruction field
        char *str = const_cast<char *>(line.c_str());

        // tokenize the instruction
        char *token = strtok(str, " \t");
        map<string, opcode_t>::iterator search = opcodes.find(token);
        if (search == opcodes.end()) {
            // this is a label for a branch - extract it and save it in the labels map
            string label = string(token).substr(0, string(token).length() - 1);
            labels[label] = instruction_nr;
            // move to next token, which must be the instruction opcode
            token = strtok(NULL, " \t");
            search = opcodes.find(token);
            if (search == opcodes.end()) cout << "ERROR: invalid opcode: " << token << " !" << endl;
        }
        instr_memory[instruction_nr].opcode = search->second;

        //reading remaining parameters
        char *par1;
        char *par2;
        char *par3;
        switch (instr_memory[instruction_nr].opcode) {
            case ADD:
            case SUB:
            case XOR:
                par1 = strtok(NULL, " \t");
                par2 = strtok(NULL, " \t");
                par3 = strtok(NULL, " \t");
                instr_memory[instruction_nr].dest = atoi(strtok(par1, "R"));
                instr_memory[instruction_nr].src1 = atoi(strtok(par2, "R"));
                instr_memory[instruction_nr].src2 = atoi(strtok(par3, "R"));
                break;
            case ADDI:
            case SUBI:
                par1 = strtok(NULL, " \t");
                par2 = strtok(NULL, " \t");
                par3 = strtok(NULL, " \t");
                instr_memory[instruction_nr].dest = atoi(strtok(par1, "R"));
                instr_memory[instruction_nr].src1 = atoi(strtok(par2, "R"));
                instr_memory[instruction_nr].immediate = strtoul(par3, NULL, 0);
                break;
            case LW:
                par1 = strtok(NULL, " \t");
                par2 = strtok(NULL, " \t");
                instr_memory[instruction_nr].dest = atoi(strtok(par1, "R"));
                instr_memory[instruction_nr].immediate = strtoul(strtok(par2, "()"), NULL, 0);
                instr_memory[instruction_nr].src1 = atoi(strtok(NULL, "R"));
                break;
            case SW:
                par1 = strtok(NULL, " \t");
                par2 = strtok(NULL, " \t");
                instr_memory[instruction_nr].src1 = atoi(strtok(par1, "R"));
                instr_memory[instruction_nr].immediate = strtoul(strtok(par2, "()"), NULL, 0);
                instr_memory[instruction_nr].src2 = atoi(strtok(NULL, "R"));
                break;
            case BEQZ:
            case BNEZ:
            case BLTZ:
            case BGTZ:
            case BLEZ:
            case BGEZ:
                par1 = strtok(NULL, " \t");
                par2 = strtok(NULL, " \t");
                instr_memory[instruction_nr].src1 = atoi(strtok(par1, "R"));
                instr_memory[instruction_nr].label = par2;
                break;
            case JUMP:
                par2 = strtok(NULL, " \t");
                instr_memory[instruction_nr].label = par2;
            default:
                break;

        }

        /* increment instruction number before moving to next line */
        instruction_nr++;
    }
    //reconstructing the labels of the branch operations
    int i = 0;
    while (true) {
        instruction_t instr = instr_memory[i];
        if (instr.opcode == EOP) break;
        if (instr.opcode == BLTZ || instr.opcode == BNEZ ||
            instr.opcode == BGTZ || instr.opcode == BEQZ ||
            instr.opcode == BGEZ || instr.opcode == BLEZ ||
            instr.opcode == JUMP
                ) {
            instr_memory[i].immediate = (labels[instr.label] - i - 1) << 2;
        }
        i++;
    }

}

/* writes an integer value to data memory at the specified address (use little-endian format: https://en.wikipedia.org/wiki/Endianness) */
void sim_pipe::write_memory(unsigned address, unsigned value) {
    int2char(value, data_memory + address);
}

/* prints the content of the data memory within the specified address range */
void sim_pipe::print_memory(unsigned start_address, unsigned end_address) {
    cout << "data_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8)
         << setfill('0') << end_address << "]" << endl;
    for (unsigned i = start_address; i < end_address; i++) {
        if (i % 4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": ";
        cout << hex << setw(2) << setfill('0') << int(data_memory[i]) << " ";
        if (i % 4 == 3) cout << endl;
    }
}

/* prints the values of the registers */
void sim_pipe::print_registers() {
    cout << "Special purpose registers:" << endl;
    unsigned i, s;
    for (s = 0; s < NUM_STAGES; s++) {
        cout << "Stage: " << stage_names[s] << endl;
        for (i = 0; i < NUM_SP_REGISTERS; i++)
            if ((sp_register_t) i != IR && (sp_register_t) i != COND &&
                get_sp_register((sp_register_t) i, (stage_t) s) != UNDEFINED)
                cout << reg_names[i] << " = " << dec << get_sp_register((sp_register_t) i, (stage_t) s) << hex
                     << " / 0x" << get_sp_register((sp_register_t) i, (stage_t) s) << endl;
    }
    cout << "General purpose registers:" << endl;
    for (i = 0; i < NUM_GP_REGISTERS; i++)
        if (get_gp_register(i) != (int) UNDEFINED)
            cout << "R" << dec << i << " = " << get_gp_register(i) << hex << " / 0x" << get_gp_register(i) << endl;
}

/* initializes the pipeline simulator */
sim_pipe::sim_pipe(unsigned mem_size, unsigned mem_latency) {
    data_memory_size = mem_size;
    data_memory_latency = mem_latency;
    data_memory = new unsigned char[data_memory_size];
    reset();
}

/* deallocates the pipeline simulator */
sim_pipe::~sim_pipe() {
    delete[] data_memory;
    delete registerFile;
    delete sp_registers;
}

/* =============================================================

   CODE TO BE COMPLETED

   ============================================================= */

inline string getOpcodeString(opcode_t op) {
    switch (op) {
        case LW:
            return "LW";
        case SW:
            return "SW";
        case ADD:
            return "ADD";
        case ADDI:
            return "ADDI";
        case SUB:
            return "SUB";
        case SUBI:
            return "SUBI";
        case XOR:
            return "XOR";
        case BEQZ:
            return "BEQZ";
        case BNEZ:
            return "BNEZ";
        case BLTZ:
            return "BLTZ";
        case BGTZ:
            return "BGTZ";
        case BLEZ:
            return "BLEZ";
        case BGEZ:
            return "BGEZ";
        case JUMP:
            return "JUMP";
        case EOP:
            return "EOP";
        case NOP:
            return "NOP";
    }
}

inline void branchTaken(sp_register *sp_registers) {
    //branch taken
    sp_registers->set_sp_register(COND, MEM, 1);
}

/* body of the simulator */
void sim_pipe::run(unsigned cycles) {
    if (cycles == 0) {
        running = true;
    }

#if DEBUG
    printf("IF Stage opcode: %s \n", getOpcodeString(sp_registers->get_ir_register(IF).opcode).c_str());
    printf("ID Stage opcode: %s \n", getOpcodeString(sp_registers->get_ir_register(ID).opcode).c_str());
    printf("EXE Stage opcode: %s \n", getOpcodeString(sp_registers->get_ir_register(EXE).opcode).c_str());
    printf("MEM Stage opcode: %s \n", getOpcodeString(sp_registers->get_ir_register(MEM).opcode).c_str());
    printf("WB Stage opcode: %s \n", getOpcodeString(sp_registers->get_ir_register(WB).opcode).c_str());
    printf("Stalls inserted: %d \n", get_stalls());
#endif

    while (running || cycles != 0) {
        //WB
        writeback();
        //MEM
        memory();
        //EXE
        execute();
        //ID
        decode();
        //IF
        fetch();
        if (stall_inserted) {
            stall_inserted = false;
            stalls++;
        }
        clock_cycles_executed += 1;
        if (!running && cycles > 0) { cycles--; }
        //advance pipeline if no stalls are encountered

    }
}

void sim_pipe::fetch() {
    //check if fetch stage is available

    //Load current PC
    unsigned current_pc = sp_registers->get_sp_register(PC, IF);

    //implemented mux to select between npc and branch pc
    if (get_sp_register(COND, WB) != UNDEFINED) {
        //sets the npc to the output of the alu at the EXE stage
        current_pc = get_sp_register(ALU_OUTPUT, WB);
    }
    //Set NPC
    unsigned next_pc = current_pc + 4;
    if ((current_pc - instr_base_address) / 4 > PROGRAM_SIZE || end) {
        return;
    }
    instruction_t ir = instr_memory[(current_pc - instr_base_address) / 4];
    //check for RAW hazards
    if (isStall(ID) || isStall(EXE)) {
        //stops instructions from being loaded into the pipeline
        if (ir.opcode == BLTZ || ir.opcode == BNEZ ||
            ir.opcode == BGTZ || ir.opcode == BEQZ ||
            ir.opcode == BGEZ || ir.opcode == BLEZ ||
            ir.opcode == JUMP
                ) {
            //ensure a stall is not needed for control hazard as well
            //check_stall(IF,ir);

        }
        return;
    }
    check_stall(ID, ir);
    //handle control hazards
    if (isStall(IF)) {
        //ir cannot move to IF due to CONTROL hazard
        //stall untill ir with hazard is in EXE stage
#if DEBUG
        printf("Stall Inserted at IF on CONTROL HAZARD \n");
#endif
        //make sure the Branch IR is in the pipeline if it is not do not stall yet
        instruction_t *isr = sp_registers->get_ir_registers();
        stall_inserted = true;
        instruction_t stall_ir;
        stall_ir.opcode = NOP;
        stall_ir.src1 = UNDEFINED;
        stall_ir.src2 = UNDEFINED;
        stall_ir.dest = UNDEFINED;
        stall_ir.immediate = UNDEFINED;
        sp_registers->clear_sp_registers(ID);
        sp_registers->set_ir_register(stall_ir, ID);
        return;
    }
    check_stall(IF, ir);

    //handle EOP opcode during the exiting of the program
    if (ir.opcode == EOP) {
        end = true;
        //dont save pc sp registers
        //set all SP registers to UNDEFINED
        sp_registers->clear_sp_registers(ID);
        sp_registers->set_sp_register(NPC, ID, current_pc);
        //load next Instruction into pipeline
        sp_registers->set_ir_register(ir, ID);
        return;
    }

    //set all SP registers to UNDEFINED
    sp_registers->clear_sp_registers(ID);
    sp_registers->set_sp_register(NPC, ID, next_pc);
    sp_registers->set_sp_register(PC, IF, next_pc);
    sp_registers->set_ir_register(ir, ID);

}

void sim_pipe::decode() {
    //load instruction from pipeline sp registers
    instruction_t ir = sp_registers->get_ir_register(ID);
    //load registers from memory if needed
    //use IR to control what A and B are loaded with
    unsigned a = UNDEFINED;
    unsigned b = UNDEFINED;
    unsigned imm = UNDEFINED;

    //insert a stall if it is needed due to RAW hazard
    if (isStall(ID)) {
        //ir cannot move to ID due to RAW hazard
        //stall untill ir with hazard is in WB stage
#if DEBUG
        printf("Stall Inserted at ID \n");
#endif
        stall_inserted = true;
        instruction_t stall_ir;
        stall_ir.opcode = NOP;
        stall_ir.src1 = UNDEFINED;
        stall_ir.src2 = UNDEFINED;
        stall_ir.dest = UNDEFINED;
        stall_ir.immediate = UNDEFINED;
        sp_registers->clear_sp_registers(EXE);
        sp_registers->set_ir_register(stall_ir, EXE);
        return;
    }

    if (isStall(EXE)) {
        return;
    }

    if (ir.opcode == NOP) {
        //do not do anything during this stage (stall or start of program
        sp_registers->clear_sp_registers(EXE);
        sp_registers->set_ir_register(ir, EXE);
        return;
    }
    if (ir.opcode == EOP) {
        sp_registers->clear_sp_registers(EXE);
        sp_registers->set_sp_register(NPC, EXE, sp_registers->get_sp_register(NPC, ID));
        sp_registers->set_ir_register(ir, EXE);
        return;
    }
    switch (ir.opcode) {
        case ADD:
        case SUB:
        case XOR:
            a = get_gp_register(ir.src1);
            b = get_gp_register(ir.src2);
            break;
        case ADDI:
        case SUBI:
            a = get_gp_register(ir.src1);
            imm = ir.immediate;
            break;
        case BEQZ:
        case BNEZ:
        case BLTZ:
        case BGTZ:
        case BLEZ:
        case BGEZ:
        case JUMP:
            a = get_gp_register(ir.src1);
            imm = ir.immediate;
            break;
        case LW:
            a = get_gp_register(ir.src1);
            imm = ir.immediate;
            break;
        case SW:
            a = get_gp_register(ir.src2);
            b = get_gp_register(ir.src1);
            imm = ir.immediate;
            break;

    }
    //set all SP registers to UNDEFINED
    int npc = get_sp_register(NPC, ID);
    sp_registers->clear_sp_registers(EXE);
    //set sp registers if no stall
    sp_registers->set_sp_register(NPC, EXE, npc);
    sp_registers->set_sp_register(A, EXE, a);
    sp_registers->set_sp_register(B, EXE, b);
    sp_registers->set_sp_register(IMM, EXE, imm);
    sp_registers->set_ir_register(ir, EXE);
}

void sim_pipe::execute() {
    //load instruction from pipeline sp registers
    instruction_t ir = sp_registers->get_ir_register(EXE);
    check_stall(EXE, ir);
    if (isStall(EXE)) {
        return;
    }
    if (ir.opcode == NOP) {
        //do not do anything during this stage (stall or start of program)
        sp_registers->clear_sp_registers(MEM);
        sp_registers->set_ir_register(ir, MEM);
        return;
    }
    if (ir.opcode == EOP) {
        sp_registers->clear_sp_registers(MEM);
        sp_registers->set_ir_register(ir, MEM);
        return;
    }
    //load other pipeline registers into temps
    int npc = sp_registers->get_sp_register(NPC, EXE);
    int a = (int) sp_registers->get_sp_register(A, EXE);
    unsigned b = sp_registers->get_sp_register(B, EXE);
    unsigned imm = sp_registers->get_sp_register(IMM, EXE);

    //compute output of alu
    unsigned aluoutput = alu(ir.opcode, a, b, imm, npc);
    //clear SP_registers if no stall
    sp_registers->clear_sp_registers(MEM);
    //set SP registers
    //Set ALU Output
    sp_registers->set_sp_register(ALU_OUTPUT, MEM, aluoutput);
    sp_registers->set_sp_register(B, MEM, b);
    //store output if a branch condition is meet in COND register
    switch (ir.opcode) {
        case ADD:
        case SUB:
        case XOR:
            break;
        case ADDI:
        case SUBI:
            break;
        case BEQZ:
            if (a == 0) {
                branchTaken(sp_registers);
            }
            break;
        case BNEZ:
            if (a != 0) {
                branchTaken(sp_registers);
            }
            break;
        case BLTZ:
            if (a < 0) {
                branchTaken(sp_registers);
            }
            break;
        case BGTZ:
            if (a > 0) {
                branchTaken(sp_registers);
            }
            break;
        case BLEZ:
            if (a <= 0) {
                branchTaken(sp_registers);
            }
            break;
        case BGEZ:
            if (a >= 0) {
                branchTaken(sp_registers);
            }
            //branch >= 0
            break;
        case JUMP:
            //branch must happen
            branchTaken(sp_registers);
            break;
        case LW:
        case SW:
            //send b over in case of store instr with value B
            sp_registers->set_sp_register(B, MEM, b);
            break;
        case NOP:
            break;
    }

    sp_registers->set_ir_register(ir, MEM);
}

void sim_pipe::memory() {
    //load instruction from pipeline sp registers
    instruction_t ir = sp_registers->get_ir_register(MEM);
    check_stall(MEM, ir);
    if (isStall(MEM)) {
        //ir cannot move to ID due to RAW hazard
        //stall untill ir with hazard is in WB stage
#if DEBUG
        printf("Stall Inserted at MEM \n");
#endif
        stall_inserted = true;
        instruction_t stall_ir;
        stall_ir.opcode = NOP;
        stall_ir.src1 = UNDEFINED;
        stall_ir.src2 = UNDEFINED;
        stall_ir.dest = UNDEFINED;
        stall_ir.immediate = UNDEFINED;
        sp_registers->clear_sp_registers(WB);
        sp_registers->set_ir_register(stall_ir, WB);
        return;
    }
    if (ir.opcode == NOP) {
        //do not do anything during this stage (stall or start of program)
        sp_registers->clear_sp_registers(WB);
        sp_registers->set_ir_register(ir, WB);
        return;
    }
    if (ir.opcode == EOP) {
        sp_registers->clear_sp_registers(WB);
        sp_registers->set_ir_register(ir, WB);
        return;
    }

    //load other pipeline registers into temps
    unsigned aluoutput = sp_registers->get_sp_register(ALU_OUTPUT, MEM);
    unsigned b = sp_registers->get_sp_register(B, MEM);
    unsigned cond = sp_registers->get_sp_register(COND, MEM);
    //clear SP_registers if no stall
    sp_registers->clear_sp_registers(WB);

    //set aluoutput for wb stage
    sp_registers->set_sp_register(ALU_OUTPUT, WB, aluoutput);
    sp_registers->set_sp_register(COND, WB, cond);

    switch (ir.opcode) {
        case SW:
            write_memory(aluoutput, b);
            break;
        case LW:
            unsigned lmd = load_memory(aluoutput);
            sp_registers->set_sp_register(LMD, WB, lmd);
            break;
    }
    sp_registers->set_ir_register(ir, WB);
}

void sim_pipe::writeback() {
    //load instruction from pipeline sp registers
    instruction_t ir = sp_registers->get_ir_register(WB);
    if (ir.opcode == NOP) {
        //do not do anything during this stage (stall or start of program)
        return;
    }
    if (ir.opcode == EOP) {
        //Program is finished
        running = false;
        return;
    }

    //load other pipeline registers into temps
    unsigned aluoutput = sp_registers->get_sp_register(ALU_OUTPUT, WB);
    unsigned lmd = sp_registers->get_sp_register(LMD, WB);

    //set change the register file to show new values
    switch (ir.opcode) {
        case LW:
            set_gp_register(ir.dest, lmd);
            break;
        case SW:
            break;
        case BEQZ:
        case BGEZ:
        case BGTZ:
        case BLEZ:
        case BLTZ:
        case BNEZ:
            break;
        default:
            set_gp_register(ir.dest, aluoutput);
    }
    check_stall(WB, ir);
    instructions_executed++;
}

/* reset the state of the pipeline simulator */
void sim_pipe::reset() {
    sp_registers = new sp_register();
    sp_registers->reset();

    registerFile = new unsigned[NUM_GP_REGISTERS];
    //clear gp registers
    for (int j = 0; j < NUM_GP_REGISTERS; ++j) {
        registerFile[j] = UNDEFINED;
    }
    //clear instruction memory
    for (int l = 0; l < PROGRAM_SIZE; ++l) {
        instr_memory[l].opcode = EOP;
        instr_memory[l].src1 = UNDEFINED;
        instr_memory[l].src2 = UNDEFINED;
        instr_memory[l].dest = UNDEFINED;
        instr_memory[l].immediate = UNDEFINED;
    }
    clock_cycles_executed = -1;
    instructions_executed = 0;
    stalls = 0;
    //clear data memory
    for (int i = 0; i < data_memory_size; ++i) {
        data_memory[i] = 0xFF;
    }
    running = false;
    end = false;
    //clear stalls
    for (int k = 0; k < NUM_STAGES; ++k) {
        stall[k].in_stall = false;
    }
    //clear latency array
    memset(latency, 0, sizeof(int));
    stall_inserted = false;

}


//return value of special purpose register
unsigned sim_pipe::get_sp_register(sp_register_t reg, stage_t s) {
    return sp_registers->get_sp_register(reg, s);
}


//returns value of general purpose register
int sim_pipe::get_gp_register(unsigned reg) {
    return registerFile[reg];
}

void sim_pipe::set_gp_register(unsigned reg, int value) {
    if (reg < NUM_GP_REGISTERS) {
        registerFile[reg] = value;
    }
}

float sim_pipe::get_IPC() {
    return (float) instructions_executed / (float) clock_cycles_executed; //please modify
}

unsigned sim_pipe::get_instructions_executed() {
    return instructions_executed;
}

unsigned sim_pipe::get_stalls() {
    return stalls;
}

unsigned sim_pipe::get_clock_cycles() {
    return clock_cycles_executed; //please modify
}

unsigned sim_pipe::load_memory(unsigned address) {
    unsigned a;
    memcpy(&a, data_memory + address, sizeof a);
    return a;
}

//uses state of pipeline to determine if any control, data, or structual hazards exist
//
void sim_pipe::check_stall(stage_t s, instruction_t ir) {
    instruction_t irEXE = sp_registers->get_ir_register(EXE);
    instruction_t irMEM = sp_registers->get_ir_register(MEM);
    instruction_t irWB = sp_registers->get_ir_register(WB);
    instruction_t irs[3] = {irEXE, irMEM, irWB};
    switch (s) {
        case IF:
            //check if branch is about to be executed
            //insert stalls to prevent issue with NPC being unknown
            if (ir.opcode == BEQZ || ir.opcode == BNEZ || ir.opcode == BLTZ || ir.opcode == BGTZ || ir.opcode == BLEZ ||
                ir.opcode == BGEZ || ir.opcode == JUMP) {
                //we must stall once for control hazard no Speculative execution in this simulation.
                stall[IF].in_stall = true;
                stall[IF].hazard_type = CONTROL;
                stall[IF].reg = ir.src1;
            }
            break;
        case ID:
            for (int j = 0; j < 3; ++j) {
                if ((irs[j].dest == ir.src1 || irs[j].dest == ir.src2) &&
                    (irs[j].opcode != NOP && irs[j].opcode != EOP && ir.opcode != NOP && ir.opcode != EOP &&
                     irs[j].dest != UNDEFINED)) {
                    stall[ID].in_stall = true;
                    stall[ID].hazard_type = RAW;
                    stall[ID].reg = irs[j].dest;
                }
            }
            break;
        case EXE:
            //check to make sure the MEM stage is avaliable otherwise stall
            //this only happens during an SW or LW operation
            if (irMEM.opcode == LW || irMEM.opcode == SW) {
                stall[EXE].in_stall = true;
                stall[EXE].hazard_type = STRUCTURAL;
                stall[EXE].reg = UNDEFINED;
            }
            if (latency[MEM] == 0) {
                //Memory is done, remove sturctural hazard
                stall[EXE].in_stall = false;
                stall[MEM].in_stall = false;
            }
            break;
        case MEM:
            if (ir.opcode == BEQZ || ir.opcode == BNEZ || ir.opcode == BLTZ || ir.opcode == BGTZ || ir.opcode == BLEZ ||
                ir.opcode == BGEZ || ir.opcode == JUMP) {
                stall[IF].in_stall = false;
                stall[IF].reg = UNDEFINED;
                //NPC is known
            }
            if ((ir.opcode == LW || ir.opcode == SW) && (!isStall(EXE))) {
                //LW or SW is just starting set total time exe needs to execute for
                latency[MEM] = data_memory_latency;
                stall[MEM].in_stall = true;
            } else if (ir.opcode == LW || ir.opcode == SW) {
                latency[MEM]--;
            }
            if (latency[MEM] == 0) {
                //Memory is done, remove sturctural hazard
                stall[EXE].in_stall = false;
                stall[MEM].in_stall = false;
            }
            break;
        case WB:
            for (int i = 0; i < NUM_STAGES; ++i) {
                if (stall[i].reg == ir.dest && stall[i].in_stall && stall[i].hazard_type != CONTROL) {
                    // stall no longer needs to be stalled as WB has written value
                    stall[i].in_stall = false;
                    stall[i].reg = UNDEFINED;
                }
            }
            //make sure there are no other instructions that need to be stalled
            for (int j = 0; j < 2; ++j) {
                if ((irs[j].dest == ir.dest) && (irs[j].dest == ir.src1 || irs[j].dest == ir.src2) &&
                    (irs[j].opcode != NOP && irs[j].opcode != EOP && ir.opcode != NOP && ir.opcode != EOP &&
                     irs[j].dest != UNDEFINED)) {
                    stall[ID].in_stall = true;
                    stall[ID].hazard_type = RAW;
                    stall[ID].reg = irs[j].dest;
                }
            }
            break;
    }
}

bool sim_pipe::isStall(stage_t s) {
    return stall[s].in_stall;
}
