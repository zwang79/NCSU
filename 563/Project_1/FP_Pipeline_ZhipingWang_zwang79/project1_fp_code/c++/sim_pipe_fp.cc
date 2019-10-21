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
static const char *instr_names[NUM_OPCODES] = {"LW", "SW", "ADD", "ADDI", "SUB", "SUBI", "XOR", "BEQZ", "BNEZ", "BLTZ", "BGTZ", "BLEZ", "BGEZ", "JUMP", "EOP", "NOP", "LWS", "SWS", "ADDS", "SUBS", "MULTS", "DIVS"};
static const char *unit_names[4]={"INTEGER", "ADDER", "MULTIPLIER", "DIVIDER"};

/* =============================================================

   HELPER FUNCTIONS

   ============================================================= */

/* convert a float into an unsigned */
inline unsigned float2unsigned(float value){
	unsigned result;
	memcpy(&result, &value, sizeof value);
	return result;
}

/* convert an unsigned into a float */
inline float unsigned2float(unsigned value){
	float result;
	memcpy(&result, &value, sizeof value);
	return result;
}

/* convert integer into array of unsigned char - little indian */
inline void unsigned2char(unsigned value, unsigned char *buffer){
        buffer[0] = value & 0xFF;
        buffer[1] = (value >> 8) & 0xFF;
        buffer[2] = (value >> 16) & 0xFF;
        buffer[3] = (value >> 24) & 0xFF;
}

/* convert array of char into integer - little indian */
inline unsigned char2unsigned(unsigned char *buffer){
       return buffer[0] + (buffer[1] << 8) + (buffer[2] << 16) + (buffer[3] << 24);
}

/* the following functions return the kind of the considered opcode */

bool is_branch(opcode_t opcode){
	return (opcode == BEQZ || opcode == BNEZ || opcode == BLTZ || opcode == BLEZ || opcode == BGTZ || opcode == BGEZ || opcode == JUMP);
}

bool is_memory(opcode_t opcode){
        return (opcode == LW || opcode == SW || opcode == LWS || opcode == SWS);
}

bool is_int_r(opcode_t opcode){
        return (opcode == ADD || opcode == SUB || opcode == XOR);
}

bool is_int_imm(opcode_t opcode){
        return (opcode == ADDI || opcode == SUBI);
}

bool is_int_alu(opcode_t opcode){
        return (is_int_r(opcode) || is_int_imm(opcode));
}

bool is_fp_alu(opcode_t opcode){
        return (opcode == ADDS || opcode == SUBS || opcode == MULTS || opcode == DIVS);
}

/* implements the ALU operations */
unsigned alu(unsigned opcode, unsigned a, unsigned b, unsigned imm, unsigned npc){
	switch(opcode){
			case ADD:
				return (a+b);
			case ADDI:
				return(a+imm);
			case SUB:
				return(a-b);
			case SUBI:
				return(a-imm);
			case XOR:
				return(a ^ b);
			case LW:
			case SW:
			case LWS:
			case SWS:
				return(a + imm);
			case BEQZ:
			case BNEZ:
			case BGTZ:
			case BGEZ:
			case BLTZ:
			case BLEZ:
			case JUMP:
				return(npc+imm);
			case ADDS:
				return(float2unsigned(unsigned2float(a)+unsigned2float(b)));
				break;
			case SUBS:
				return(float2unsigned(unsigned2float(a)-unsigned2float(b)));
				break;
			case MULTS:
				return(float2unsigned(unsigned2float(a)*unsigned2float(b)));
				break;
			case DIVS:
				return(float2unsigned(unsigned2float(a)/unsigned2float(b)));
				break;
			default:	
				return (-1);
	}
}

/* =============================================================

   CODE PROVIDED - NO NEED TO MODIFY FUNCTIONS BELOW

   ============================================================= */

/* ============== primitives to allocate/free the simulator ================== */

sim_pipe_fp::sim_pipe_fp(unsigned mem_size, unsigned mem_latency){
	data_memory_size = mem_size;
	data_memory_latency = mem_latency;
	data_memory = new unsigned char[data_memory_size];
	num_units = 0;
	fill_n(data_memory, data_memory_size, 0xFF);
	mem_structual_stalls    = data_memory_latency; // set initial structual stall
	reset();
}
	
sim_pipe_fp::~sim_pipe_fp(){
	delete [] data_memory;
}

/* =============   primitives to print out the content of the memory & registers and for writing to memory ============== */ 

void sim_pipe_fp::print_memory(unsigned start_address, unsigned end_address){
	cout << "data_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8) << setfill('0') <<  end_address << "]" << endl;
	for (unsigned i=start_address; i<end_address; i++){
		if (i%4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": "; 
		cout << hex << setw(2) << setfill('0') << int(data_memory[i]) << " ";
		if (i%4 == 3){
#ifdef DEBUG_MEMORY 
			unsigned u = char2unsigned(&data_memory[i-3]);
			cout << " - unsigned=" << u << " - float=" << unsigned2float(u);
#endif
			cout << endl;
		}
	} 
}

void sim_pipe_fp::write_memory(unsigned address, unsigned value){
	unsigned2char(value,data_memory+address);
}

unsigned sim_pipe_fp::read_memory(unsigned address){
   unsigned value = 0;
   value |= data_memory[address + 0];
   value |= data_memory[address + 1] << 8;  
   value |= data_memory[address + 2] << 16;
   value |= data_memory[address + 3] << 24;
   return value;
}

void sim_pipe_fp::print_registers(){
        cout << "Special purpose registers:" << endl;
        unsigned i, s;
        for (s=0; s<NUM_STAGES; s++){
                cout << "Stage: " << stage_names[s] << endl;
                for (i=0; i< NUM_SP_REGISTERS; i++)
                        if ((sp_register_t)i != IR && (sp_register_t)i != COND && get_sp_register((sp_register_t)i, (stage_t)s)!=UNDEFINED) cout << reg_names[i] << " = " << dec <<  get_sp_register((sp_register_t)i, (stage_t)s) << hex << " / 0x" << get_sp_register((sp_register_t)i, (stage_t)s) << endl;
        }
        cout << "General purpose registers:" << endl;
        for (i=0; i< NUM_GP_REGISTERS; i++)
                if (get_int_register(i)!=(int)UNDEFINED) cout << "R" << dec << i << " = " << get_int_register(i) << hex << " / 0x" << get_int_register(i) << endl;
        for (i=0; i< NUM_GP_REGISTERS; i++)
                if (get_fp_register(i)!=UNDEFINED) cout << "F" << dec << i << " = " << get_fp_register(i) << hex << " / 0x" << float2unsigned(get_fp_register(i)) << endl;
}


/* =============   primitives related to the functional units ============== */ 

/* initializes an execution unit */ 
void sim_pipe_fp::init_exec_unit(exe_unit_t exec_unit, unsigned latency, unsigned instances){
	for (unsigned i=0; i<instances; i++){
		exec_units[num_units].type = exec_unit;
		exec_units[num_units].latency = latency;
		exec_units[num_units].busy = 0;
		exec_units[num_units].instruction.opcode = NOP;
		num_units++;
	}
}

/* returns a free unit for that particular operation or UNDEFINED if no unit is currently available */
unsigned sim_pipe_fp::get_free_unit(opcode_t opcode){
	if (num_units == 0){
		cout << "ERROR:: simulator does not have any execution units!\n";
		exit(-1);
	}
	for (unsigned u=0; u<num_units; u++){
		switch(opcode){
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
				if (exec_units[u].type==INTEGER && exec_units[u].busy==0) return u;
				break;
			// FP adder
			case ADDS:
			case SUBS:
				if (exec_units[u].type==ADDER && exec_units[u].busy==0) return u;
				break;
			// Multiplier
			case MULTS:
				if (exec_units[u].type==MULTIPLIER && exec_units[u].busy==0) return u;
				break;
			// Divider
			case DIVS:
				if (exec_units[u].type==DIVIDER && exec_units[u].busy==0) return u;
				break;
			default:
				//cout << "ERROR:: operations not requiring exec unit!\n";
				return UNDEFINED;
				break;

		}
	}
	return UNDEFINED;
}

/* returns required exec unit type */
unsigned sim_pipe_fp::get_exe_unit_type(opcode_t opcode){
	for (unsigned u=0; u<num_units; u++){
		switch(opcode){
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
				return INTEGER;
				break;
			// FP adder
			case ADDS:
			case SUBS:
				return ADDER;
				break;
			// Multiplier
			case MULTS:
				return MULTIPLIER;
				break;
			// Divider
			case DIVS:
				return DIVIDER;
				break;
			default:
				cout << "ERROR:: operations not requiring exec unit!\n";
				return UNDEFINED;
				break;
		}
	}
	return UNDEFINED;
}

/* decrease the amount of clock cycles during which the functional unit will be busy - to be called at each clock cycle  */
void sim_pipe_fp::decrement_units_busy_time(){
	for (unsigned u=0; u<num_units; u++){
		if (exec_units[u].busy > 0) exec_units[u].busy --;
	}
}


/* prints out the status of the functional units */
void sim_pipe_fp::debug_units(){
	for (unsigned u=0; u<num_units; u++){
		cout << " -- unit " << unit_names[exec_units[u].type] << " latency=" << exec_units[u].latency << " busy=" << exec_units[u].busy <<
			" instruction=" << instr_names[exec_units[u].instruction.opcode] << endl;
	}
}

/* ========= end primitives related to functional units ===============*/


/* ========================parser ==================================== */

void sim_pipe_fp::load_program(const char *filename, unsigned base_address){

   /* initializing the base instruction address */
   instr_base_address = base_address;

   /* creating a map with the valid opcodes and with the valid labels */
   map<string, opcode_t> opcodes; //for opcodes
   map<string, unsigned> labels;  //for branches
   for (int i=0; i<NUM_OPCODES; i++)
	 opcodes[string(instr_names[i])]=(opcode_t)i;

   /* opening the assembly file */
   ifstream fin(filename, ios::in | ios::binary);
   if (!fin.is_open()) {
      cerr << "error: open file " << filename << " failed!" << endl;
      exit(-1);
   }

   /* parsing the assembly file line by line */
   string line;
   unsigned instruction_nr = 0;
   while (getline(fin,line)){

	// set the instruction field
	char *str = const_cast<char*>(line.c_str());

  	// tokenize the instruction
	char *token = strtok (str," \t");
	map<string, opcode_t>::iterator search = opcodes.find(token);
        if (search == opcodes.end()){
		// this is a label for a branch - extract it and save it in the labels map
		string label = string(token).substr(0, string(token).length() - 1);
		labels[label]=instruction_nr;
                // move to next token, which must be the instruction opcode
		token = strtok (NULL, " \t");
		search = opcodes.find(token);
		if (search == opcodes.end()) cout << "ERROR: invalid opcode: " << token << " !" << endl;
	}
	instr_memory[instruction_nr].opcode = search->second;

	//reading remaining parameters
	char *par1;
	char *par2;
	char *par3;
	switch(instr_memory[instruction_nr].opcode){
		case ADD:
		case SUB:
		case XOR:
		case ADDS:
		case SUBS:
		case MULTS:
		case DIVS:
			par1 = strtok (NULL, " \t");
			par2 = strtok (NULL, " \t");
			par3 = strtok (NULL, " \t");
			instr_memory[instruction_nr].dest = atoi(strtok(par1, "RF"));
			instr_memory[instruction_nr].src1 = atoi(strtok(par2, "RF"));
			instr_memory[instruction_nr].src2 = atoi(strtok(par3, "RF"));
			break;
		case ADDI:
		case SUBI:
			par1 = strtok (NULL, " \t");
			par2 = strtok (NULL, " \t");
			par3 = strtok (NULL, " \t");
			instr_memory[instruction_nr].dest = atoi(strtok(par1, "R"));
			instr_memory[instruction_nr].src1 = atoi(strtok(par2, "R"));
			instr_memory[instruction_nr].immediate = strtoul (par3, NULL, 0); 
			break;
		case LW:
		case LWS:
			par1 = strtok (NULL, " \t");
			par2 = strtok (NULL, " \t");
			instr_memory[instruction_nr].dest = atoi(strtok(par1, "RF"));
			instr_memory[instruction_nr].immediate = strtoul(strtok(par2, "()"), NULL, 0);
			instr_memory[instruction_nr].src1 = atoi(strtok(NULL, "R"));
			break;
		case SW:
		case SWS:
			par1 = strtok (NULL, " \t");
			par2 = strtok (NULL, " \t");
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
			par1 = strtok (NULL, " \t");
			par2 = strtok (NULL, " \t");
			instr_memory[instruction_nr].src1 = atoi(strtok(par1, "R"));
			instr_memory[instruction_nr].label = par2;
			break;
		case JUMP:
			par2 = strtok (NULL, " \t");
			instr_memory[instruction_nr].label = par2;
		default:
			break;

	} 

	/* increment instruction number before moving to next line */
	instruction_nr++;
   }
   //reconstructing the labels of the branch operations
   int i = 0;
   while(true){
   	instruction_t instr = instr_memory[i];
	if (instr.opcode == EOP) break;
	if (instr.opcode == BLTZ || instr.opcode == BNEZ ||
            instr.opcode == BGTZ || instr.opcode == BEQZ ||
            instr.opcode == BGEZ || instr.opcode == BLEZ ||
            instr.opcode == JUMP
	 ){
		instr_memory[i].immediate = (labels[instr.label] - i - 1) << 2;
	}
        i++;
   }
   sp_register[IF][PC]  = instr_base_address;

}

/* =============================================================

   CODE TO BE COMPLETED

   ============================================================= */

/* simulator */
void sim_pipe_fp::run(unsigned cycles){

    bool Runtoend = (cycles == 0);
   
    while (cycles-- || Runtoend) {

    	if(WriteBack()) return;

    	Memory();


    		Execute();



    		InstrDecode();


    	
    		InstrFetch();


    	clock_cycles++;

    }

}

// IF stage
void sim_pipe_fp::InstrFetch() {

	if (mem_structual_hazard || exe_structural_hazard || RAW_hazard || WAW_hazard) return; // if exe struct haz or data haz do nothing

	if ((op_type(Ins[MEM].opcode) == BRANCH) && (sp_register[MEM][COND] == 1)) {
			sp_register[ID][NPC] = sp_register[MEM][ALU_OUTPUT];
			sp_register[IF][PC]  = sp_register[MEM][ALU_OUTPUT];
		}

	// Control hazard handle
	if (control_hazard) { // if there is control haz insert STALL at IF/ID
		Ins[ID].opcode = NOP;
        Ins[ID].src1 = UNDEFINED;
        Ins[ID].src2 = UNDEFINED;
        Ins[ID].dest = UNDEFINED;
        Ins[ID].immediate = UNDEFINED;
        stalls++;
        return;
	}
   
    if (!RAW_hazard && !control_hazard) {

		Ins[ID] = instr_memory [(sp_register[IF][PC]-instr_base_address)>>2];
       

		opcode_t opcode = Ins[ID].opcode;

        if (opcode != EOP) {
			sp_register[ID][NPC] = (clock_cycles == 0)?(instr_base_address + 4) : (sp_register[IF][PC] + 4);
			sp_register[IF][PC]  = (clock_cycles == 0)?(instr_base_address + 4) : (sp_register[IF][PC] + 4);

			instructions_executed++; // count # of instructions here because there is no NOP and EOP interference.
        }
    }
	for (int i = 0; i < NUM_SP_REGISTERS; i++) // reset value that we don't need to keep. maybe useless
	{
		if (i != PC && i != NPC && i != IR)
		{
			sp_register[ID][i] = UNDEFINED;
		}
	}


}

// ID stage
void sim_pipe_fp::InstrDecode() {
    opcode_t opcode = Ins[ID].opcode;

	if (mem_structual_hazard) return;

    WAW_hazard = false;

    // detect control haz on ID stage
    if (branch_detect(opcode)) {
    	control_hazard = true;
    }
    // detect RAW haz on ID stage
    RAW_hazard = RAW_detect(Ins[ID]);

    //check for EXE struct haz
    unsigned u = get_free_unit(opcode);

    //debug_units();

    if (u != UNDEFINED) { // unit available

    if (WAW_detect(Ins[ID])) {
    	WAW_hazard = true;
    }

    if (RAW_hazard){ // if WAR haz insert STALL at ID/EXE
    	Ins[EXE].opcode = NOP;
        Ins[EXE].src1 = UNDEFINED;
        Ins[EXE].src2 = UNDEFINED;
        Ins[EXE].dest = UNDEFINED;
        Ins[EXE].immediate = UNDEFINED;
        stalls++; 
        return;
    }

    if (WAW_hazard){ // if WAW haz insert STALL at ID/EXE
    	Ins[EXE].opcode = NOP;
        Ins[EXE].src1 = UNDEFINED;
        Ins[EXE].src2 = UNDEFINED;
        Ins[EXE].dest = UNDEFINED;
        Ins[EXE].immediate = UNDEFINED;
        stalls++;
        return;
    }

    // exe struct haz will occur if two exe unit complete at the same time
    for (unsigned k = 0; k < num_units; k++) {
    	if (k != u) {
    	if (exec_units[u].latency + 1 == exec_units[k].busy) {
    		exe_structural_hazard = true;
    	    return;
    	}
    }
    }

    // if no data haz or exe struct haz propagate ins
    	Ins[EXE] = Ins[ID];
		switch(op_type(opcode)) {
		case ARITH: 
			sp_register[EXE][A]      = gp_int_register[Ins[ID].src1];
		    sp_register[EXE][B]      = gp_int_register[Ins[ID].src2];
		    break;
		case ARITHI: 
			sp_register[EXE][A]      = gp_int_register[Ins[ID].src1];
			sp_register[EXE][IMM]    = Ins[ID].immediate;
		    break;
		case MEMO: 
			if ((opcode == LW) || (opcode == LWS)) {
		    sp_register[EXE][A]      = gp_int_register[Ins[ID].src1];
		    sp_register[EXE][IMM]    = Ins[ID].immediate;
		    break;
		    }
		    if (opcode == SW) {
		    sp_register[EXE][A]      = gp_int_register[Ins[ID].src2]; // notice here! address = a + imm;
		    sp_register[EXE][B]      = gp_int_register[Ins[ID].src1]; // data is about to store
		    sp_register[EXE][IMM]    = Ins[ID].immediate;
		    break;
		    }
		    if (opcode == SWS) {
		    sp_register[EXE][A]      = gp_int_register[Ins[ID].src2]; // notice here! address = a + imm;
		    sp_register[EXE][B]      = float2unsigned(get_fp_register(Ins[ID].src1)); // data is about to store
		    sp_register[EXE][IMM]    = Ins[ID].immediate;
		    break;	
		    }
		case BRANCH: 
			sp_register[EXE][A]      = gp_int_register[Ins[ID].src1];
            sp_register[EXE][IMM]    = Ins[ID].immediate;
            break;
        case FP:
            sp_register[EXE][A]      = float2unsigned(get_fp_register(Ins[ID].src1));
		    sp_register[EXE][B]      = float2unsigned(get_fp_register(Ins[ID].src2));
		    break;
        default:
            break;
        }

	for (int i = 0; i < NUM_SP_REGISTERS; i++) {
			if (i != A && i != B && i!= IMM && i != COND && i != ALU_OUTPUT)
			{
				sp_register[EXE][i] = sp_register[ID][i];
			}
		}

    //check for EXE struct haz
    //unsigned u = get_free_unit(Ins[EXE].opcode);

    //if (u != UNDEFINED) { // unit available
    exec_units[u].busy          = exec_units[u].latency+1;
    exec_units[u].instruction   = Ins[EXE]; 
    exec_units_tmp[u].a         = sp_register[EXE][A];
    exec_units_tmp[u].b         = sp_register[EXE][B];
    exec_units_tmp[u].imm       = sp_register[EXE][IMM];
    exec_units_tmp[u].npc       = sp_register[EXE][NPC];
    exe_structural_hazard       = false; // cancel exe struct haz if unit is available
    }

    else if (op_type(Ins[ID].opcode) != SYS) {
        exe_structural_hazard = true; // exe struct. haz.
        stalls++;
        return;
    }
    else {
    	if (Ins[ID].opcode == EOP) {
    		for (unsigned i = 0; i < num_units; i++) {
    			if (exec_units[i].busy != 0) return;
    		}
    		Ins[EXE] = Ins[ID]; // EOP cannot propagate until all exe units are completed
    	}
        else Ins[EXE] = Ins[ID];
    }

	// clear sp registers on ID stage
    for(int i = A;i<NUM_SP_REGISTERS;i++) sp_register[ID][i]=UNDEFINED;

}


// EXE stage
void sim_pipe_fp::Execute() {
    
    if (mem_structual_hazard) { // if there is a structural hazard at mem stage,
    	return;                 // do nothing
    }
    
    decrement_units_busy_time(); // decrease busy only when exe stage is excessed

    // send MEM a NOP defaultly, maybe no point...
    Ins[MEM].opcode = NOP; 
    Ins[MEM].src1 = UNDEFINED;
    Ins[MEM].src2 = UNDEFINED;
    Ins[MEM].dest = UNDEFINED;
    Ins[MEM].immediate = UNDEFINED;

    if (Ins[EXE].opcode == EOP) {  // propagate EOP if no mem struc. haz.
        Ins[MEM].opcode = Ins[EXE].opcode;
        Ins[MEM].src1 = UNDEFINED;
        Ins[MEM].src2 = UNDEFINED;
        Ins[MEM].dest = UNDEFINED;
        Ins[MEM].immediate = UNDEFINED; 
    }

    for (unsigned i = 0; i < num_units; i++) {
    if ((exec_units[i].busy == 0) && (exec_units[i].instruction.opcode != NOP)) {
    opcode_t opcode = exec_units[i].instruction.opcode;
	unsigned a      = exec_units_tmp[i].a;
	unsigned b      = exec_units_tmp[i].b;
	unsigned imm    = exec_units_tmp[i].imm;
	unsigned npc    = exec_units_tmp[i].npc; 

	switch(op_type(opcode)){
		case ARITH: 
			Ins[MEM]                      = exec_units[i].instruction;
			sp_register[MEM][ALU_OUTPUT]  = alu(opcode, a, b, imm, npc);
			sp_register[MEM][COND]        = 0;
			sp_register[MEM][B]           = b;
		    break;
		case ARITHI: 
			Ins[MEM]                      = exec_units[i].instruction;
			sp_register[MEM][ALU_OUTPUT]  = alu(opcode, a, b, imm, npc);
			sp_register[MEM][COND]        = 0;
			sp_register[MEM][B]           = b;
		    break;
		case MEMO: 
			Ins[MEM]                      = exec_units[i].instruction;
			sp_register[MEM][ALU_OUTPUT]  = alu(opcode, a, b, imm, npc);
			sp_register[MEM][COND]        = 0;
			sp_register[MEM][B]           = b;
		    break;
		case BRANCH: 
			Ins[MEM]                      = exec_units[i].instruction;
			sp_register[MEM][ALU_OUTPUT]  = alu(opcode, a, b, imm, npc);
            switch(opcode) {
            	case BEQZ: sp_register[MEM][COND] = (a == 0);break;
            	case BNEZ: sp_register[MEM][COND] = (a != 0);break;
            	case BLTZ: sp_register[MEM][COND] = (a < 0);break;
            	case BGTZ: sp_register[MEM][COND] = (a > 0);break;
            	case BLEZ: sp_register[MEM][COND] = (a <= 0);break;
            	case BGEZ: sp_register[MEM][COND] = (a >= 0);break;
                default: break;
            }
            break;
        case FP:
            Ins[MEM]                      = exec_units[i].instruction;
            sp_register[MEM][ALU_OUTPUT]  = alu(opcode, a, b, imm, npc);
			sp_register[MEM][COND]        = 0;
			sp_register[MEM][B]           = b;
		    break;
		default:
		    Ins[MEM]                      = Ins[EXE];
		    break; 
	}
    }
    }

    for (unsigned k = 0; k < num_units; k++) { 
    	if (exec_units[k].busy == 0) exec_units[k].instruction.opcode = NOP;
    }

    for (int l = A; l < NUM_SP_REGISTERS; l++) {sp_register[EXE][l]=UNDEFINED;}

}


// MEM stage
void sim_pipe_fp::Memory() {
	opcode_t opcode = Ins[MEM].opcode;

	// control haz disappear when branch ins arrives at MEM stage
    if (branch_detect(opcode)) { 
    	control_hazard = false;
    }


	Ins[WB] = Ins[MEM];

	if ((op_type(opcode) == ARITH) || (op_type(opcode) == ARITHI) || (op_type(opcode) == FP)) {
		sp_register[WB][ALU_OUTPUT] = sp_register[MEM][ALU_OUTPUT];
	}
	else if (op_type(opcode) == MEMO) {
		   if (mem_structual_stalls == 0) {

			 sp_register[WB][ALU_OUTPUT] = sp_register[MEM][ALU_OUTPUT];
			 if (opcode == LW || opcode == LWS) sp_register[WB][LMD] = (sp_register[MEM][ALU_OUTPUT] == UNDEFINED)? UNDEFINED:read_memory(sp_register[MEM][ALU_OUTPUT]);
	         else if ((opcode == SW || opcode == SWS) && (sp_register[MEM][ALU_OUTPUT] != UNDEFINED)) write_memory(sp_register[MEM][ALU_OUTPUT], sp_register[MEM][B]);
	         mem_structual_stalls = data_memory_latency; 
	         mem_structual_hazard = false;

		   }
		   else {
		   	Ins[WB].opcode = NOP;
		   	stalls++; // introduce mem struct haz STALL
		   	mem_structual_hazard = true;
		   	mem_structual_stalls--;
		   }
	     }
	 }
    



// WB stage
bool sim_pipe_fp::WriteBack() {
	opcode_t opcode = Ins[WB].opcode;
	//if (clock_cycles >= 4) {
	if ((Ins[WB].dest == Ins[ID].src1 || Ins[WB].dest == Ins[ID].src1) &&
		Ins[WB].opcode != NOP &&
		Ins[ID].opcode != NOP)

		RAW_hazard = false; // clear RAW haz after WB is executed

	switch(op_type(opcode)) {
		case MEMO:
			if (Ins[WB].opcode == LW) gp_int_register[Ins[WB].dest] = sp_register[WB][LMD];
			if (Ins[WB].opcode == LWS) set_fp_register(Ins[WB].dest, unsigned2float(sp_register[WB][LMD]));
			break;
		case ARITH:
			gp_int_register[Ins[WB].dest] = sp_register[WB][ALU_OUTPUT];
			break;
		case ARITHI:
			gp_int_register[Ins[WB].dest] = sp_register[WB][ALU_OUTPUT];
			break;
	    case FP:
	        set_fp_register(Ins[WB].dest, unsigned2float(sp_register[WB][ALU_OUTPUT]));
	        break;
		default:
		    if (Ins[WB].opcode == EOP) {
                for(int i = A;i<NUM_SP_REGISTERS;i++){sp_register[WB][i]=UNDEFINED;}
		    	return true;
		        }
		    break;
    } 
    for(int i = A;i<NUM_SP_REGISTERS;i++){sp_register[WB][i]=UNDEFINED;}
    return false;
    }

    

//reset the state of the sim_pipe_fpulator
void sim_pipe_fp::reset() {
	// init data memory
	for (unsigned i=0; i<data_memory_size; i++) data_memory[i]=0xFF;
	// init instruction memory
	for (int i=0; i<PROGRAM_SIZE;i++){
		instr_memory[i].opcode=(opcode_t)NOP;
		instr_memory[i].src1=UNDEFINED;
		instr_memory[i].src2=UNDEFINED;
		instr_memory[i].dest=UNDEFINED;
		instr_memory[i].immediate=UNDEFINED;
	}

    for(int i = 0; i < NUM_STAGES; i++) {
      Ins[i].opcode = NOP;
      for(int j = 0; j < NUM_SP_REGISTERS; j++) {
         sp_register[i][j]  = UNDEFINED;
      }
      sp_register[i][COND]  = 0;
    }

    for (int i = 0; i<NUM_GP_REGISTERS; i++)
	{
		gp_int_register[i] = UNDEFINED;
	}
	for (int i = 0; i<NUM_GP_REGISTERS; i++)
	{
		gp_fp_register[i] = UNDEFINED;
	}

  //  for(int i=0;i<NUM_STAGES;i++){
	//	Ins[i] = UNDEFINED;
//	}
	clock_cycles = 0;
	instructions_executed = 0;
	stalls = 0;
	exe_structural_hazard = false;
	mem_structual_hazard    = false;
	RAW_hazard = false;
	WAW_hazard = false;
	control_hazard      = false;

}

//return type of instruction
unsigned sim_pipe_fp::op_type(opcode_t op) {
	if ((op == LW) || (op == SW) || (op == LWS) || (op == SWS))
		return MEMO;
	else if ((op == ADD) || (op == SUB) || (op == XOR))
		return ARITH;
	else if ((op == ADDI) || (op == SUBI))
		return ARITHI;
	else if ((op >= BEQZ) && (op <= JUMP))
		return BRANCH;
	else if ((op >= ADDS) && (op <= DIVS))
		return FP;
	else if ((op == NOP) || (op == EOP))
		return SYS;
	return UNKNOWN;
}

// RAW hazard detector. Check if there is data dependency that may result in hazard.
bool sim_pipe_fp::RAW_detect(instruction_t ins) {
    
    // RAW lies in sp registers
    instruction_t stage_ins_array[3] = {Ins[EXE], Ins[MEM],Ins[WB]};

    for (int i = 0; i < 3; i++) { // stage ins check
    	if ((op_type(stage_ins_array[i].opcode) != SYS) && (op_type(ins.opcode) != SYS) &&
    		(stage_ins_array[i].opcode != SW) && (stage_ins_array[i].opcode != SWS)) {
    		if (ins.opcode != SW && ins.opcode != SWS) {
    			if (((stage_ins_array[i].dest == ins.src1) || (stage_ins_array[i].dest == ins.src2)) && // flow dependency
    				(((op_type(stage_ins_array[i].opcode) == FP || stage_ins_array[i].opcode == LWS) && (op_type(ins.opcode) == FP)) || // operands have to be both F type or R type
    				 ((op_type(stage_ins_array[i].opcode) == ARITH || op_type(stage_ins_array[i].opcode) == ARITHI || stage_ins_array[i].opcode == LW) && (op_type(ins.opcode) != FP))
    				)) {    		
    		        return true;
    		    }
    		}
    		else {
    			if (((stage_ins_array[i].dest == ins.src1) || (stage_ins_array[i].dest == ins.dest)) &&
    				(((op_type(stage_ins_array[i].opcode) == FP || stage_ins_array[i].opcode == LWS) && (op_type(ins.opcode) == SWS)) ||
                     ((op_type(stage_ins_array[i].opcode) == ARITH || op_type(stage_ins_array[i].opcode) == ARITHI || stage_ins_array[i].opcode == LW) && (op_type(ins.opcode) == SW))
    				)) {
    		        return true;
    			}
    		}
    	}

    }
    // RAW lies in exe units
    for (unsigned j = 0; j < num_units; j++) { // unit ins check
    	instruction_t unit_ins = exec_units[j].instruction;

    	if ((op_type(unit_ins.opcode) != SYS) && (op_type(ins.opcode) != SYS) &&
    		(unit_ins.opcode != SW) && (unit_ins.opcode != SWS)) {
    		if (ins.opcode != SW && ins.opcode != SWS) {
    			if (((unit_ins.dest == ins.src1) || (unit_ins.dest == ins.src2)) &&
    				(((op_type(unit_ins.opcode) == FP || unit_ins.opcode == LWS) && (op_type(ins.opcode) == FP)) ||
    				 ((op_type(unit_ins.opcode) == ARITH || op_type(unit_ins.opcode) == ARITHI || unit_ins.opcode == LW) && (op_type(ins.opcode) != FP))
    				))  {
    		       return true;
    		   }
    		}
    		else {
    			if (((unit_ins.dest == ins.src1) || (unit_ins.dest == ins.src2))  &&
    				(((op_type(unit_ins.opcode) == FP || unit_ins.opcode == LWS) && (op_type(ins.opcode) == SWS)) ||
                     ((op_type(unit_ins.opcode) == ARITH || op_type(unit_ins.opcode) == ARITHI || unit_ins.opcode == LW) && (op_type(ins.opcode) == SW))
    				)) {
    		       return true;
    		   }
    		}
    	}
    }
    return false;
}

// WAW haz detector
bool sim_pipe_fp::WAW_detect(instruction_t ins) {

    unsigned latency = exec_units[get_free_unit(ins.opcode)].latency;

    for (unsigned j = 0; j < num_units; j++) { // unit ins check
    	instruction_t unit_ins = exec_units[j].instruction;
        unsigned busy = exec_units[j].busy;
 
    	if ((op_type(unit_ins.opcode) != SYS) && (op_type(ins.opcode) != SYS) &&
    		(unit_ins.opcode != SW) && (unit_ins.opcode != SWS) && (ins.opcode != SW) && (ins.opcode != SWS) &&
    		(unit_ins.dest != UNDEFINED) && (ins.dest != UNDEFINED) &&
    		((op_type(unit_ins.opcode) == FP || unit_ins.opcode == LWS) && (op_type(ins.opcode) == FP || ins.opcode == LWS)) &&
    		(unit_ins.dest == ins.dest)  && (latency < busy))
    		return true;
    }
    return false;
}



// return if op is branch
bool sim_pipe_fp::branch_detect(opcode_t opcode) {
    if (op_type(opcode) == BRANCH) return true;	
    else return false;	
}

		
// reset values of sp register
void sim_pipe_fp::reset_sp_registers(stage_t s) {
    for (int i = 0; i < NUM_SP_REGISTERS; i++) {
        sp_register[s][i] = UNDEFINED;
    }
}

// return value of special purpose register
unsigned sim_pipe_fp::get_sp_register(sp_register_t reg, stage_t s){
	return sp_register[s][reg];
}

int sim_pipe_fp::get_int_register(unsigned reg){
	return gp_int_register[reg]; 
}

void sim_pipe_fp::set_gp_register(unsigned reg, int value){

	gp_int_register[reg] = value;

}

void sim_pipe_fp::set_int_register(unsigned reg, int value){
	gp_int_register[reg] = value;
}

float sim_pipe_fp::get_fp_register(unsigned reg){
	return unsigned2float(gp_fp_register[reg]); 
}

void sim_pipe_fp::set_fp_register(unsigned reg, float value){
	gp_fp_register[reg] = float2unsigned(value);
}


float sim_pipe_fp::get_IPC(){
   float IPC = (float)(instructions_executed)/(float)clock_cycles;
     return IPC;
}

unsigned sim_pipe_fp::get_instructions_executed(){
        return (instructions_executed); 
}

unsigned sim_pipe_fp::get_clock_cycles(){
	return clock_cycles; 
}

unsigned sim_pipe_fp::get_stalls(){
        return stalls; 
}
