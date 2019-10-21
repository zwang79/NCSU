#include "sim_pipe_fp.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <cstring>
#include <string>
#include <iomanip>
#include <map>

//NOTE: structural hazards on MEM/WB stage not handled
//====================================================

//#define DEBUG
//#define DEBUG_MEMORY

using namespace std;

//used for debugging purposes
static const char *reg_names[NUM_SP_REGISTERS] = {"PC", "NPC", "IR", "A", "B", "IMM", "COND", "ALU_OUTPUT", "LMD"};
static const char *stage_names[NUM_STAGES] = {"IF", "ID", "EX", "MEM", "WB"};
static const char *instr_names[NUM_OPCODES] = {"LW", "SW", "ADD", "ADDI", "SUB", "SUBI", "XOR", "BEQZ", "BNEZ", "BLTZ",
                                               "BGTZ", "BLEZ", "BGEZ", "JUMP", "EOP", "NOP", "LWS", "SWS", "ADDS",
                                               "SUBS", "MULTS", "DIVS"};
static const char *unit_names[4] = {"INTEGER", "ADDER", "MULTIPLIER", "DIVIDER"};

/* =============================================================

   HELPER FUNCTIONS

   ============================================================= */

/* convert a float into an unsigned */
inline unsigned float2unsigned(float value) {
    unsigned result;
    memcpy(&result, &value, sizeof value);
    return result;
}

/* convert an unsigned into a float */
inline float unsigned2float(unsigned value) {
    float result;
    memcpy(&result, &value, sizeof value);
    return result;
}

/* convert integer into array of unsigned char - little indian */
inline void unsigned2char(unsigned value, unsigned char *buffer) {
    buffer[0] = value & 0xFF;
    buffer[1] = (value >> 8) & 0xFF;
    buffer[2] = (value >> 16) & 0xFF;
    buffer[3] = (value >> 24) & 0xFF;
}

/* convert array of char into integer - little indian */
inline unsigned char2unsigned(unsigned char *buffer) {
    return buffer[0] + (buffer[1] << 8) + (buffer[2] << 16) + (buffer[3] << 24);
}

/* the following functions return the kind of the considered opcode */

bool is_branch(opcode_t opcode) {
    return (opcode == BEQZ || opcode == BNEZ || opcode == BLTZ || opcode == BLEZ || opcode == BGTZ || opcode == BGEZ ||
            opcode == JUMP);
}

bool is_memory(opcode_t opcode) {
    return (opcode == LW || opcode == SW || opcode == LWS || opcode == SWS);
}

bool is_int_r(opcode_t opcode) {
    return (opcode == ADD || opcode == SUB || opcode == XOR);
}

bool is_int_imm(opcode_t opcode) {
    return (opcode == ADDI || opcode == SUBI);
}

bool is_int_alu(opcode_t opcode) {
    return (is_int_r(opcode) || is_int_imm(opcode));
}

bool is_fp_alu(opcode_t opcode) {
    return (opcode == ADDS || opcode == SUBS || opcode == MULTS || opcode == DIVS);
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
        case LWS:
        case SWS:
            return (a + imm);
        case BEQZ:
        case BNEZ:
        case BGTZ:
        case BGEZ:
        case BLTZ:
        case BLEZ:
        case JUMP:
            return (npc + imm);
        case ADDS:
            return (float2unsigned(unsigned2float(a) + unsigned2float(b)));
            break;
        case SUBS:
            return (float2unsigned(unsigned2float(a) - unsigned2float(b)));
            break;
        case MULTS:
            return (float2unsigned(unsigned2float(a) * unsigned2float(b)));
            break;
        case DIVS:
            return (float2unsigned(unsigned2float(a) / unsigned2float(b)));
            break;
        default:
            return (-1);
    }
}

/* =============================================================

   CODE PROVIDED - NO NEED TO MODIFY FUNCTIONS BELOW

   ============================================================= */

/* ============== primitives to allocate/free the simulator ================== */

sim_pipe_fp::sim_pipe_fp(unsigned mem_size, unsigned mem_latency) {
    data_memory_size = mem_size;
    data_memory_latency = mem_latency;
    data_memory = new unsigned char[data_memory_size];
    num_units = 0;
    reset();
}

sim_pipe_fp::~sim_pipe_fp() {
    delete[] data_memory;
    delete registerFile;
    delete sp_registers;
}

/* =============   primitives to print out the content of the memory & registers and for writing to memory ============== */

void sim_pipe_fp::print_memory(unsigned start_address, unsigned end_address) {
    cout << "data_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8)
         << setfill('0') << end_address << "]" << endl;
    for (unsigned i = start_address; i < end_address; i++) {
        if (i % 4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": ";
        cout << hex << setw(2) << setfill('0') << int(data_memory[i]) << " ";
        if (i % 4 == 3) {
#ifdef DEBUG_MEMORY
            unsigned u = char2unsigned(&data_memory[i-3]);
            cout << " - unsigned=" << u << " - float=" << unsigned2float(u);
#endif
            cout << endl;
        }
    }
}

void sim_pipe_fp::write_memory(unsigned address, unsigned value) {
    unsigned2char(value, data_memory + address);
}

void sim_pipe_fp::write_memory_fp(unsigned address, float value) {
    unsigned2char(value, data_memory + address);
}

void sim_pipe_fp::print_registers() {
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
        if (get_int_register(i) != (int) UNDEFINED)
            cout << "R" << dec << i << " = " << get_int_register(i) << hex << " / 0x" << get_int_register(i) << endl;
    for (i = 0; i < NUM_GP_REGISTERS; i++)
        if (get_fp_register(i) != UNDEFINED)
            cout << "F" << dec << i << " = " << get_fp_register(i) << hex << " / 0x"
                 << float2unsigned(get_fp_register(i)) << endl;
}


/* =============   primitives related to the functional units ============== */

/* initializes an execution unit */
void sim_pipe_fp::init_exec_unit(exe_unit_t exec_unit, unsigned latency, unsigned instances) {
    for (unsigned i = 0; i < instances; i++) {
        exec_units[num_units].type = exec_unit;
        exec_units[num_units].latency = latency;
        exec_units[num_units].busy = 0;
        exec_units[num_units].instruction.opcode = NOP;
        num_units++;
    }
}

/* returns a free unit for that particular operation or UNDEFINED if no unit is currently available */
unsigned sim_pipe_fp::get_free_unit(opcode_t opcode) {
    if (num_units == 0) {
        cout << "ERROR:: simulator does not have any execution units!\n";
        exit(-1);
    }
    for (unsigned u = 0; u < num_units; u++) {
        switch (opcode) {
            //Integer unit
            case LW:
            case SW:
            case ADD:
            case ADDI:
            case SUB:
            case SUBI:
            case XOR:
            case BEQZ:
            case BNEZ:
            case BLTZ:
            case BGTZ:
            case BLEZ:
            case BGEZ:
            case JUMP:
            case LWS:
            case SWS:
                if (exec_units[u].type == INTEGER && exec_units[u].busy == 0) return u;
                break;
                // FP adder
            case ADDS:
            case SUBS:
                if (exec_units[u].type == ADDER && exec_units[u].busy == 0) return u;
                break;
                // Multiplier
            case MULTS:
                if (exec_units[u].type == MULTIPLIER && exec_units[u].busy == 0) return u;
                break;
                // Divider
            case DIVS:
                if (exec_units[u].type == DIVIDER && exec_units[u].busy == 0) return u;
                break;
            default:
                //cout << "ERROR:: operations not requiring exec unit!\n";
                // exit(-1);
                break;
        }
    }
    return UNDEFINED;
}

/* decrease the amount of clock cycles during which the functional unit will be busy - to be called at each clock cycle  */
void sim_pipe_fp::decrement_units_busy_time() {
    for (unsigned u = 0; u < num_units; u++) {
        if (exec_units[u].busy > 0) exec_units[u].busy--;
    }
}


/* prints out the status of the functional units */
void sim_pipe_fp::debug_units() {
    for (unsigned u = 0; u < num_units; u++) {
        cout << " -- unit " << unit_names[exec_units[u].type] << " latency=" << exec_units[u].latency << " busy="
             << exec_units[u].busy <<
             " instruction=" << instr_names[exec_units[u].instruction.opcode] << endl;
    }
}

/* ========= end primitives related to functional units ===============*/


/* ========================parser ==================================== */

void sim_pipe_fp::load_program(const char *filename, unsigned base_address) {

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
            case ADDS:
            case SUBS:
            case MULTS:
            case DIVS:
                par1 = strtok(NULL, " \t");
                par2 = strtok(NULL, " \t");
                par3 = strtok(NULL, " \t");
                instr_memory[instruction_nr].dest = atoi(strtok(par1, "RF"));
                instr_memory[instruction_nr].src1 = atoi(strtok(par2, "RF"));
                instr_memory[instruction_nr].src2 = atoi(strtok(par3, "RF"));
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
            case LWS:
                par1 = strtok(NULL, " \t");
                par2 = strtok(NULL, " \t");
                instr_memory[instruction_nr].dest = atoi(strtok(par1, "RF"));
                instr_memory[instruction_nr].immediate = strtoul(strtok(par2, "()"), NULL, 0);
                instr_memory[instruction_nr].src1 = atoi(strtok(NULL, "R"));
                break;
            case SW:
            case SWS:
                par1 = strtok(NULL, " \t");
                par2 = strtok(NULL, " \t");
                instr_memory[instruction_nr].src1 = atoi(strtok(par1, "RF"));
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

/* =============================================================

   CODE TO BE COMPLETED

   ============================================================= */
string getOpcodeString(opcode_t op) {
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
        case LWS:
            return "LWS";
        case SWS:
            return "SWS";
        case ADDS:
            return "ADDS";
        case SUBS:
            return "SUBS";
        case MULTS:
            return "MULTS";
        case DIVS:
            return "DIVS";
    }
}

inline void branchTaken(sp_register_fp *sp_registers) {
    //branch taken
    sp_registers->set_sp_register(COND, MEM, 1);
}

/* simulator */
void sim_pipe_fp::run(unsigned cycles) {
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

        decrement_units_busy_time();
        if (stall_inserted) {
            stall_inserted = false;
            stalls++;
        }
        clock_cycles_executed += 1;
        if (!running && cycles > 0) { cycles--; }
        //advance pipeline if no stalls are encountered

    }
}

void sim_pipe_fp::fetch() {
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
    if (isStall(ID) || isStall(EXE) || isStall(MEM)) {
        //stops instructions from being loaded into the pipeline
        stall_inserted = true;
        return;
    }
    check_stall(ID, ir);
    if(isStall(EXE) && stall[EXE].hazard_type == WAW) {
#if DEBUG
        printf("Stall Inserted at IF on WAW HAZARD \n");
#endif
        stall_inserted = true;
        return;
    }
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

void sim_pipe_fp::decode() {
    //load instruction from pipeline sp registers
    instruction_t ir = sp_registers->get_ir_register(ID);
    //load registers from memory if needed
    //use IR to control what A and B are loaded with
    unsigned a = UNDEFINED;
    unsigned b = UNDEFINED;
    unsigned imm = UNDEFINED;
    if (isStall(MEM)) {
        return;
    }
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
    check_stall(EXE, ir);
    if (isStall(EXE)) {
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
            a = get_int_register(ir.src1);
            b = get_int_register(ir.src2);
            break;
        case ADDI:
        case SUBI:
            a = get_int_register(ir.src1);
            imm = ir.immediate;
            break;
        case BEQZ:
        case BNEZ:
        case BLTZ:
        case BGTZ:
        case BLEZ:
        case BGEZ:
        case JUMP:
            a = get_int_register(ir.src1);
            imm = ir.immediate;
            break;
        case LW:
            a = get_int_register(ir.src1);
            imm = ir.immediate;
            break;
        case SW:
            a = get_int_register(ir.src2);
            b = get_int_register(ir.src1);
            imm = ir.immediate;
            break;
        case LWS:
            a = get_int_register(ir.src1);
            imm = ir.immediate;
            break;
        case SWS:
            b = float2unsigned(get_fp_register(ir.src1));
            a = get_int_register(ir.src2);
            imm = ir.immediate;
            break;
        case ADDS:
        case SUBS:
        case MULTS:
        case DIVS:
            a = float2unsigned(get_fp_register(ir.src1));
            b = float2unsigned(get_fp_register(ir.src2));
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

void sim_pipe_fp::execute() {
    //load instruction from pipeline sp registers

    instruction_t ir = sp_registers->get_ir_register(EXE);
    check_stall(EXE, ir);
#if DEBUG
    debug_units();
#endif
    if (isStall(MEM)) {
        return;
    }

    if (ir.opcode == NOP || ir.opcode == EOP) {
        //do not do anything during this stage (stall or start of program)
        bool exe_units_done = true;
        for (int i = 0; i < num_units; ++i) {
            if(exec_units[i].busy !=0){
                exe_units_done = false;
            }
        }
        if(exe_units_done) {
            sp_registers->clear_sp_registers(MEM);
            sp_registers->set_ir_register(ir, MEM);
        } else {
            instruction_t stall_ir;
            stall_ir.opcode = NOP;
            stall_ir.src1 = UNDEFINED;
            stall_ir.src2 = UNDEFINED;
            stall_ir.dest = UNDEFINED;
            stall_ir.immediate = UNDEFINED;
            sp_registers->clear_sp_registers(MEM);
            sp_registers->set_ir_register(stall_ir, MEM);
        }
    } else if (!isStall(EXE)) {
        // set execution unit if available
        int unit = get_free_unit(ir.opcode);
        exec_units[unit].busy = exec_units[unit].latency;
        exec_units[unit].instruction = ir;
        exec_units[unit].npc = sp_registers->get_sp_register(NPC, EXE);
        exec_units[unit].a = sp_registers->get_sp_register(A, EXE);
        exec_units[unit].b = sp_registers->get_sp_register(B, EXE);
        exec_units[unit].imm = sp_registers->get_sp_register(IMM, EXE);
        //by default set the next mem instruction to NOP unless something finishes from the execution units
        instruction_t stall_ir;
        stall_ir.opcode = NOP;
        stall_ir.src1 = UNDEFINED;
        stall_ir.src2 = UNDEFINED;
        stall_ir.dest = UNDEFINED;
        stall_ir.immediate = UNDEFINED;
        sp_registers->clear_sp_registers(MEM);
        sp_registers->set_ir_register(stall_ir, MEM);
#if DEBUG
        printf("New Unit set \n");
        debug_units();
#endif
    }

    //read results of instructions executing in exe units before writing new instructions to them
    for (int i = 0; i < num_units; ++i) {
        unit_t unit = exec_units[i];
        if (unit.busy == 0 && unit.instruction.opcode != NOP) {
            //instruction is done but can it move ahead in the pipeline?
            checkWAW(i, unit,unit.instruction);
            if (!(isStall(EXE) && stall[EXE].hazard_type == WAW)) {
                sp_registers->clear_sp_registers(EXE);
                unsigned aluoutput = alu(unit.instruction.opcode, unit.a, unit.b, unit.imm, unit.npc);
                if (!(is_fp_alu(unit.instruction.opcode))) {

                    execute_integer(unit.instruction, unit.a, unit.b, aluoutput);
                } else {
                    //clear SP_registers if no stall
                    sp_registers->clear_sp_registers(MEM);
                    //set SP registers
                    //Set ALU Output
                    sp_registers->set_sp_register(ALU_OUTPUT, MEM, aluoutput);
                    sp_registers->set_sp_register(B, MEM, unit.b);
                    sp_registers->set_ir_register(unit.instruction, MEM);
                }
                instruction_t stall_ir;
                stall_ir.opcode = NOP;
                stall_ir.src1 = UNDEFINED;
                stall_ir.src2 = UNDEFINED;
                stall_ir.dest = UNDEFINED;
                stall_ir.immediate = UNDEFINED;
                exec_units[i].instruction = stall_ir;
            }
        }
    }
}

void sim_pipe_fp::checkWAW(int i, const unit_t &unit, instruction_t ir) {
    for (int j = 0; j < num_units; ++j) {
                unit_t unit2 = exec_units[j];
                if (i != j) {
                    if (ir.dest == unit2.instruction.dest
                        && ir.dest != UNDEFINED
                        && (unit2.instruction.opcode != NOP && unit2.instruction.opcode != EOP &&
                            unit2.instruction.opcode != NOP && unit2.instruction.opcode != EOP &&
                            unit2.instruction.dest != UNDEFINED)
                        && ((is_fp_alu(unit2.instruction.opcode) && is_fp_alu(ir.opcode)) ||
                            (!is_fp_alu(ir.opcode) && !is_fp_alu(unit2.instruction.opcode)))
                        && unit.latency < unit2.busy && ir.inum > unit2.instruction.inum) {
                        //WAW
                        stall[EXE].in_stall = true;
                        stall[EXE].hazard_type = WAW;
                        stall[EXE].reg = ir.dest;
                    } else if(isStall(EXE) && stall[EXE].hazard_type == WAW && unit.latency > unit2.busy &&
                            ir.dest == stall[EXE].reg && unit2.instruction.dest == stall[EXE].reg && stall[EXE].reg != UNDEFINED
                            && ir.inum > unit2.instruction.inum) {
                        //long latency unit is done and there are not other WAW hazards occurring
                        stall[EXE].in_stall = false;
                        stall[EXE].reg = UNDEFINED;
                    }
                }
            }
}

void
sim_pipe_fp::execute_integer(const instruction_t &ir, unsigned int a, unsigned int b, unsigned int aluoutput) const {
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
            if ((int) a == 0) {
                branchTaken(sp_registers);
            }
            break;
        case BNEZ:
            if ((int) a != 0) {
                branchTaken(sp_registers);
            }
            break;
        case BLTZ:
            if ((int) a < 0) {
                branchTaken(sp_registers);
            }
            break;
        case BGTZ:
            if ((int) a > 0) {
                branchTaken(sp_registers);
            }
            break;
        case BLEZ:
            if ((int) a <= 0) {
                branchTaken(sp_registers);
            }
            break;
        case BGEZ:
            if ((int) a >= 0) {
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
        case LWS:
        case SWS:
            //send b over in case of store instr with value B
            sp_registers->set_sp_register(B, MEM, b);
            break;
        case NOP:
            break;
    }
    sp_registers->set_ir_register(ir, MEM);
}

void sim_pipe_fp::memory() {
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
        case SWS:
            write_memory_fp(aluoutput, b);
            break;
        case LW:
        case LWS:
            unsigned lmd = load_memory(aluoutput);
            sp_registers->set_sp_register(LMD, WB, lmd);
            break;
    }
    sp_registers->set_ir_register(ir, WB);
}

void sim_pipe_fp::writeback() {
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
            set_int_register(ir.dest, lmd);
            break;
        case LWS:
            set_fp_register(ir.dest, unsigned2float(lmd));
        case SW:
            break;
        case SWS:
            break;
        case BEQZ:
        case BGEZ:
        case BGTZ:
        case BLEZ:
        case BLTZ:
        case BNEZ:
            break;
        case ADDS:
        case SUBS:
        case DIVS:
        case MULTS:
            set_fp_register(ir.dest, unsigned2float(aluoutput));
            break;
        default:
            set_int_register(ir.dest, aluoutput);
    }
    check_stall(WB, ir);
    instructions_executed++;
}

//reset the state of the sim_pipe_fp simulator
void sim_pipe_fp::reset() {
    sp_registers = new sp_register_fp();
    sp_registers->reset();

    registerFile = new unsigned[NUM_GP_REGISTERS];
    registerFile_fp = new unsigned[NUM_GP_REGISTERS];

    //clear gp registers
    for (int j = 0; j < NUM_GP_REGISTERS; ++j) {
        registerFile[j] = UNDEFINED;
    }
    for (int j = 0; j < NUM_GP_REGISTERS; ++j) {
        registerFile_fp[j] = UNDEFINED;
    }
    //clear instruction memory
    for (int l = 0; l < PROGRAM_SIZE; ++l) {
        instr_memory[l].opcode = EOP;
        instr_memory[l].src1 = UNDEFINED;
        instr_memory[l].src2 = UNDEFINED;
        instr_memory[l].dest = UNDEFINED;
        instr_memory[l].immediate = UNDEFINED;
        instr_memory[l].inum = l;
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

    //make sure exec_units are initalized properly
    for (int m = 0; m < num_units; ++m) {
        exec_units[m].busy = 0;
    }
}

//return value of special purpose register
unsigned sim_pipe_fp::get_sp_register(sp_register_t reg, stage_t s) {
    return sp_registers->get_sp_register(reg, s); // please modify
}

int sim_pipe_fp::get_int_register(unsigned reg) {
    return registerFile[reg];
}

void sim_pipe_fp::set_int_register(unsigned reg, int value) {
    if (reg < NUM_GP_REGISTERS) {
        registerFile[reg] = value;
    }
}

float sim_pipe_fp::get_fp_register(unsigned reg) {
    if (registerFile_fp[reg] == UNDEFINED) {
        return UNDEFINED;
    }
    return unsigned2float(registerFile_fp[reg]); // please modify
}

void sim_pipe_fp::set_fp_register(unsigned reg, float value) {
    registerFile_fp[reg] = float2unsigned(value);
}


float sim_pipe_fp::get_IPC() {
    return (float) instructions_executed / (float) clock_cycles_executed;
}

unsigned sim_pipe_fp::get_instructions_executed() {
    return instructions_executed;
}

unsigned sim_pipe_fp::get_clock_cycles() {
    return clock_cycles_executed; // please modify
}

unsigned sim_pipe_fp::get_stalls() {
    return stalls; // please modify
}

unsigned sim_pipe_fp::load_memory(unsigned address) {
    unsigned a;
    memcpy(&a, data_memory + address, sizeof a);
    return a;
}

//uses state of pipeline to determine if any control, data, or structual hazards exist
//
void sim_pipe_fp::check_stall(stage_t s, instruction_t ir) {
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
                if ((irs[j].dest == ir.src1 || irs[j].dest == ir.src2)
                    && (irs[j].opcode != NOP && irs[j].opcode != EOP && ir.opcode != NOP && ir.opcode != EOP &&
                        irs[j].dest != UNDEFINED)
                    && ((is_fp_alu(ir.opcode) && is_fp_alu(irs[j].opcode)) ||
                        (!is_fp_alu(ir.opcode) && !is_fp_alu(irs[j].opcode)) ||
                        (is_fp_alu(ir.opcode) && irs[j].opcode == LWS))
                    && (!(is_branch(irs[j].opcode) && ir.opcode == LWS) &&
                        !(is_branch(ir.opcode) && irs[j].opcode == LWS))) {
                    stall[ID].in_stall = true;
                    stall[ID].hazard_type = RAW;
                    stall[ID].reg = irs[j].dest;
                }
            }
            break;
        case EXE:
            //check to make sure the MEM stage is available otherwise stall
            //this only happens during an SW or LW operation
            if (is_memory(ir.opcode)) {
                stall[EXE].in_stall = true;
                stall[EXE].hazard_type = STRUCTURAL;
                stall[EXE].reg = UNDEFINED;
            }
            if (latency[MEM] == 0 ) {
                //Memory is done, remove structural hazard
                if(stall[EXE].hazard_type != WAW){
                    stall[EXE].in_stall = false;
                }
                stall[MEM].in_stall = false;
            } else if (stall[EXE].in_stall && get_free_unit(ir.opcode) != UNDEFINED && stall[EXE].hazard_type == STRUCTURAL) {
                stall[EXE].in_stall = false;
            }

            //check to make sure a execution unit is available in the Exe stage to run this ir
            //if the execution unit is available check for WAW
            if (get_free_unit(ir.opcode) == UNDEFINED && ir.opcode != NOP && ir.opcode != EOP) {
                stall[EXE].in_stall = true;
                stall[EXE].hazard_type = STRUCTURAL;
                stall[EXE].reg = UNDEFINED;
            } else {
                checkWAW(get_free_unit(ir.opcode), exec_units[get_free_unit(ir.opcode)], ir);
            }
            break;
        case MEM:
            if (ir.opcode == BEQZ || ir.opcode == BNEZ || ir.opcode == BLTZ || ir.opcode == BGTZ || ir.opcode == BLEZ ||
                ir.opcode == BGEZ || ir.opcode == JUMP) {
                stall[IF].in_stall = false;
                stall[IF].reg = UNDEFINED;
                //NPC is known
            }
            if ((is_memory(ir.opcode)) && (!isStall(MEM))) {
                //LW or SW is just starting set total time exe needs to execute for
                latency[MEM] = data_memory_latency;
                stall[MEM].in_stall = true;
            } else if (is_memory(ir.opcode)) {
                latency[MEM]--;
            }
            if (latency[MEM] == 0) {
                //Memory is done, remove structural hazard
                stall[EXE].in_stall = false;
                stall[MEM].in_stall = false;
            }
            break;
        case WB:
            for (int i = 0; i < NUM_STAGES; ++i) {
                if (stall[i].reg == ir.dest && stall[i].in_stall && stall[i].hazard_type == RAW) {
                    // stall no longer needs to be stalled as WB has written value
                    stall[i].in_stall = false;
                    stall[i].reg = UNDEFINED;
                }
            }
            //make sure there are no other instructions that need to be stalled
            for (int j = 0; j < 2; ++j) {
                if ((irs[j].dest == ir.src1 || irs[j].dest == ir.src2)
                    && (irs[j].opcode != NOP && irs[j].opcode != EOP && ir.opcode != NOP && ir.opcode != EOP &&
                        irs[j].dest != UNDEFINED)
                    && ((is_fp_alu(ir.opcode) && is_fp_alu(irs[j].opcode)) ||
                        (!is_fp_alu(ir.opcode) && !is_fp_alu(irs[j].opcode)) ||
                        (is_fp_alu(ir.opcode) && irs[j].opcode == LWS))
                    && (!(is_branch(irs[j].opcode) && ir.opcode == LWS) &&
                        !(is_branch(ir.opcode) && irs[j].opcode == LWS))) {
                    stall[ID].in_stall = true;
                    stall[ID].hazard_type = RAW;
                    stall[ID].reg = irs[j].dest;
                }
            }
            break;
    }
}

bool sim_pipe_fp::isStall(stage_t s) {
    return stall[s].in_stall;
}
