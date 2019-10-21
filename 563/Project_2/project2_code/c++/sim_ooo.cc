//---------- ECE #563 Project #2 ----------
//----------Student ID: 200265085----------
//----------    Zhiping Wang     ----------

#include "sim_ooo.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <cstring>
#include <string>
#include <iomanip>
#include <map>

using namespace std;

#define UNDEFINED 0xFFFFFFFF //constant used for initialization
#define NUM_GP_REGISTERS 32
#define NUM_OPCODES 24
#define NUM_STAGES 4
#define MAX_UNITS 10 
#define PROGRAM_SIZE 50 

//used for debugging purposes
static const char *stage_names[NUM_STAGES] = {"ISSUE", "EXE", "WR", "COMMIT"};
static const char *instr_names[NUM_OPCODES] = {"LW", "SW", "ADD", "ADDI", "SUB", "SUBI", "XOR", "AND", "MULT", "DIV", "BEQZ", "BNEZ", "BLTZ", "BGTZ", "BLEZ", "BGEZ", "JUMP", "EOP", "LWS", "SWS", "ADDS", "SUBS", "MULTS", "DIVS"};
static const char *res_station_names[5]={"Int", "Add", "Mult", "Load"};

/* =============================================================

   HELPER FUNCTIONS (misc)

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

/* the following six functions return the kind of the considered opcdoe */

bool is_branch(opcode_t opcode){
        return (opcode == BEQZ || opcode == BNEZ || opcode == BLTZ || opcode == BLEZ || opcode == BGTZ || opcode == BGEZ || opcode == JUMP);
}

bool is_memory(opcode_t opcode){
        return (opcode == LW || opcode == SW || opcode == LWS || opcode == SWS);
}

bool is_int_r(opcode_t opcode){
        return (opcode == ADD || opcode == SUB || opcode == XOR || opcode == AND);
}

bool is_int_imm(opcode_t opcode){
        return (opcode == ADDI || opcode == SUBI );
}

bool is_int(opcode_t opcode){
        return (is_int_r(opcode) || is_int_imm(opcode));
}

bool is_fp_alu(opcode_t opcode){
        return (opcode == ADDS || opcode == SUBS || opcode == MULTS || opcode == DIVS);
}

/* clears a ROB entry */
void clean_rob(rob_entry_t *entry){
        entry->ready=false;
        entry->pc=UNDEFINED;
        entry->state=ISSUE;
        entry->destination=UNDEFINED;
        entry->value=UNDEFINED;
}

/* clears a reservation station */
void clean_res_station(res_station_entry_t *entry){
        entry->pc=UNDEFINED;
        entry->value1=UNDEFINED;
        entry->value2=UNDEFINED;
        entry->tag1=UNDEFINED;
        entry->tag2=UNDEFINED;
        entry->destination=UNDEFINED;
        entry->address=UNDEFINED;
}

/* clears an entry if the instruction window */
void clean_instr_window(instr_window_entry_t *entry){
        entry->pc=UNDEFINED;
        entry->issue=UNDEFINED;
        entry->exe=UNDEFINED;
        entry->wr=UNDEFINED;
        entry->commit=UNDEFINED;
}

/* implements the ALU operation 
   NOTE: this function does not cover LOADS and STORES!
*/
unsigned alu(opcode_t opcode, unsigned value1, unsigned value2, unsigned immediate, unsigned pc){
	unsigned result;
	switch(opcode){
			case ADD:
			    result = value1+value2;
				break;
			case ADDI:
				result = value1+immediate;
				break;
			case SUB:
			    result = value1-value2;
				break;
			case SUBI:
				result = value1-immediate;
				break;
			case XOR:
				result = value1 ^ value2;
				break;
			case AND:
				result = value1 & value2;
				break;
			case MULT:
				result = value1 * value2;
				break;
			case DIV:
				result = value1 / value2;
				break;
			case ADDS:
				result = float2unsigned(unsigned2float(value1) + unsigned2float(value2));
				break;
			case SUBS:
				result = float2unsigned(unsigned2float(value1) - unsigned2float(value2));
				break;
			case MULTS:
				result = float2unsigned(unsigned2float(value1) * unsigned2float(value2));
				break;
			case DIVS:
				result = float2unsigned(unsigned2float(value1) / unsigned2float(value2));
				break;
			case JUMP:
				result = pc + 4 + immediate;
				break;
			default: //branches
		//	    cond = false;
				int reg = (int) value1;
				bool condition = ((opcode == BEQZ && reg==0) ||
				(opcode == BNEZ && reg!=0) ||
  				(opcode == BGEZ && reg>=0) ||
  				(opcode == BLEZ && reg<=0) ||      
  				(opcode == BGTZ && reg>0) ||       
  				(opcode == BLTZ && reg<0));
				if (condition) {
			//		cond   = true;
	 				result = pc+4+immediate;
				}
				else 
					result = pc+4;
				break;
	}
	return 	result;
}

/* writes the data memory at the specified address */
void sim_ooo::write_memory(unsigned address, unsigned value){
	unsigned2char(value,data_memory+address);
}

/* =============================================================

   Handling of FUNCTIONAL UNITS

   ============================================================= */

/* initializes an execution unit */
void sim_ooo::init_exec_unit(exe_unit_t exec_unit, unsigned latency, unsigned instances){
        for (unsigned i=0; i<instances; i++){
                exec_units[num_units].type = exec_unit;
                exec_units[num_units].latency = latency;
                exec_units[num_units].busy = 0;
                exec_units[num_units].pc = UNDEFINED;
                num_units++;
                memory_latency = (exec_unit == MEMORY)? latency : memory_latency;
        }
}

/* returns a free unit for that particular operation or UNDEFINED if no unit is currently available */
unsigned sim_ooo::get_free_unit(opcode_t opcode){
	if (num_units == 0){
		cout << "ERROR:: simulator does not have any execution units!\n";
		exit(-1);
	}
	for (unsigned u=0; u<num_units; u++){
		switch(opcode){
			//Integer unit
			case ADD:
			case ADDI:
			case SUB:
			case SUBI:
			case XOR:
			case AND:
			case BEQZ:
			case BNEZ:
			case BLTZ:
			case BGTZ:
			case BLEZ:
			case BGEZ:
			case JUMP:
				if (exec_units[u].type==INTEGER && exec_units[u].busy==0) return u;
				break;
			//memory unit
			case LW:
			case SW:
			case LWS: 
			case SWS:
			   // cout<<"**************HEREaaaa!!!!!!!!!!***********"<<exec_units[u].type<<exec_units[u].busy<<endl;
				if (exec_units[u].type==MEMORY && exec_units[u].busy==0) return u;
				break;
			// FP adder
			case ADDS:
			case SUBS:
				if (exec_units[u].type==ADDER && exec_units[u].busy==0) return u;
				break;
			// Multiplier
			case MULT:
			case MULTS:
				if (exec_units[u].type==MULTIPLIER && exec_units[u].busy==0) return u;
				break;
			// Divider
			case DIV:
			case DIVS:
				if (exec_units[u].type==DIVIDER && exec_units[u].busy==0) return u;
				break;
			default:
				//cout << "ERROR:: operations not requiring exec unit!\n";
				//exit(-1);
				// && exec_units[u].pc==UNDEFINED
			    return UNDEFINED;
				break;
		}
	}
	return UNDEFINED;
}



/* ============================================================================

   Primitives used to print out the state of each component of the processor:
   	- registers
	- data memory
	- instruction window
        - reservation stations and load buffers
        - (cycle-by-cycle) execution log
	- execution statistics (CPI, # instructions executed, # clock cycles) 

   =========================================================================== */
 

/* prints the content of the data memory */
void sim_ooo::print_memory(unsigned start_address, unsigned end_address){
	cout << "DATA MEMORY[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8) << setfill('0') <<  end_address << "]" << endl;
	for (unsigned i=start_address; i<end_address; i++){
		if (i%4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": "; 
		cout << hex << setw(2) << setfill('0') << int(data_memory[i]) << " ";
		if (i%4 == 3){
			cout << endl;
		}
	} 
}

/* prints the value of the registers */
void sim_ooo::print_registers(){
        unsigned i;
	cout << "GENERAL PURPOSE REGISTERS" << endl;
	cout << setfill(' ') << setw(8) << "Register" << setw(22) << "Value" << setw(5) << "ROB" << endl;
        for (i=0; i< NUM_GP_REGISTERS; i++){
                if (get_int_register_tag(i)!=UNDEFINED) 
			cout << setfill(' ') << setw(7) << "R" << dec << i << setw(22) << "-" << setw(5) << get_int_register_tag(i) << endl;
                else if (get_int_register(i)!=(int)UNDEFINED) 
			cout << setfill(' ') << setw(7) << "R" << dec << i << setw(11) << get_int_register(i) << hex << "/0x" << setw(8) << setfill('0') << get_int_register(i) << setfill(' ') << setw(5) << "-" << endl;
        }
	for (i=0; i< NUM_GP_REGISTERS; i++){
                if (get_fp_register_tag(i)!=UNDEFINED) 
			cout << setfill(' ') << setw(7) << "F" << dec << i << setw(22) << "-" << setw(5) << get_fp_register_tag(i) << endl;
                else if (float2unsigned(get_fp_register(i))!=UNDEFINED) 
			cout << setfill(' ') << setw(7) << "F" << dec << i << setw(11) << get_fp_register(i) << hex << "/0x" << setw(8) << setfill('0') << float2unsigned(get_fp_register(i)) << setfill(' ') << setw(5) << "-" << endl;
	}
	cout << endl;
}

/* prints the content of the ROB */
void sim_ooo::print_rob(){
	cout << "REORDER BUFFER" << endl;
	cout << setfill(' ') << setw(5) << "Entry" << setw(6) << "Busy" << setw(7) << "Ready" << setw(12) << "PC" << setw(10) << "State" << setw(6) << "Dest" << setw(12) << "Value" << endl;
	for(unsigned i=0; i< rob.num_entries;i++){
		rob_entry_t entry = rob.entries[i];
		instruction_t instruction;
		if (entry.pc != UNDEFINED) instruction = instr_memory[(entry.pc-instr_base_address)>>2]; 
		cout << setfill(' ');
		cout << setw(5) << i;
		cout << setw(6);
		if (entry.pc==UNDEFINED) cout << "no"; else cout << "yes";
		cout << setw(7);
		if (entry.ready) cout << "yes"; else cout << "no";	
		if (entry.pc!= UNDEFINED ) cout << "  0x" << hex << setfill('0') << setw(8) << entry.pc;
		else	cout << setw(12) << "-";
		cout << setfill(' ') << setw(10);
		if (entry.pc==UNDEFINED) cout << "-";		
		else cout << stage_names[entry.state];
		if (entry.destination==UNDEFINED) cout << setw(6) << "-";
		else{
			if (instruction.opcode == SW || instruction.opcode == SWS)
				cout << setw(6) << dec << entry.destination; 
			else if (entry.destination < NUM_GP_REGISTERS)
				cout << setw(5) << "R" << dec << entry.destination;
			else
				cout << setw(5) << "F" << dec << entry.destination-NUM_GP_REGISTERS;
		}
		if (entry.value!=UNDEFINED) cout << "  0x" << hex << setw(8) << setfill('0') << entry.value << endl;	
		else cout << setw(12) << setfill(' ') << "-" << endl;
	}
	cout << endl;
}

/* prints the content of the reservation stations */
void sim_ooo::print_reservation_stations(){
	cout << "RESERVATION STATIONS" << endl;
	cout  << setfill(' ');
	cout << setw(7) << "Name" << setw(6) << "Busy" << setw(12) << "PC" << setw(12) << "Vj" << setw(12) << "Vk" << setw(6) << "Qj" << setw(6) << "Qk" << setw(6) << "Dest" << setw(12) << "Address" << endl; 
	for(unsigned i=0; i< reservation_stations.num_entries;i++){
		res_station_entry_t entry = reservation_stations.entries[i];
	 	cout  << setfill(' ');
		cout << setw(6); 
		cout << res_station_names[entry.type];
		cout << entry.name + 1;
		cout << setw(6);
		if (entry.pc==UNDEFINED) cout << "no"; else cout << "yes";
		if (entry.pc!= UNDEFINED ) cout << setw(4) << "  0x" << hex << setfill('0') << setw(8) << entry.pc;
		else	cout << setfill(' ') << setw(12) <<  "-";			
		if (entry.value1!= UNDEFINED ) cout << "  0x" << setfill('0') << setw(8) << hex << entry.value1;
		else	cout << setfill(' ') << setw(12) << "-";			
		if (entry.value2!= UNDEFINED ) cout << "  0x" << setfill('0') << setw(8) << hex << entry.value2;
		else	cout << setfill(' ') << setw(12) << "-";			
		cout << setfill(' ');
		cout <<setw(6);
		if (entry.tag1!= UNDEFINED ) cout << dec << entry.tag1;
		else	cout << "-";			
		cout <<setw(6);
		if (entry.tag2!= UNDEFINED ) cout << dec << entry.tag2;
		else	cout << "-";			
		cout <<setw(6);
		if (entry.destination!= UNDEFINED ) cout << dec << entry.destination;
		else	cout << "-";			
		if (entry.address != UNDEFINED ) cout <<setw(4) << "  0x" << setfill('0') << setw(8) << hex << entry.address;
		else	cout << setfill(' ') << setw(12) <<  "-";			
		cout << endl;	
	}
	cout << endl;
}

/* prints the state of the pending instructions */
void sim_ooo::print_pending_instructions(){
	cout << "PENDING INSTRUCTIONS STATUS" << endl;
	cout << setfill(' ');
	cout << setw(10) << "PC" << setw(7) << "Issue" << setw(7) << "Exe" << setw(7) << "WR" << setw(7) << "Commit";
	cout << endl;
	for(unsigned i=0; i< pending_instructions.num_entries;i++){
		instr_window_entry_t entry = pending_instructions.entries[i];
		if (entry.pc!= UNDEFINED ) cout << "0x" << setfill('0') << setw(8) << hex << entry.pc;
		else	cout << setfill(' ') << setw(10)  << "-";
		cout << setfill(' ');
		cout << setw(7);			
		if (entry.issue!= UNDEFINED ) cout << dec << entry.issue;
		else	cout << "-";			
		cout << setw(7);			
		if (entry.exe!= UNDEFINED ) cout << dec << entry.exe;
		else	cout << "-";			
		cout << setw(7);			
		if (entry.wr!= UNDEFINED ) cout << dec << entry.wr;
		else	cout << "-";			
		cout << setw(7);			
		if (entry.commit!= UNDEFINED ) cout << dec << entry.commit;
		else	cout << "-";
		cout << endl;			
	}
	cout << endl;
}


/* initializes the execution log */
void sim_ooo::init_log(){
	log << "EXECUTION LOG" << endl;
	log << setfill(' ');
	log << setw(10) << "PC" << setw(7) << "Issue" << setw(7) << "Exe" << setw(7) << "WR" << setw(7) << "Commit";
	log << endl;
}

/* adds an instruction to the log */
void sim_ooo::commit_to_log(instr_window_entry_t entry){
                if (entry.pc!= UNDEFINED ) log << "0x" << setfill('0') << setw(8) << hex << entry.pc;
                else    log << setfill(' ') << setw(10)  << "-";
                log << setfill(' ');
                log << setw(7);
                if (entry.issue!= UNDEFINED ) log << dec << entry.issue;
                else    log << "-";
                log << setw(7);
                if (entry.exe!= UNDEFINED ) log << dec << entry.exe;
                else    log << "-";
                log << setw(7);
                if (entry.wr!= UNDEFINED ) log << dec << entry.wr;
                else    log << "-";
                log << setw(7);
                if (entry.commit!= UNDEFINED ) log << dec << entry.commit;
                else    log << "-";
                log << endl;
}

/* prints the content of the log */
void sim_ooo::print_log(){
	cout << log.str();
}

/* prints the state of the pending instruction, the content of the ROB, the content of the reservation stations and of the registers */
void sim_ooo::print_status(){
	print_pending_instructions();
	print_rob();
	print_reservation_stations();
	print_registers();
}

/* execution statistics */

float sim_ooo::get_IPC(){return (float)instructions_executed/clock_cycles;}

unsigned sim_ooo::get_instructions_executed(){return instructions_executed;}

unsigned sim_ooo::get_clock_cycles(){return clock_cycles;}



/* ============================================================================

   PARSER

   =========================================================================== */


void sim_ooo::load_program(const char *filename, unsigned base_address){

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
		case AND:
		case MULT:
		case DIV:
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
   
   PC = instr_base_address;
}

/* ============================================================================

   Simulator creation, initialization and deallocation 

   =========================================================================== */

sim_ooo::sim_ooo(unsigned mem_size,
                unsigned rob_size,
                unsigned num_int_res_stations,
                unsigned num_add_res_stations,
                unsigned num_mul_res_stations,
                unsigned num_load_res_stations,
		unsigned max_issue){
	//memory
	data_memory_size = mem_size;
	data_memory = new unsigned char[data_memory_size];

	//issue width
	issue_width = max_issue;

	//rob, instruction window, reservation stations
	rob.num_entries=rob_size;
	pending_instructions.num_entries=rob_size;
	reservation_stations.num_entries= num_int_res_stations+num_load_res_stations+num_add_res_stations+num_mul_res_stations;
	rob.entries = new rob_entry_t[rob_size];
	pending_instructions.entries = new instr_window_entry_t[rob_size];
	reservation_stations.entries = new res_station_entry_t[reservation_stations.num_entries];
	unsigned n=0;
	for (unsigned i=0; i<num_int_res_stations; i++,n++){
		reservation_stations.entries[n].type=INTEGER_RS;
		reservation_stations.entries[n].name=i;
	}
	for (unsigned i=0; i<num_load_res_stations; i++,n++){
		reservation_stations.entries[n].type=LOAD_B;
		reservation_stations.entries[n].name=i;
	}
	for (unsigned i=0; i<num_add_res_stations; i++,n++){
		reservation_stations.entries[n].type=ADD_RS;
		reservation_stations.entries[n].name=i;
	}
	for (unsigned i=0; i<num_mul_res_stations; i++,n++){
		reservation_stations.entries[n].type=MULT_RS;
		reservation_stations.entries[n].name=i;
	}
	//execution units
	num_units = 0;
	reset();
}
	
sim_ooo::~sim_ooo(){
	delete [] data_memory;
	delete [] rob.entries;
	delete [] pending_instructions.entries;
	delete [] reservation_stations.entries;
}

/* =============================================================

   CODE TO BE COMPLETED

   ============================================================= */

/* core of the simulator */
void sim_ooo::run(unsigned cycles){	

    bool Runtoend = (cycles == 0);
   
    while (cycles-- || Runtoend) {
    	
       	Commit();
       	WriteResult();
       	Execute();
       	if(Issue()) {
       		clock_cycles++;
       		return;
       	}
        clock_cycles++;
    }
}

bool sim_ooo::Issue() { // clear rob and res entry at the end of ISSUE because i+1 cycle available
    instruction_t Ins;
    opcode_t opcode;
    bool end = false;

	for (unsigned i = 0; i < issue_width; i++) {

        
        Ins = instr_memory [(PC-instr_base_address)>>2];
        opcode = Ins.opcode;

        if (opcode == EOP) {
            eop_pc = PC; // record eop's pc
        }

        // STALL if rob is full
		unsigned rob_entry = get_free_rob();
		if (rob_entry == UNDEFINED) {
			// ------------clear res-----------------
	if (wr_tag_load != UNDEFINED) clear_res(wr_tag_load); // clear res at beginning because of i+1 cycle
	wr_tag_load = UNDEFINED;
	for (unsigned i = 0; i < wr_tag_count; i++) {
        if (wr_tag[i] != UNDEFINED) {
        	clear_res(wr_tag[i]);
        	wr_tag[i] = UNDEFINED;
        }
	}
	wr_tag_count = 0;
	//-------------clear rob----------------
	if (commit_tag != UNDEFINED) {
		instructions_executed++;
		//commit_to_log(pending_instructions.entries[commit_tag]);
		if ((rob.entries[commit_tag].pc == eop_pc - 4) && (!mispredict)) end = true;
	    clear_rob(commit_tag); // clear rob 
	    clear_window(commit_tag);
	    commit_tag = UNDEFINED;
	}
	//-------------mispredict?------------
	if (mispredict) {
        PC = BRANCH_PC;
        //print_pending_instructions();
        for (unsigned i = 1; i <= ((flush_log_value - flush_log_pc)>>2); i++) {
            for (unsigned j = 0; j < rob.num_entries; j++)
            if ((pending_instructions.entries[j].pc == (flush_log_pc + i*4))) commit_to_log(pending_instructions.entries[j]);
        }
		flush_all(); 
    }
	      return end;
	  }

        unsigned res_entry = get_free_res(opcode);
        // STALL if res are full
        if (res_entry == UNDEFINED) {
    // ------------clear res-----------------
	if (wr_tag_load != UNDEFINED) clear_res(wr_tag_load); // clear res at ISSUE because of i+1 cycle
	wr_tag_load = UNDEFINED;
	for (unsigned i = 0; i < wr_tag_count; i++) {
        if (wr_tag[i] != UNDEFINED) {
        	clear_res(wr_tag[i]);
        	wr_tag[i] = UNDEFINED;
        }
	}
	wr_tag_count = 0;
	//-------------clear rob----------------
	if (commit_tag != UNDEFINED) {
		instructions_executed++;
		//commit_to_log(pending_instructions.entries[commit_tag]);
		if ((rob.entries[commit_tag].pc == eop_pc - 4) && (!mispredict)) end = true;
	    clear_rob(commit_tag); // clear rob 
	    clear_window(commit_tag);
	    commit_tag = UNDEFINED;
	}
	//-------------mispredict?------------
	if (mispredict) {
        PC = BRANCH_PC;
        //print_pending_instructions();
        for (unsigned i = 1; i <= ((flush_log_value - flush_log_pc)>>2); i++) {
            for (unsigned j = 0; j < rob.num_entries; j++)
            if ((pending_instructions.entries[j].pc == (flush_log_pc + i*4))) commit_to_log(pending_instructions.entries[j]);
        }
		flush_all(); 
    }
        	return end;
        }
        write_res(res_entry, rob_entry, Ins, PC);
        write_rob(rob_entry, Ins, PC);

        rob.entries[rob_entry].state = ISSUE;
      //  write_res(res_entry, rob_entry, Ins, PC);
        write_window(rob_entry, ISSUE);
        //commit_to_log(pending_instructions.entries[rob_entry]);
        
        //instructions_executed++;
        PC = PC + 4;
	}	
// ------------clear res-----------------
	if (wr_tag_load != UNDEFINED) clear_res(wr_tag_load); // clear res at beginning because of i+1 cycle
	wr_tag_load = UNDEFINED;
	for (unsigned i = 0; i < wr_tag_count; i++) {
        if (wr_tag[i] != UNDEFINED) {
        	clear_res(wr_tag[i]);
        	wr_tag[i] = UNDEFINED;
        }
	}
	wr_tag_count = 0;
	//-------------clear rob----------------
	if (commit_tag != UNDEFINED) {
		instructions_executed++;
		if ((rob.entries[commit_tag].pc == eop_pc - 4) && (!mispredict)) end = true;
	    clear_rob(commit_tag); // clear rob 
	    clear_window(commit_tag);
	    commit_tag = UNDEFINED;
	}
	//-------------mispredict?------------
	if (mispredict) {
        PC = BRANCH_PC;
        for (unsigned i = 1; i <= ((flush_log_value - flush_log_pc)>>2); i++) {
            for (unsigned j = 0; j < rob.num_entries; j++)
            if ((pending_instructions.entries[j].pc == (flush_log_pc + i*4))) commit_to_log(pending_instructions.entries[j]);
        }
        //print_pending_instructions();
		flush_all(); 
	}

	


	return end;
}

void sim_ooo::Execute(){

    // *************select instructions from res to go into exe units************
    for (unsigned i = 0; i < reservation_stations.num_entries; i++) {

    	//res_station_entry_t res_entry = reservation_stations.entries[i];
    	opcode_t opcode = reservation_stations.entries[i].opcode;
       
    	if (reservation_stations.entries[i].busy == true) { 
    	   if (reservation_stations.entries[i].pc == mem_ins.pc) continue;
    	   bool executing = false;
    	   for (unsigned j=0; j<num_units; j++) {
    	   	if (exec_units[j].pc == reservation_stations.entries[i].pc) executing = true;
    	   }
    	   if (executing) continue;
    	//-------check for RAW----------
    	   if (reservation_stations.entries[i].tag1 != UNDEFINED && reservation_stations.entries[i].pc != rob.entries[reservation_stations.entries[i].tag1].pc 
    	       && !rob.entries[reservation_stations.entries[i].tag1].ready) continue; // check if operands are ready (RAW)
           if (reservation_stations.entries[i].tag2 != UNDEFINED && reservation_stations.entries[i].pc != rob.entries[reservation_stations.entries[i].tag2].pc 
               && !rob.entries[reservation_stations.entries[i].tag2].ready) continue;

           	if (opcode == LW || opcode == LWS) {
           		bool potential_conf_store = false;
           		for (unsigned k = 0; k < rob.num_entries; k++) {
           			if (rob.entries[k].pc < reservation_stations.entries[i].pc && (rob.entries[k].opcode == SW || rob.entries[k].opcode == SWS) && rob.entries[k].state < EXECUTE)
           				potential_conf_store = true;
           		}
           		if (potential_conf_store) continue;
           	}
    	   unsigned u = get_free_unit(opcode);
    	   
    	   if (u == UNDEFINED) {
    	   	   continue;
    	   }
    	   else {
    	   	exec_units[u].busy = exec_units[u].latency + 1;
    	   	exec_units[u].pc   = reservation_stations.entries[i].pc;
    	   	rob.entries[get_rob_entry(reservation_stations.entries[i].pc)].state = EXECUTE;
    	   	write_window(get_rob_entry(reservation_stations.entries[i].pc), EXECUTE);
    	   	if (op_type(opcode) == MEMO) {
    	   		exec_units[u].busy = 2;
    	   		//print_reservation_stations();
    	   		if (opcode == LW || opcode == LWS) reservation_stations.entries[i].address = reservation_stations.entries[i].address + reservation_stations.entries[i].value1;
    	   		if (opcode == SW || opcode == SWS) {     
    	   			reservation_stations.entries[i].address = reservation_stations.entries[i].address + reservation_stations.entries[i].value2;
    	   		    rob.entries[reservation_stations.entries[i].destination].destination = reservation_stations.entries[i].address; // SW and SWS instruction update rob.dest at first cycle of EXE
    	   		}
    	   	}
    	   }
    	}
    }
    // ************end of selection**************
    decrement_units_busy_time();
    // ------------update rob and res-----------------
	if (update_load.rob_entry != UNDEFINED) {
	    update_rob(update_load.rob_entry, update_load.output); // update rob and res at EXE because of i+1 cycle
	    update_res(update_load.rob_entry, update_load.output);
	    update_load.rob_entry = UNDEFINED;
	    update_load.output    = UNDEFINED;
	}
	

	for (unsigned i = 0; i < MAX_UNITS; i++) {
        if (update[i].rob_entry != UNDEFINED) {
        	update_rob(update[i].rob_entry, update[i].output);
        	update_res(update[i].rob_entry, update[i].output);
        	update[i].rob_entry = UNDEFINED;
	        update[i].output    = UNDEFINED;
        }
	}

}

void sim_ooo::WriteResult(){


//-------------find finished exe units--------------
    for (unsigned i = 0; i < num_units; i++) {
    	if (exec_units[i].busy == 1/*&& exec_units[i].pc != UNDEFINED*/) { // execution finished
    		unsigned s = get_res_entry(exec_units[i].pc);
    		unsigned b = get_rob_entry(exec_units[i].pc);
    		opcode_t opcode = rob.entries[b].opcode;
    		
    		if (opcode == LW || opcode == LWS) {
    			unsigned address = reservation_stations.entries[s].address;
    			unsigned bypass_value = check_bypass(address, exec_units[i].pc); // check if this load can be bypassed
    			if (bypass_value != UNDEFINED) {
    				output[i] = bypass_value;
    				rob.entries[b].state = WRITE_RESULT;
    				write_window(b, WRITE_RESULT);
    			}
    			else {
    			
                if (mem_ins.pc != UNDEFINED) exec_units[i].busy = 2; // mem access occupied
                else { // mem access available
                	write_mem_access(exec_units[i].pc, true);
                	exec_units[i].busy = 0;
                }
                continue; // continue because load cannot bypass so no WR happens for this load
    			}
    		}
    		else {
                rob.entries[b].state = WRITE_RESULT;
                write_window(b, WRITE_RESULT);
    		    if (opcode == SW || opcode == SWS) {
                    exec_units[i].busy = 0;
    		        output[i] = reservation_stations.entries[s].value1; // store update rob.value with data to be stored
    		    }
                else output[i] = alu(reservation_stations.entries[s].opcode, reservation_stations.entries[s].value1, reservation_stations.entries[s].value2, reservation_stations.entries[s].label, exec_units[i].pc);
    		}
    		
    		update[i].rob_entry = b;
            update[i].output    = output[i];

    		wr_tag[wr_tag_count] = s;
    		wr_tag_count++;
    	}

    }


//--------------check if mem accessing load is finished------------------
    if (mem_ins.busy == 0 && mem_ins.is_load) { // load finishes accessing mem

    	unsigned load_res = get_res_entry(mem_ins.pc);
    	unsigned load_rob = get_rob_entry(mem_ins.pc);


    	unsigned load_out = read_memory(reservation_stations.entries[load_res].address);

    	rob.entries[load_rob].state = WRITE_RESULT;
    	write_window(load_rob, WRITE_RESULT);

    	clear_mem_access();

        update_load.rob_entry = load_rob;
        update_load.output    = load_out;

    	wr_tag_load = load_res;
    }
// load is accessing mem
    if (mem_ins.is_load) decrement_mem_access_time();

    if (store_begin && mem_ins.pc == UNDEFINED){ // LOAD first
        write_mem_access(store_pc, false); // SW starts accessing mem
    	rob.entries[store_tag].state = COMMIT;
    	write_window(store_tag, COMMIT);
    	commit_to_log(pending_instructions.entries[store_tag]);
    }

}

unsigned sim_ooo::check_bypass(unsigned address, unsigned pc) {
	for (unsigned i = 0; i < rob.num_entries; i++) {
		if ((rob.entries[i].opcode == SW || rob.entries[i].opcode == SWS) && rob.entries[i].pc < pc && rob.entries[i].destination == address)
			return rob.entries[i].value; // can there be two SWs?
	}
	return UNDEFINED;
}

unsigned sim_ooo::get_rob_entry(unsigned pc) {
	for (unsigned i = 0; i < rob.num_entries; i++) {
		if (rob.entries[i].pc == pc) return i;
	}
	return UNDEFINED;
}

void sim_ooo::update_rob(unsigned b, unsigned output) {
    rob.entries[b].value = output;
    rob.entries[b].ready = true;
}

unsigned sim_ooo::get_res_entry(unsigned pc) {
	for (unsigned i = 0; i < reservation_stations.num_entries; i++) {
		if (reservation_stations.entries[i].pc == pc) return i;
	}
	return UNDEFINED;
}


void sim_ooo::update_res(unsigned b, unsigned output) {
	for (unsigned i = 0; i < reservation_stations.num_entries; i++) {
		if (reservation_stations.entries[i].tag1 == b) {
			reservation_stations.entries[i].value1 = output;
			reservation_stations.entries[i].tag1   = UNDEFINED;
		}
		if (reservation_stations.entries[i].tag2 == b) {
			reservation_stations.entries[i].value2 = output;
			reservation_stations.entries[i].tag2   = UNDEFINED;
		}
	}
}

void sim_ooo::clear_res(unsigned tag) {
	reservation_stations.entries[tag].pc      = UNDEFINED;
	reservation_stations.entries[tag].value1  = UNDEFINED;
	reservation_stations.entries[tag].value2  = UNDEFINED;
	reservation_stations.entries[tag].tag1    = UNDEFINED;
	reservation_stations.entries[tag].tag2    = UNDEFINED;
	reservation_stations.entries[tag].destination = UNDEFINED;
	reservation_stations.entries[tag].address = UNDEFINED;
	reservation_stations.entries[tag].busy    = false;
}

void sim_ooo::clear_rob(unsigned tag) {
	opcode_t opcode = rob.entries[tag].opcode;

	if (opcode != SW && opcode != SWS && op_type(opcode) != BRANCH) {
		if (rob.entries[tag].pc == renaming_table[rob.entries[tag].destination].pc)  {
			renaming_table[rob.entries[tag].destination].tag = UNDEFINED;
		    renaming_table[rob.entries[tag].destination].pc = UNDEFINED;
		}
	}

	rob.entries[tag].busy = false;
	rob.entries[tag].ready = false;
   	rob.entries[tag].pc      = UNDEFINED;
    rob.entries[tag].destination = UNDEFINED;
    rob.entries[tag].value = UNDEFINED;

}

void sim_ooo::clear_window(unsigned tag) {
	pending_instructions.entries[tag].pc = UNDEFINED;
	pending_instructions.entries[tag].issue = UNDEFINED;
   	pending_instructions.entries[tag].exe      = UNDEFINED;
    pending_instructions.entries[tag].wr = UNDEFINED;
    pending_instructions.entries[tag].commit = UNDEFINED;
} 


void sim_ooo::Commit() {

	mispredict = false;
    store_begin = false;
    store_pc = UNDEFINED;
	store_tag = UNDEFINED;
	flush_log_value = UNDEFINED;
	flush_log_pc = UNDEFINED;

//------------find ins to COMMIT--------
    unsigned pc = rob.entries[0].pc;
    unsigned tag = 0;

    for (unsigned i = 0; i < rob.num_entries; i++) {
    	if (rob.entries[i].pc < pc) {
    		pc = rob.entries[i].pc;
    		tag = i;
    	}
    }
    if (rob.entries[tag].ready) {
    	commit_tag = tag; 
    	opcode_t opcode = rob.entries[tag].opcode;
    	unsigned dest = rob.entries[tag].destination;
    	unsigned value = rob.entries[tag].value;
    	//pc = rob.entries[tag].pc;


    	switch (op_type(opcode)) {
    	case MEMO:
    	    rob.entries[tag].state = COMMIT;
    	    if (opcode == LW) {
    	    	set_int_register(dest, value);
    	    	rob.entries[tag].state = COMMIT;
    	    	write_window(tag, COMMIT);
    	    	commit_to_log(pending_instructions.entries[tag]);
    	    }
    	    if (opcode == LWS) {
    	    	set_fp_register(dest - NUM_GP_REGISTERS, unsigned2float(value));
    	    	rob.entries[tag].state = COMMIT;
    	    	write_window(tag, COMMIT);
    	    	commit_to_log(pending_instructions.entries[tag]);
    	    }
    	    if (opcode == SW || opcode == SWS) {
    	    	if (mem_ins.pc != UNDEFINED) { // memory access is occupied
    	    		if (mem_ins.pc != pc) commit_tag = UNDEFINED; // certain load is accessing mem, SW cannot be cleared from rob in this cycle
    	    		else { // this store is accessing mem
    	    			if (mem_ins.busy == 2) { // this store has just finished, commit
    	    				write_memory(dest, value);
    	    				clear_mem_access();
    	    			}
    	    			else { // this store has not finished, SW cannot be cleared from rob in this cycle
                            commit_tag = UNDEFINED; 
    	    			}
    	    		}
    	    	}
    	    	else { // mem access available
    	    		store_begin = true;
    	    		store_pc = pc;
	                store_tag = tag;
    	    		commit_tag = UNDEFINED; // SW cannot be cleared from rob in this cycle
    	    	}
    	    }
    	    break;
    	case ARITH: 
    	case ARITHI:
            set_int_register(dest, value);
            rob.entries[tag].state = COMMIT;
            write_window(tag, COMMIT);
            commit_to_log(pending_instructions.entries[tag]);
            break;
        case BRANCH:
            	if (value != pc + 4) {
            		rob.entries[tag].state = COMMIT;
                    write_window(tag, COMMIT);
                    commit_to_log(pending_instructions.entries[tag]);
                    flush_log_value = value;
	                flush_log_pc = pc;
            		/*for (unsigned i = 1; i <= ((value - pc)>>2); i++) {
            			for (unsigned j = 0; j < rob.num_entries; j++)
            			if ((pending_instructions.entries[j].pc == (pc + i*4))) commit_to_log(pending_instructions.entries[j]);
            		}*/
            		mispredict = true;
            		BRANCH_PC = value;
            	}
            	else {
            		rob.entries[tag].state = COMMIT;
                    write_window(tag, COMMIT);
                    commit_to_log(pending_instructions.entries[tag]);
            	}
            break;
        case FP:
            set_fp_register(dest - NUM_GP_REGISTERS, unsigned2float(value));
            rob.entries[tag].state = COMMIT;
            write_window(tag, COMMIT);
            commit_to_log(pending_instructions.entries[tag]);
            break;
        }
    }

    if (!mem_ins.is_load) decrement_mem_access_time(); // decrement store's access time

}

// if mispredict then flush all
void sim_ooo::flush_all() {
	flush_rob();
	flush_exe();
	flush_res();
	flush_window();
	flush_renaming();
}

// flush
void sim_ooo::flush_rob() {
	for (unsigned i = 0; i < rob.num_entries; i++) {
		//rob_entry_t r = rob.entries[i];
		rob.entries[i].busy = false;
		rob.entries[i].ready = false;
		rob.entries[i].pc = UNDEFINED;
		rob.entries[i].destination = UNDEFINED;
		rob.entries[i].value = UNDEFINED;
		last_free_rob_entry = 0;
	}
}

void sim_ooo::flush_exe() {
	for (unsigned i = 0; i < num_units; i++) {
		exec_units[i].busy = 0;
		exec_units[i].pc = UNDEFINED;
	}
}

void sim_ooo::flush_res() {
	for (unsigned i = 0; i < reservation_stations.num_entries; i++) {
		reservation_stations.entries[i].busy = false;
		reservation_stations.entries[i].pc = UNDEFINED;
		reservation_stations.entries[i].value1 = UNDEFINED;
		reservation_stations.entries[i].value2 = UNDEFINED;
		reservation_stations.entries[i].tag1 = UNDEFINED;
		reservation_stations.entries[i].tag2 = UNDEFINED;
		reservation_stations.entries[i].destination = UNDEFINED;
		reservation_stations.entries[i].address = UNDEFINED;
	}
}

void sim_ooo::flush_window() {
	for (unsigned i = 0; i < rob.num_entries; i++) {
		pending_instructions.entries[i].pc = UNDEFINED;
		pending_instructions.entries[i].issue = UNDEFINED;
		pending_instructions.entries[i].exe = UNDEFINED;
		pending_instructions.entries[i].wr = UNDEFINED;
		pending_instructions.entries[i].commit = UNDEFINED;
	}
}

void sim_ooo::flush_renaming() {
	for (int i = 0; i<2*NUM_GP_REGISTERS; i++){
		renaming_table[i].tag = UNDEFINED;
		renaming_table[i].pc = UNDEFINED;
	}
}

//reset the state of the simulator - please complete
void sim_ooo::reset(){

	//init instruction log
	init_log();	

	// data memory
	for (unsigned i=0; i<data_memory_size; i++) data_memory[i] = 0xFF;
	
	//instr memory
	for (int i=0; i<PROGRAM_SIZE;i++) {
		instr_memory[i].opcode=(opcode_t)EOP;
		instr_memory[i].src1=UNDEFINED;
		instr_memory[i].src2=UNDEFINED;
		instr_memory[i].dest=UNDEFINED;
		instr_memory[i].immediate=UNDEFINED;
	}

	//general purpose registers
    for (int i = 0; i<NUM_GP_REGISTERS; i++){
		gp_int_register[i] = UNDEFINED;
	}
	for (int i = 0; i<NUM_GP_REGISTERS; i++){
		gp_fp_register[i] = UNDEFINED;
	}

	flush_renaming();

	//pending_instructions
    flush_window();
	//rob
    flush_rob();
	//reservation_stations
    flush_res();

	//execution statistics
	clock_cycles = 0;
	instructions_executed = 0;

	//other required initializations
	commit_tag = UNDEFINED;
	wr_tag_load = UNDEFINED;
	wr_tag_count = 0;

    last_free_rob_entry = 0;


	for (unsigned i = 0; i < MAX_UNITS; i++)
		wr_tag[i] = UNDEFINED;

	update_load.rob_entry = UNDEFINED;
	update_load.output    = UNDEFINED;
	for (unsigned i = 0; i < MAX_UNITS; i++) {
		update[i].rob_entry = UNDEFINED;
		update[i].output   = UNDEFINED;
	}

	mispredict = false;

	mem_ins.pc = UNDEFINED;
	mem_ins.busy = 0;
	BRANCH_PC = 0;
}

// get available rob entry
unsigned sim_ooo::get_free_rob() {
	unsigned size  = rob.num_entries;

	for (unsigned i = last_free_rob_entry; i < size; i++) {
		if (!rob.entries[i].busy) {
            last_free_rob_entry = i;
			return i;
		}
	}
    
    for (unsigned i = 0; i < last_free_rob_entry; i++){
    	if (!rob.entries[i].busy) {
            last_free_rob_entry = i;
			return i;
		}    }
    return UNDEFINED;
}

// get available resevation station entry
unsigned sim_ooo::get_free_res(opcode_t opcode) {
    unsigned size = reservation_stations.num_entries;

    switch (opcode) {	
    	case SW:
    	case SWS:
    	case LW:
    	case LWS:
    	    for (unsigned i = 0; i < size; i++) {
    	    	if (reservation_stations.entries[i].type == LOAD_B && !reservation_stations.entries[i].busy) return i;
    	    }
    	    break;
        case ADD:
		case ADDI:
		case SUB:
		case SUBI:
		case XOR:
		case AND:
		case BEQZ:
		case BNEZ:
		case BLTZ:
		case BGTZ:
		case BLEZ:
		case BGEZ:
		case JUMP:
		    for (unsigned i = 0; i < size; i++) {
    	    	if (reservation_stations.entries[i].type == INTEGER_RS && !reservation_stations.entries[i].busy) return i;
    	    }
    	    break;
    	case ADDS:
		case SUBS:
		    for (unsigned i = 0; i < size; i++) {
    	    	if (reservation_stations.entries[i].type == ADD_RS && !reservation_stations.entries[i].busy) return i;
    	    }
    	    break;
    	case MULTS:
    	case DIVS:
    	    for (unsigned i = 0; i < size; i++) {
    	    	if (reservation_stations.entries[i].type == MULT_RS && !reservation_stations.entries[i].busy) return i;
    	    }
    	    break;
    	default:
    	    break;
    }
    return UNDEFINED;
}


// write rob
void sim_ooo::write_rob(unsigned i, instruction_t Ins, unsigned PC) {
 	opcode_t opcode = Ins.opcode;

    rob.entries[i].ready = false;
    rob.entries[i].busy = true;
    rob.entries[i].pc    = PC;
    rob.entries[i].state = ISSUE;
    rob.entries[i].opcode = opcode; 

 	switch (opcode) {
    	case ADD:
		case ADDI:
		case SUB:
		case SUBI:
		case XOR:
		case AND:
    	case LW:
    	    rob.entries[i].destination = Ins.dest;
    	    rob.entries[i].operand_is_int = true;
    	    renaming_table[Ins.dest].tag = i;
    	    renaming_table[Ins.dest].pc = PC;
    	    break;
    	case LWS:
		case ADDS:
		case SUBS:
		case MULTS:
    	case DIVS:
    	    rob.entries[i].destination = Ins.dest + NUM_GP_REGISTERS;
    	    rob.entries[i].operand_is_int = false;
    	    renaming_table[Ins.dest + NUM_GP_REGISTERS].tag = i;
    	    renaming_table[Ins.dest + NUM_GP_REGISTERS].pc = PC;
    	    break;
    	default:
    	    break;
 	}
 }

// get available resevation station entry
void sim_ooo::write_res(unsigned res_entry, unsigned rob_entry, instruction_t Ins, unsigned PC) {
	opcode_t opcode = Ins.opcode;
	//res_station_entry_t res_free = reservation_stations.entries[res_entry];
    
    reservation_stations.entries[res_entry].pc     = PC;
    reservation_stations.entries[res_entry].busy   = true;
    reservation_stations.entries[res_entry].opcode = opcode; 
    reservation_stations.entries[res_entry].destination = rob_entry;


    switch (opcode) {
    	unsigned j , k;
    	case SW:
    	    j = get_renaming_tag(Ins.src1, true);
    	    k = get_renaming_tag(Ins.src2, true);
    	    if (j != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag1   = rob.entries[j].ready? UNDEFINED : j;
    	        reservation_stations.entries[res_entry].value1 = rob.entries[j].ready? rob.entries[j].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag1   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value1 = get_int_register(Ins.src1);
    	    }
    	    if (k != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag2   = rob.entries[k].ready? UNDEFINED : k;
    	        reservation_stations.entries[res_entry].value2 = rob.entries[k].ready? rob.entries[k].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag2   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value2 = get_int_register(Ins.src2);
    	    }
    	    reservation_stations.entries[res_entry].address = Ins.immediate;
            break;

    	case SWS:
            j = get_renaming_tag(Ins.src1 + NUM_GP_REGISTERS, true);
    	    k = get_renaming_tag(Ins.src2, false);
    	    if (j != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag1   = rob.entries[j].ready? UNDEFINED : j;
    	        reservation_stations.entries[res_entry].value1 = rob.entries[j].ready? rob.entries[j].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag1   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value1 = float2unsigned(get_fp_register(Ins.src1));
    	    }
    	    if (k != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag2   = rob.entries[k].ready? UNDEFINED : k;
    	        reservation_stations.entries[res_entry].value2 = rob.entries[k].ready? rob.entries[k].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag2   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value2 = get_int_register(Ins.src2);
    	    }
            reservation_stations.entries[res_entry].address = Ins.immediate;
            break;

    	case LW:
    	    j = get_renaming_tag(Ins.src1, true);
    	    if (j != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag1   = rob.entries[j].ready? UNDEFINED : j;
    	        reservation_stations.entries[res_entry].value1 = rob.entries[j].ready? rob.entries[j].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag1   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value1 = get_int_register(Ins.src1);
    	    }
            //reservation_stations.entries[res_entry].tag1    = get_renaming_tag(Ins.src1, true);
            reservation_stations.entries[res_entry].tag2    = UNDEFINED;
            //reservation_stations.entries[res_entry].value1  = (reservation_stations.entries[res_entry].tag1 == UNDEFINED)? get_int_register(Ins.src1) : UNDEFINED;
            reservation_stations.entries[res_entry].value2  = UNDEFINED;
            //res_free.destination = Ins.destination;
            reservation_stations.entries[res_entry].address = Ins.immediate;
            reservation_stations.entries[res_entry].des_is_int = true;
            break;
    	case LWS:
    	    j = get_renaming_tag(Ins.src1, true);
    	    if (j != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag1   = rob.entries[j].ready? UNDEFINED : j;
    	        reservation_stations.entries[res_entry].value1 = rob.entries[j].ready? rob.entries[j].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag1   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value1 = get_int_register(Ins.src1);
    	    }
        //    reservation_stations.entries[res_entry].tag1    = get_renaming_tag(Ins.src1, true);
            reservation_stations.entries[res_entry].tag2    = UNDEFINED;
        //    reservation_stations.entries[res_entry].value1  = (reservation_stations.entries[res_entry].tag1 == UNDEFINED)? get_int_register(Ins.src1) : UNDEFINED;
            reservation_stations.entries[res_entry].value2  = UNDEFINED;
            //res_free.destination = Ins.destination;
            reservation_stations.entries[res_entry].address = Ins.immediate;
            reservation_stations.entries[res_entry].des_is_int = false;
            break;

        case ADD:
		case SUB:
		case XOR:
		case AND:
		    j = get_renaming_tag(Ins.src1, true);
    	    k = get_renaming_tag(Ins.src2, true);
    	    if (j != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag1   = rob.entries[j].ready? UNDEFINED : j;
    	    	if (rob.entries[j].pc == reservation_stations.entries[res_entry].pc) reservation_stations.entries[res_entry].tag1 = UNDEFINED;
    	        reservation_stations.entries[res_entry].value1 = rob.entries[j].ready? rob.entries[j].value : UNDEFINED;

    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag1   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value1 = get_int_register(Ins.src1);
    	    }
    	    if (k != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag2   = rob.entries[k].ready? UNDEFINED : k;
    	    	if (rob.entries[k].pc == reservation_stations.entries[res_entry].pc) reservation_stations.entries[res_entry].tag2 = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value2 = rob.entries[k].ready? rob.entries[k].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag2   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value2 = get_int_register(Ins.src2);
    	    }
           // reservation_stations.entries[res_entry].tag1    = get_renaming_tag(Ins.src1, true);
            //reservation_stations.entries[res_entry].tag2    = get_renaming_tag(Ins.src2, true);
            //reservation_stations.entries[res_entry].value1  = (reservation_stations.entries[res_entry].tag1 == UNDEFINED)? get_int_register(Ins.src1) : UNDEFINED;
            //reservation_stations.entries[res_entry].value2  = (reservation_stations.entries[res_entry].tag2 == UNDEFINED)? get_int_register(Ins.src2) : UNDEFINED;
            //res_free.destination = Ins.destination;
            reservation_stations.entries[res_entry].des_is_int = true;
            break;
		case ADDI:
		case SUBI:
		    j = get_renaming_tag(Ins.src1, true);
		    if (j != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag1   = rob.entries[j].ready? UNDEFINED : j;
    	        reservation_stations.entries[res_entry].value1 = rob.entries[j].ready? rob.entries[j].value : UNDEFINED;
    	        if (rob.entries[j].pc == reservation_stations.entries[res_entry].pc) reservation_stations.entries[res_entry].value1 = get_int_register(Ins.src1);
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag1   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value1 = get_int_register(Ins.src1);
    	    }
            //reservation_stations.entries[res_entry].tag1    = get_renaming_tag(Ins.src1, true);
            //reservation_stations.entries[res_entry].value1  = (reservation_stations.entries[res_entry].tag1 == UNDEFINED)? get_int_register(Ins.src1) : UNDEFINED;
            reservation_stations.entries[res_entry].label  = Ins.immediate;
            //res_free.destination = Ins.destination;
            reservation_stations.entries[res_entry].des_is_int = true;
            break;
		case BEQZ:
		case BNEZ:
		case BLTZ:
		case BGTZ:
		case BLEZ:
		case BGEZ:
		    j = get_renaming_tag(Ins.src1, true);
		    if (j != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag1   = rob.entries[j].ready? UNDEFINED : j;
    	        reservation_stations.entries[res_entry].value1 = rob.entries[j].ready? rob.entries[j].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag1   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value1 = get_int_register(Ins.src1);
    	    }
           // reservation_stations.entries[res_entry].tag1    = get_renaming_tag(Ins.src1, true);
           // reservation_stations.entries[res_entry].value1  = (reservation_stations.entries[res_entry].tag1 == UNDEFINED)? get_int_register(Ins.src1) : UNDEFINED;
            reservation_stations.entries[res_entry].label = Ins.immediate;
            break;
		case JUMP:
            reservation_stations.entries[res_entry].label = Ins.immediate;
            break;
    	case ADDS:
		case SUBS:
    	case MULTS:
    	case DIVS:
    	    j = get_renaming_tag(Ins.src1 + NUM_GP_REGISTERS, false);
    	    k = get_renaming_tag(Ins.src2 + NUM_GP_REGISTERS, false);
    	    if (j != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag1   = rob.entries[j].ready? UNDEFINED : j;
    	        reservation_stations.entries[res_entry].value1 = rob.entries[j].ready? rob.entries[j].value : UNDEFINED;
    	        if (rob.entries[j].pc == reservation_stations.entries[res_entry].pc) reservation_stations.entries[res_entry].value1 = float2unsigned(get_fp_register(Ins.src1));
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag1   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value1 = float2unsigned(get_fp_register(Ins.src1));
    	    }
    	    if (k != UNDEFINED) {
    	    	reservation_stations.entries[res_entry].tag2   = rob.entries[k].ready? UNDEFINED : k;
    	        reservation_stations.entries[res_entry].value2 = rob.entries[k].ready? rob.entries[k].value : UNDEFINED;
    	    }
    	    else {
    	    	reservation_stations.entries[res_entry].tag2   = UNDEFINED;
    	    	reservation_stations.entries[res_entry].value2 = float2unsigned(get_fp_register(Ins.src2));
    	    }
           //reservation_stations.entries[res_entry].tag1    = get_renaming_tag(Ins.src1 + NUM_GP_REGISTERS, false);
            //reservation_stations.entries[res_entry].tag2    = get_renaming_tag(Ins.src2 + NUM_GP_REGISTERS, false);
           //reservation_stations.entries[res_entry].value1  = (reservation_stations.entries[res_entry].tag1 == UNDEFINED)? float2unsigned(get_fp_register(Ins.src1)) : UNDEFINED;
           // reservation_stations.entries[res_entry].value2  = (reservation_stations.entries[res_entry].tag2 == UNDEFINED)? float2unsigned(get_fp_register(Ins.src2)) : UNDEFINED;
            //res_free.destination = Ins.destination;
            reservation_stations.entries[res_entry].des_is_int = false;
            break;
    	default:
    	    break;
    }
}

// write pending ins
void sim_ooo::write_window(unsigned rob_entry, stage_t stage) {
    switch (stage) {
    	case ISSUE: 
    	    pending_instructions.entries[rob_entry].pc     = rob.entries[rob_entry].pc;
    	    pending_instructions.entries[rob_entry].issue  = clock_cycles;
    	    break;
    	case EXECUTE:
            pending_instructions.entries[rob_entry].exe    = clock_cycles;
            break;
        case WRITE_RESULT:
            pending_instructions.entries[rob_entry].wr     = clock_cycles;
            break;
        case COMMIT:
            pending_instructions.entries[rob_entry].commit = clock_cycles;
            break;
    }
}
// mem access record
void sim_ooo::write_mem_access(unsigned pc, bool is_load){
    mem_ins.pc = pc;
    mem_ins.is_load = is_load;
    mem_ins.busy = memory_latency;
}

void sim_ooo::decrement_mem_access_time(){
	if (mem_ins.busy != UNDEFINED) mem_ins.busy--;
}

void sim_ooo::clear_mem_access(){
	mem_ins.pc = UNDEFINED;
	mem_ins.busy = UNDEFINED;
}

// renaming
unsigned sim_ooo::get_renaming_tag(unsigned src, bool is_int) {
/*	unsigned size = rob.num_entries;

	for (unsigned i = 0; i < size; i++) {
        if (rob.entries[i].destination == src && rob.entries[i].operand_is_int == is_int)
        	return i;
	}

	return UNDEFINED;*/
	return renaming_table[src].tag;
}



//return type of instruction
unsigned sim_ooo::op_type(opcode_t op) {
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
	else if (op == EOP)
		return SYS;
	return UNKNOWN;
}

// read mem
unsigned sim_ooo::read_memory(unsigned address) {
   unsigned value = 0;
   value |= data_memory[address + 0];
   value |= data_memory[address + 1] << 8;  
   value |= data_memory[address + 2] << 16;
   value |= data_memory[address + 3] << 24;
   return value;
}

// busy--
void sim_ooo::decrement_units_busy_time(){
	for (unsigned u=0; u<num_units; u++){
		if (exec_units[u].busy > 0) exec_units[u].busy --;
	}
}

/* registers related */

int sim_ooo::get_int_register(unsigned reg){
	return gp_int_register[reg];
}

void sim_ooo::set_int_register(unsigned reg, unsigned value){
	gp_int_register[reg] = value;
}

float sim_ooo::get_fp_register(unsigned reg){
	return unsigned2float(gp_fp_register[reg]); 
}

void sim_ooo::set_fp_register(unsigned reg, float value){
	gp_fp_register[reg] = float2unsigned(value);
}


unsigned sim_ooo::get_int_register_tag(unsigned reg){
	for (unsigned i = 0; i < rob.num_entries; i++) {
		if (rob.entries[i].destination == reg && rob.entries[i].operand_is_int) return i;
	}
	return UNDEFINED; 
}

unsigned sim_ooo::get_fp_register_tag(unsigned reg){
    for (unsigned i = 0; i < rob.num_entries; i++) {
		if ((rob.entries[i].destination == reg + NUM_GP_REGISTERS) && !rob.entries[i].operand_is_int) return i;
	}
	return UNDEFINED; 
}


