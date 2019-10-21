#include "sim_pipe.h"
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
static const char *instr_names[NUM_OPCODES] = {"LW", "SW", "ADD", "ADDI", "SUB", "SUBI", "XOR", "BEQZ", "BNEZ", "BLTZ", "BGTZ", "BLEZ", "BGEZ", "JUMP", "EOP", "NOP"};


/* =============================================================

   HELPER FUNCTIONS

   ============================================================= */


/* converts integer into array of unsigned char - little indian */
inline void int2char(unsigned value, unsigned char *buffer){
	memcpy(buffer, &value, sizeof value);
}

/* converts array of char into integer - little indian */
inline unsigned char2int(unsigned char *buffer){
	unsigned d;
	memcpy(&d, buffer, sizeof d);
	return d;
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
				return(a + imm);
			case BEQZ:
			case BNEZ:
			case BGTZ:
			case BGEZ:
			case BLTZ:
			case BLEZ:
			case JUMP:
				return(npc+imm);
			default:	
				return (UNDEFINED);
	}
}

/* =============================================================

   CODE PROVIDED - NO NEED TO MODIFY FUNCTIONS BELOW

   ============================================================= */

/* loads the assembly program in file "filename" in instruction memory at the specified address */
void sim_pipe::load_program(const char *filename, unsigned base_address){

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
			par1 = strtok (NULL, " \t");
			par2 = strtok (NULL, " \t");
			par3 = strtok (NULL, " \t");
			instr_memory[instruction_nr].dest = atoi(strtok(par1, "R"));
			instr_memory[instruction_nr].src1 = atoi(strtok(par2, "R"));
			instr_memory[instruction_nr].src2 = atoi(strtok(par3, "R"));
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
			par1 = strtok (NULL, " \t");
			par2 = strtok (NULL, " \t");
			instr_memory[instruction_nr].dest = atoi(strtok(par1, "R"));
			instr_memory[instruction_nr].immediate = strtoul(strtok(par2, "()"), NULL, 0);
			instr_memory[instruction_nr].src1 = atoi(strtok(NULL, "R"));
			break;
		case SW:
			par1 = strtok (NULL, " \t");
			par2 = strtok (NULL, " \t");
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

/* writes an integer value to data memory at the specified address (use little-endian format: https://en.wikipedia.org/wiki/Endianness) */
void sim_pipe::write_memory(unsigned address, unsigned value){

   int2char(value,data_memory+address);
}

/* read value from memory */
unsigned sim_pipe::read_memory(unsigned address){
   unsigned value = 0;
   value |= data_memory[address + 0];
   value |= data_memory[address + 1] << 8;  
   value |= data_memory[address + 2] << 16;
   value |= data_memory[address + 3] << 24;
   return value;
}

/* prints the content of the data memory within the specified address range */
void sim_pipe::print_memory(unsigned start_address, unsigned end_address){
	cout << "data_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8) << setfill('0') <<  end_address << "]" << endl;
	for (unsigned i=start_address; i<end_address; i++){
		if (i%4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": "; 
		cout << hex << setw(2) << setfill('0') << int(data_memory[i]) << " ";
		if (i%4 == 3) cout << endl;
	} 
}

/* prints the values of the registers */
void sim_pipe::print_registers(){
        cout << "Special purpose registers:" << endl;
        unsigned i, s;
        for (s=0; s<NUM_STAGES; s++){
                cout << "Stage: " << stage_names[s] << endl;
                for (i=0; i< NUM_SP_REGISTERS; i++)
                        if ((sp_register_t)i != IR && (sp_register_t)i != COND && get_sp_register((sp_register_t)i, (stage_t)s)!=UNDEFINED) cout << reg_names[i] << " = " << dec <<  get_sp_register((sp_register_t)i, (stage_t)s) << hex << " / 0x" << get_sp_register((sp_register_t)i, (stage_t)s) << endl;
        }
        cout << "General purpose registers:" << endl;
        for (i=0; i< NUM_GP_REGISTERS; i++)
                if (get_gp_register(i)!=(int)UNDEFINED) cout << "R" << dec << i << " = " << get_gp_register(i) << hex << " / 0x" << get_gp_register(i) << endl;
}

/* initializes the pipeline simulator */
sim_pipe::sim_pipe(unsigned mem_size, unsigned mem_latency){ 
	data_memory_size    = mem_size;
	data_memory_latency = mem_latency;
	data_memory         = new unsigned char[data_memory_size];
	fill_n(data_memory, data_memory_size, 0xFF);
	structual_stalls    = data_memory_latency; // set initial structual stall
	reset();
}
	
/* deallocates the pipeline simulator */
sim_pipe::~sim_pipe(){

}

/* =============================================================

   CODE TO BE COMPLETED

   ============================================================= */


/* body of the simulator */
void sim_pipe::run(unsigned cycles){
	//cout<<"Clock cycles:"<<cycles<<endl;
    bool Runtoend = (cycles == 0);
   
    while (cycles-- || Runtoend) {

    	if(WriteBack()) return;
    	//cout<<"after WB"<<endl;
    	//print_registers();

    	Memory();
    	//cout<<"after MEM"<<endl;
    	//print_registers();
        
        if (!structual_hazard) {
    		Execute();
    		//cout<<"after EXE"<<endl;
    		//print_registers();


    		InstrDecode();
    		//cout<<"after ID"<<endl;
    		//print_registers();


    	
    		InstrFetch();
    		//cout<<"after IF"<<endl;
    		//print_registers();
        }

    	clock_cycles++;

    }

}

// IF stage
void sim_pipe::InstrFetch() {
	//cout<<"**************Branch condition COND=***************"<<sp_register[MEM][COND]<<endl;
	if ((op_type(Ins[MEM].opcode) == BRANCH) && (sp_register[MEM][COND] == 1)) {
			sp_register[ID][NPC] = sp_register[MEM][ALU_OUTPUT];
			sp_register[IF][PC]  = sp_register[MEM][ALU_OUTPUT];
		}
	//if (control_hazard) {
	//	Ins[ID].opcode = NOP;
	//	cout<<"**************IF stage instr = NO****************"<<endl;
	//}
    if (!data_hazard && !control_hazard) {
       // cout<<"0x"<<std::hex<<((sp_register[IF][PC]))<<endl;
		Ins[ID] = instr_memory [(sp_register[IF][PC]-instr_base_address)>>2];

		//Ins[ID] = instr_memory [(0x00000100)>>2]; 
    	//sp_register[MEM][PC] = (clock_cycles == 0)?instr_base_address:sp_register[MEM][PC];
       // cout<<"0x"<<std::hex<<((sp_register[MEM][PC]))<<endl;
		opcode_t opcode = Ins[ID].opcode;
		/*switch(op_type(opcode)) {
		case ARITH: 
		    cout<<"**************IF stage instr = ARITH****************"<<endl;
		    break;
		case ARITHI: 
			cout<<"**************IF stage instr = ARITHI****************"<<endl;
		    break;
		case MEMO: 
			cout<<"**************IF stage instr = MEMO****************"<<endl;
		    break;
		case BRANCH: 
            cout<<"**************IF stage instr = BRANCH****************"<<endl;
            break;
        default:
            if (opcode == EOP)
            cout<<"**************IF stage instr = EOP****************"<<endl;
            else
            cout<<"**************IF stage instr = NOP****************"<<endl;
            break;
        }*/
   //     if ((op_type(Ins[MEM].opcode) == BRANCH) && (sp_register[MEM][COND] == 1)) {
	//		sp_register[ID][NPC] = sp_register[MEM][ALU_OUTPUT];
	//		sp_register[IF][PC]  = sp_register[MEM][ALU_OUTPUT];
	//	}
        if (opcode != EOP) {
			sp_register[ID][NPC] = (clock_cycles == 0)?(instr_base_address + 4) : (sp_register[IF][PC] + 4);
			sp_register[IF][PC]  = (clock_cycles == 0)?(instr_base_address + 4) : (sp_register[IF][PC] + 4);

			instructions_executed++; // count # of instructions here because there is no NOP and EOP interference.
		   //cout<<"*******************Instr counter**************************"<<std::dec<<instructions_executed<<endl;
        }
        else  last_pipe = true;
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
void sim_pipe::InstrDecode() {
    opcode_t opcode = Ins[ID].opcode;
	/*for(int i = 0; i < NUM_SP_REGISTERS; i++) {
		sp_register[EXE][i]      = UNDEFINED;
      }*/
		if (clock_cycles > 0) {
		switch(op_type(opcode)) {
		case ARITH: 
			sp_register[EXE][A]      = gp_register[Ins[ID].src1];
		    sp_register[EXE][B]      = gp_register[Ins[ID].src2];
		    //cout<<"**************ID stage instr = ARITH****************"<<endl;
		    break;
		case ARITHI: 
			sp_register[EXE][A]      = gp_register[Ins[ID].src1];
			sp_register[EXE][IMM]    = Ins[ID].immediate;
			//cout<<"**************ID stage instr = ARITHI****************"<<endl;
		    break;
		case MEMO: 
			//cout<<"**************ID stage instr = MEMO****************"<<endl;
			if (opcode == LW) {
		    sp_register[EXE][A]      = gp_register[Ins[ID].src1];
		    sp_register[EXE][IMM]    = Ins[ID].immediate;
		    }
		    else {
		    sp_register[EXE][A]      = gp_register[Ins[ID].src2]; // notice here! address = a + imm;
		    sp_register[EXE][B]      = gp_register[Ins[ID].src1]; // data is about to store
		    sp_register[EXE][IMM]    = Ins[ID].immediate;
		    }
		    break;
		case BRANCH: 
			sp_register[EXE][A]      = gp_register[Ins[ID].src1];
            sp_register[EXE][IMM]    = Ins[ID].immediate;
           // cout<<"**************ID stage instr = BRANCH****************"<<endl;
            break;
        default:
            //if (opcode == EOP) last_pipe = true;
           // cout<<"**************ID stage instr = NO****************"<<endl;
            break;
        }
    }
        
	/*	sp_register[EXE][A]      = gp_register[Ins[ID].src1];
		sp_register[EXE][B]      = gp_register[Ins[ID].src2];
		sp_register[EXE][IMM]    = Ins[ID].immediate;
		sp_register[EXE][NPC]    = sp_register[ID][NPC];
		Ins[EXE]                 = Ins[ID];
    */


	for (int i = 0; i < NUM_SP_REGISTERS; i++) {
			if (i != A && i != B && i!= IMM && i != COND && i != ALU_OUTPUT)
			{
				sp_register[EXE][i] = sp_register[ID][i];
			}
		}

	// Hazard handling
    //cout<<"**********clock_cycles: ***********"<<std::dec<<clock_cycles<<endl;
    if (!last_pipe)	hazard_handling();

    //cout<<"************data hazard in ID***************"<<endl;
    //cout<<"data_hazard = "<<data_hazard<<"  control_hazard = "<<std::dec<<control_hazard<<endl;
    // Instruction propagation depends on hazard detection
	if ((!data_hazard) && (!control_hazard)) Ins[EXE] = Ins[ID];

	// clear sp registers on ID stage
    for(int i = A;i<NUM_SP_REGISTERS;i++) sp_register[ID][i]=UNDEFINED;
    }

// EXE stage
void sim_pipe::Execute() {
	opcode_t opcode = Ins[EXE].opcode;
	unsigned a      = sp_register[EXE][A];
	unsigned b      = sp_register[EXE][B];
	unsigned imm    = sp_register[EXE][IMM];
	unsigned npc    = sp_register[EXE][NPC];
  
    if(op_type(opcode) != BRANCH) sp_register[MEM][COND] = 0;// no branch
    sp_register[MEM][B] = b;
	/*for(int i = 0; i < NUM_SP_REGISTERS; i++) {
		sp_register[MEM][i]       = UNDEFINED;
      }*/
    if (clock_cycles >= 2){

	switch(op_type(opcode)){
		case ARITH: 
            //cout<<"**************EXE stage instr = ARITH****************"<<endl;
			Ins[MEM]                      = Ins[EXE];
			sp_register[MEM][ALU_OUTPUT]  = alu(opcode, a, b, imm, npc);
		    break;
		case ARITHI: 
			//cout<<"**************EXE stage instr = ARITHI****************"<<endl;
			Ins[MEM]                      = Ins[EXE];
			sp_register[MEM][ALU_OUTPUT]  = alu(opcode, a, b, imm, npc);
		    break;
		case MEMO: 
			//cout<<"**************EXE stage instr = MEMO****************"<<endl;
			Ins[MEM]                      = Ins[EXE];
			sp_register[MEM][ALU_OUTPUT]  = alu(opcode, a, b, imm, npc);
			sp_register[MEM][B]           = b;
		    break;
		case BRANCH: 
			//cout<<"**************EXE stage instr = BRANCH****************"<<endl;
			Ins[MEM]                      = Ins[EXE];
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
           // cout<<"**************Branch condition COND=***************"<<sp_register[MEM][COND]<<endl;
            break;
		default:
		    Ins[MEM]                      = Ins[EXE];
		   // cout<<"**************EXE stage instr = NOP or EOP****************"<<endl; 
		    break; 
	}
}
	/*for (int i = 0; i < NUM_SP_REGISTERS; i++)
	{
		if (i != ALU_OUTPUT)
		{
			sp_register[MEM][i] = sp_register[EXE][i];
		}
	}*/
    for(int i = A;i<NUM_SP_REGISTERS;i++){sp_register[EXE][i]=UNDEFINED;}
}

// MEM stage
void sim_pipe::Memory() {
	opcode_t opcode = Ins[MEM].opcode;

	/*for(int i = 0; i < NUM_SP_REGISTERS; i++) {
		sp_register[WB][i] = UNDEFINED;
      }*/

	Ins[WB] = Ins[MEM];
	if ((op_type(opcode) == ARITH) || (op_type(opcode) == ARITHI)) {
		sp_register[WB][ALU_OUTPUT] = sp_register[MEM][ALU_OUTPUT];
		//cout<<"**************MEM stage instr = ARITH/ARTHI****************"<<endl;
	}
	else if (op_type(opcode) == MEMO) {
		//cout<<"**************MEM stage instr = MEMO****************"<<endl;
		   if (structual_stalls == 0) {

			 sp_register[WB][ALU_OUTPUT] = sp_register[MEM][ALU_OUTPUT];
			 if (opcode == LW) sp_register[WB][LMD] = (sp_register[MEM][ALU_OUTPUT] == UNDEFINED)? UNDEFINED:read_memory(sp_register[MEM][ALU_OUTPUT]);
	         else if ((opcode == SW) && (sp_register[MEM][ALU_OUTPUT] != UNDEFINED)) write_memory(sp_register[MEM][ALU_OUTPUT], sp_register[MEM][B]);
	         structual_stalls = data_memory_latency; 
	         structual_hazard = false;

		   }
		   else {
		   	sp_register[WB][ALU_OUTPUT] = sp_register[MEM][ALU_OUTPUT];
		   	Ins[WB].opcode = NOP;
		   	stalls++;
		   	structual_hazard = true;
		   	structual_stalls--;
		   }
	     }
	 
}


// WB stage
bool sim_pipe::WriteBack() {
	opcode_t opcode = Ins[WB].opcode;
	if (clock_cycles >= 4) {
	switch(op_type(opcode)) {
		case MEMO:
		    //cout<<"**************WB stage instr = MEMO****************"<<endl;
			if(Ins[WB].opcode == LW) gp_register[Ins[WB].dest] = sp_register[WB][LMD];
			break;
		case ARITH:
		    //cout<<"**************WB stage instr = ARITH****************"<<endl;
			gp_register[Ins[WB].dest] = sp_register[WB][ALU_OUTPUT];
			break;
		case ARITHI:
		   //cout<<"**************WB stage instr = ARITHI****************"<<endl;
			gp_register[Ins[WB].dest] = sp_register[WB][ALU_OUTPUT];
			break;
		default:
		    //cout<<"**************WB stage instr = NOP or EOP****************"<<endl;
		    if (Ins[WB].opcode == EOP) {
                for(int i = A;i<NUM_SP_REGISTERS;i++){sp_register[WB][i]=UNDEFINED;}
		    	return true;
		        }
		    break;
    } 
    for(int i = A;i<NUM_SP_REGISTERS;i++){sp_register[WB][i]=UNDEFINED;}
    return false;
    }
    else {
        for(int i = A;i<NUM_SP_REGISTERS;i++){sp_register[WB][i]=UNDEFINED;}
    	return false;
    }

}

	
/* reset the state of the pipeline simulator */
void sim_pipe::reset(){
    for(int i = 0; i < NUM_STAGES; i++) {
      Ins[i].opcode = NOP;
      for(int j = 0; j < NUM_SP_REGISTERS; j++) {
         sp_register[i][j]  = UNDEFINED;
      }
      sp_register[i][COND]  = 0;
    }

    for (int i = 0; i<NUM_GP_REGISTERS; i++)
	{
		gp_register[i] = UNDEFINED;
	}

  //  for(int i=0;i<NUM_STAGES;i++){
	//	Ins[i] = UNDEFINED;
//	}
	clock_cycles = 0;
	instructions_executed = 0;
	stalls = 0;
	stall               = false;
	stall_stack         = false;
	structual_hazard    = false;
	control_hazard      = false;
	data_hazard         = false;
	last_pipe           = false;

}
//return type of instruction
unsigned sim_pipe::op_type(opcode_t op) {
	if ((op == LW) || (op == SW))
		return MEMO;
	else if ((op == ADD) || (op == SUB) || (op == XOR))
		return ARITH;
	else if ((op == ADDI) || (op == SUBI))
		return ARITHI;
	else if ((op >= BEQZ) && (op <= JUMP))
		return BRANCH;
	else if ((op == NOP) || (op == EOP))
		return SYS;
	return UNKNOWN;
}

// hazard detector
bool sim_pipe::DATA_hazard_detect() {
	opcode_t id_op = Ins[ID].opcode;
	opcode_t ex_op = Ins[EXE].opcode;
	opcode_t mem_op = Ins[WB].opcode;
	if (ex_op != SW) {
		if (id_op != SW) {
			if(((Ins[ID].src1 == Ins[EXE].dest) || (Ins[ID].src2 == Ins[EXE].dest)) && (Ins[EXE].opcode != NOP)){
				//cout<<"************data stall type 1*************"<<endl;
				stall_stack = true;
				stall_stack_type = DATA;
				data_hazard = true;
				return true;
			}
		}
		else {
			if(((Ins[ID].src1 == Ins[EXE].dest) || (Ins[ID].dest == Ins[EXE].dest)) && (Ins[EXE].opcode != NOP)) {
				//cout<<"************data stall type 1*************"<<endl;
				stall_stack = true;
				stall_stack_type = DATA;
				data_hazard = true;
				return true;
			}
		}
	}
	if (mem_op != SW) {
		if (id_op != SW) {
			if(((Ins[ID].src1 == Ins[WB].dest) || (Ins[ID].src2 == Ins[WB].dest)) && (Ins[WB].opcode != NOP) && (Ins[ID].opcode != NOP)) {
				//cout<<"************data stall type 2*************"<<endl;
				data_hazard = true;
				return true;
			}
		}
		else {
			if(((Ins[ID].src1 == Ins[WB].dest) || (Ins[ID].dest == Ins[WB].dest)) && (Ins[WB].opcode != NOP) && (Ins[ID].opcode != NOP)) {
				//cout<<"************data stall type 2*************"<<endl;
				//stall_stack = true;
				//stall_stack_type = DATA;
				data_hazard = true;
				return true;
			}
		}
	}
	data_hazard = false;
	return false;
}

bool sim_pipe::CONTROL_hazard_detect() {
    if (op_type(Ins[ID].opcode) == BRANCH) {
    	stall_stack = true;
    	stall_stack_type = CONTROL;
		control_hazard = true;
		return true;
    }
    control_hazard = false;
    return false;
}


// Hazard handling function
void sim_pipe::hazard_handling() {
	if (clock_cycles >= 2)	{			    
	if (stall_stack && (Ins[ID].opcode != EOP)) { // insert the second stall
		stall_stack = false;
		stalls++;
		switch (stall_stack_type) {
			case DATA: 
			    Ins[EXE].opcode = NOP;
			    //cout<<"************data stall stack*************"<<endl;
			    break;
			case CONTROL:
			    Ins[EXE] = Ins[ID];
			    Ins[ID].opcode = NOP;
			    //cout<<"************control stall stack*************"<<endl;
			    break;
			default:
			    break;
			}
		}
	else if (DATA_hazard_detect()) {
			Ins[EXE].opcode = NOP;
			//cout<<"************data stall*************"<<endl;
			stalls++;
		 }
         else if (CONTROL_hazard_detect()) {
         	Ins[EXE] = Ins[ID];
         	Ins[ID].opcode = NOP;
         	//cout<<"************control stall*************"<<endl;
         	stalls++;
         }
     }
}
		


//return value of special purpose register
unsigned sim_pipe::get_sp_register(sp_register_t reg, stage_t s){

	return sp_register[s][reg]; 

}

//returns value of general purpose register
int sim_pipe::get_gp_register(unsigned reg){

	return gp_register[reg]; 

}

void sim_pipe::set_gp_register(unsigned reg, int value){

	gp_register[reg] = value;

}

float sim_pipe::get_IPC(){
   float IPC = (float)(instructions_executed)/(float)clock_cycles;
     return IPC;

}

unsigned sim_pipe::get_instructions_executed(){
        return (instructions_executed); 
}

unsigned sim_pipe::get_stalls(){
        return stalls; 
}

unsigned sim_pipe::get_clock_cycles(){
        return clock_cycles; 
}

