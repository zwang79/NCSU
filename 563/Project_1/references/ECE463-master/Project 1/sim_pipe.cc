//ECE 463 Project 1
//Author William Shaw email wtshaw@ncsu.edu

#include "sim_pipe.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
#include <stdio.h>


using namespace std;

//used for debugging purposes
static const char *reg_names[NUM_SP_REGISTERS] = {"PC", "NPC", "IR", "A", "B", "IMM", "COND", "ALU_OUTPUT", "LMD"};
static const char *stage_names[NUM_STAGES] = {"IF", "ID", "EX", "MEM", "WB"};

sim_pipe::sim_pipe(unsigned mem_size, unsigned mem_latency)
{
	data_memory = new int[mem_size];
	for (unsigned i = 0; i<mem_size; i++)
	{
		data_memory[i] = 0xFF;
	}
	data_memory_size = mem_size;
	eop = false;
	reset();
}
	
sim_pipe::~sim_pipe()
{
	delete(data_memory);
}

void sim_pipe::load_program(const char *filename, unsigned base_address)
{
	instruction_memory = new unsigned int[base_address + 100];
	for (unsigned i = 0; i<base_address + 100; i++)
	{
		instruction_memory[i] = 0x00;
	}

	string line;
	ifstream program(filename, ios::in | ios::binary);

	if (program.is_open())
	{
		unsigned i = base_address;
		base_Address = base_address;
		instruction_memory_size = base_address;

		string param, offset, address;
		string labelTable[BTABLE];
		unsigned addressTable[BTABLE];
		unsigned table_index = 0, index, reg;
		unsigned space1, space2, space3;

		//gets all the label in the program
		while (getline(program, line))
		{
			if (line.find(':') < line.length())
			{
				string label = line.substr(0, line.find(':'));
				labelTable[table_index] = label;
				addressTable[table_index] = i;
				table_index++;
			}
			i++;
		}

		//close and reopen asm file
		program.close();
		i = base_address;
		ifstream program(filename, ios::in | ios::binary);


		//gets assembley code and decodes into instruction memory
		while (getline(program, line))
		{
			//getline(program,line);
			index = 0;
			index = get_first_letter(line, index);
			space1 = find_end_of_argument(line, index);
			if (space1 == 0xFFFFFFFF) // end of file
			{
				instruction_memory[i] += EOP;
				instruction_memory[i] = instruction_memory[i] << 26;
				break;
			}
			string opcode = line.substr(index, space1 - index);
			if (line.find(':') < line.length())
			{
				index = get_first_letter(line, space1); // line.find_first_of('	', index + 1);
				space1 = find_end_of_argument(line, index);
				opcode = line.substr(index, space1 - index);
			}

			if (opcode == "LW" || opcode == "SW")
			{
				//load opcode
				if (opcode == "LW")
				{
					instruction_memory[i] += LW;
				}
				if (opcode == "SW")
				{
					instruction_memory[i] += SW;
				}
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rs
				space2 = get_first_letter(line, space1);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 16;
				//load offset
				space2 = get_first_letter(line, space3);
				space3 = line.find_first_of('(', space2);
				offset = line.substr(space2, space3 - space2);
				reg = strtoul(offset.c_str(), NULL, 10);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load base
				space2 = space3;
				space3 = line.find_first_of(')', space2);
				param = line.substr(space2, space3 - space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
			}
			else if (opcode == "ADD" || opcode == "SUB" || opcode == "XOR" || opcode == "OR"
				|| opcode == "AND" || opcode == "MULT" || opcode == "DIV")
			{
				//load opcode
				if (opcode == "ADD")
				{
					instruction_memory[i] += ADD;
				}
				else if (opcode == "SUB")
				{
					instruction_memory[i] += SUB;
				}
				else if (opcode == "XOR")
				{
					instruction_memory[i] += XOR;
				}
				else if (opcode == "OR")
				{
					instruction_memory[i] += OR;
				}
				else if (opcode == "AND")
				{
					instruction_memory[i] += AND;
				}
				else if (opcode == "MULT")
				{
					instruction_memory[i] += MULT;
				}
				else if (opcode == "DIV")
				{
					instruction_memory[i] += DIV;
				}
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rs
				space2 = get_first_letter(line, space1);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rt
				space2 = get_first_letter(line, space3);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rd
				space2 = get_first_letter(line, space3);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 11;
			}
			else if (opcode == "ADDI" || opcode == "SUBI" || opcode == "XORI"
				|| opcode == "ORI" || opcode == "ANDI")
			{
				//load opcode
				if (opcode == "ADDI")
				{
					instruction_memory[i] += ADDI;
				}
				else if (opcode == "SUBI")
				{
					instruction_memory[i] += SUBI;
				}
				else if (opcode == "XORI")
				{
					instruction_memory[i] += XORI;
				}
				else if (opcode == "ORI")
				{
					instruction_memory[i] += ORI;
				}
				else if (opcode == "ANDI")
				{
					instruction_memory[i] += ANDI;
				}

				instruction_memory[i] = instruction_memory[i] << 5;
				//load rs
				space2 = get_first_letter(line, space1);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rt
				space2 = get_first_letter(line, space3);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 16;
				//load immediate
				space2 = get_first_letter(line, space3);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				unsigned imm = convert_string_to_number(param);// convert string hex to int
				instruction_memory[i] += imm;
			}
			else if (opcode == "BEQZ" || opcode == "BNEZ" || opcode == "BLTZ"
				|| opcode == "BGTZ" || opcode == "BLEZ" || opcode == "BGEZ")
			{
				//load opcode
				if (opcode == "BEQZ")
				{
					instruction_memory[i] += BEQZ;
				}
				else if (opcode == "BNEZ")
				{
					instruction_memory[i] += BNEZ;
				}
				else if (opcode == "BLTZ")
				{
					instruction_memory[i] += BLTZ;
				}
				else if (opcode == "BGTZ")
				{
					instruction_memory[i] += BGTZ;
				}
				else if (opcode == "BLEZ")
				{
					instruction_memory[i] += BLEZ;
				}
				else if (opcode == "BGEZ")
				{
					instruction_memory[i] += BGEZ;
				}
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rs
				space2 = get_first_letter(line, space1);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 21;
				//get address
				space2 = get_first_letter(line, space3);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				for (int j = 0; j<BTABLE; j++)
				{
					if (param.compare(labelTable[j]) == 0)
					{
						unsigned reduced_address = addressTable[j] - base_Address;
						instruction_memory[i] += reduced_address;
						break;
					}
				}
			}
			else if (opcode == "JUMP")
			{
				instruction_memory[i] += JUMP;
				instruction_memory[i] = instruction_memory[i] << 26;

				space2 = get_first_letter(line, space1);
				space3 = find_end_of_argument(line, space2);
				param = line.substr(space2, space3 - space2);
				for (int j = 0; j<BTABLE; j++)
				{
					if (param.compare(labelTable[j]) == 0)
					{
						unsigned reduced_address = addressTable[j] - base_Address;
						instruction_memory[i] += reduced_address;
						break;
					}
				}
			}
			else if (opcode == "EOP")
			{
				//load opcode
				instruction_memory[i] += EOP;
				instruction_memory[i] = instruction_memory[i] << 26;
			}
			else if (opcode == "NOP")
			{
				instruction_memory[i] += NOP;
				instruction_memory[i] = instruction_memory[i] << 26;
			}
			else
			{

			}

			unsigned answer = instruction_memory[i];
			answer = answer;
			i++;
		}
		pc = base_address;
		program.close();

	}
	else
	{
		instruction_count++;
		return;
	}

}

void sim_pipe::run(unsigned cycles)
{
	if (cycles == 0)
	{
		while (!eop)
		{
			writeBack();			//executes each stage in reverse order so the 
			memory();				//writing after each stage doesn't affect the 
			execute();				//input of the previous stage.
			decode();
			fetch();
			clock_cycles++;
		}
	}
	else //run for select amount of cycles
	{
		unsigned i;
		for (i = 0; i<cycles; i++)
		{
			writeBack();			//executes each stage in reverse order so the 
			memory();				//writing after each stage doesn't affect the 
			execute();				//input of the previous stage.
			decode();
			fetch();
			clock_cycles++;
		}
	}
}
	
void sim_pipe::reset()
{
	for (int i = 0; i<NUM_SP_REGISTERS; i++)
	{
		if_id_pipe[i] = UNDEFINED;
		id_ex_pipe[i] = UNDEFINED;
		ex_mem_pipe[i] = UNDEFINED;
		mem_wb_pipe[i] = UNDEFINED;
	}

	for (int i = 0; i<NUM_GP_REGISTERS; i++)
	{
		gp_reg[i] = UNDEFINED;
	}

	for (int i = 0; i < MAX_STALL; i++)
	{
		stall_table[i] = UNDEFINED;
	}
	clock_cycles = 0;
	instruction_count = 0;
}

unsigned sim_pipe::get_sp_register(sp_register_t reg, stage_t s){
	unsigned sp_reg = 0;
	int i = (int)reg;
	switch ((int)s)
	{
	case 0:
		sp_reg = if_id_pipe[i];
	break;
	case 1:
		sp_reg = if_id_pipe[i];
	break;
	case 2:
		sp_reg = id_ex_pipe[i];
	break;
	case 3:
		sp_reg = ex_mem_pipe[i];
	break;
	case 4:
		sp_reg = mem_wb_pipe[i];
	break;
	}
	return sp_reg;
}

int sim_pipe::get_gp_register(unsigned reg)
{
	int i = (int)reg;
	return gp_reg[i];
}

void sim_pipe::set_gp_register(unsigned reg, int value)
{
	gp_reg[reg] = value;
}

float sim_pipe::get_IPC()
{
	return instruction_count / clock_cycles;
}

unsigned sim_pipe::get_instructions_executed()
{
	return (unsigned)instruction_count;
}

unsigned sim_pipe::get_stalls()
{
	return (unsigned)stalls;
}

unsigned sim_pipe::get_clock_cycles()
{
	return (unsigned) clock_cycles;
}

void sim_pipe::print_memory(unsigned start_address, unsigned end_address){
	cout << "data_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8) << setfill('0') <<  end_address << "]" << endl;
	unsigned i;
	for (i=start_address; i<end_address; i++){
		if (i%4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": "; 
		cout << hex << setw(2) << setfill('0') << int(data_memory[i]) << " ";
		if (i%4 == 3) cout << endl;
	} 
}

void sim_pipe::write_memory(unsigned address, unsigned value)
{
	data_memory[address + 0] = value & 0xFF;
	data_memory[address + 1] = (value & 0xFF00) >> 8;
	data_memory[address + 2] = (value & 0xFF0000) >> 16;
	data_memory[address + 3] = (value & 0xFF000000) >> 24;
	//data_memory[address] = value;
}

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
		if (get_gp_register(i)!=UNDEFINED) cout << "R" << dec << i << " = " << get_gp_register(i) << hex << " / 0x" << get_gp_register(i) << endl;
}

void sim_pipe::print_instruction_memory(unsigned start_address, unsigned end_address) {
	cout << "instruction_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8) << setfill('0') << end_address << "]" << endl;
	unsigned i;
	for (i = instruction_memory_size; i<instruction_memory_size + 100; i++) {
		if (i % 1 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": ";
		cout << hex << setw(2) << setfill('0') << int(instruction_memory[i]) << " ";
		if (i % 4 == 3) cout << endl;
	}
}

void sim_pipe::fetch()//gets instruction from memory
{
	if (stalled)
	{
		//Do Nothing
	}
	else
	{
		if (id_ex_pipe[COND] == 1)
		{
			pc = id_ex_pipe[IMM];// output of computation of branch
		}
		if_id_pipe[IR] = instruction_memory[pc]; //load instruction
		if_id_pipe[NPC] = pc + 1; //increments PC by 1 and stores in NPC	
		if_id_pipe[PC] = pc;
		pc = if_id_pipe[NPC];
	}
	for (int i = 0; i < NUM_SP_REGISTERS; i++)
	{
		if (i != PC && i != NPC && i != IR)
		{
			if_id_pipe[i] = UNDEFINED;
		}
	}
}

void sim_pipe::decode()//decodes instruction and sets up execution
{
	unsigned opcode = if_id_pipe[IR] >> 26; //copys and shifts IR into temp variable
	unsigned a = UNDEFINED, b = UNDEFINED;
	stalled = false;
	if (opcode == LW || opcode == SW)
	{
		a = (if_id_pipe[IR] & 31);
	}
	else if (opcode == ADD || opcode == SUB || opcode == XOR || opcode == OR
		|| opcode == AND || opcode == MULT || opcode == DIV)
	{
		a = ((if_id_pipe[IR] >> 16) & 31);
		b = ((if_id_pipe[IR] >> 11) & 31);
	}
	else if (opcode == ADDI || opcode == SUBI || opcode == XORI
		|| opcode == ORI || opcode == ANDI)
	{
		a = ((if_id_pipe[IR] >> 16) & 31);
	}
	else if (opcode == BEQZ || opcode == BNEZ || opcode == BLTZ
		|| opcode == BGTZ || opcode == BLEZ || opcode == BGEZ)
	{
		a = ((if_id_pipe[IR] >> 21) & 31);
	}
	
	for (int i = 0; i < MAX_STALL; i++)
	{
		if ((a == stall_table[i] || b == stall_table[i]) && stall_table[i] != UNDEFINED)
		{
			stalled = true;
			stalls++;
			break;
		}
	}
	if (stalled)		// if stalled write nothing into the next pipeline register
	{
		for (int i = 0; i < NUM_SP_REGISTERS; i++)
		{
			id_ex_pipe[i] = UNDEFINED;
		}
		for (int i = 0; i < MAX_STALL - 1; i++) // shifts the stall table down one 
		{
			stall_table[i] = stall_table[i + 1];
		}
		stall_table[MAX_STALL - 1] = UNDEFINED;
	}
	else
	{
		id_ex_pipe[COND] = 0;
		if (opcode == LW || opcode == SW)
		{
			id_ex_pipe[A] = gp_reg[(if_id_pipe[IR] & 31)];
			id_ex_pipe[B] = ((if_id_pipe[IR] >> 21) & 31);
			id_ex_pipe[IMM] = ((if_id_pipe[IR] >> 5) & 65535);
		}
		else if (opcode == ADD || opcode == SUB || opcode == XOR || opcode == OR
			|| opcode == AND || opcode == MULT || opcode == DIV)
		{
			id_ex_pipe[A] = gp_reg[((if_id_pipe[IR] >> 16) & 31)];
			id_ex_pipe[B] = gp_reg[((if_id_pipe[IR] >> 11) & 31)];
			id_ex_pipe[IMM] = UNDEFINED;
		}
		else if (opcode == ADDI || opcode == SUBI || opcode == XORI
			|| opcode == ORI || opcode == ANDI)
		{
			id_ex_pipe[A] = gp_reg[((if_id_pipe[IR] >> 16) & 31)];
			id_ex_pipe[B] = UNDEFINED;
			id_ex_pipe[IMM] = (if_id_pipe[IR] & 65535);
		}
		else if (opcode == BEQZ || opcode == BNEZ || opcode == BLTZ
			|| opcode == BGTZ || opcode == BLEZ || opcode == BGEZ)
		{
			id_ex_pipe[A] = gp_reg[((if_id_pipe[IR] >> 21) & 31)];
			id_ex_pipe[B] = UNDEFINED;
			id_ex_pipe[IMM] = (if_id_pipe[IR] & 65535) + base_Address;
			if (branchIf(opcode, id_ex_pipe[A]))
			{
				id_ex_pipe[COND] = 1;
				id_ex_pipe[NPC] = (if_id_pipe[IR] & 65535) + base_Address;
			}
		}
		else if (opcode == JUMP)
		{
			id_ex_pipe[A] = UNDEFINED;
			id_ex_pipe[B] = UNDEFINED;
			id_ex_pipe[COND] = 1;
			id_ex_pipe[IMM] = (if_id_pipe[IR] & 65535) + base_Address;
			id_ex_pipe[NPC] = (if_id_pipe[IR] & 65535) + base_Address;
		}
		else if (opcode == NOP)
		{
			id_ex_pipe[A] = UNDEFINED;
			id_ex_pipe[B] = UNDEFINED;
			id_ex_pipe[IMM] = UNDEFINED;
		}
		else if (opcode == EOP)
		{
			id_ex_pipe[A] = UNDEFINED;
			id_ex_pipe[B] = UNDEFINED;
			id_ex_pipe[IMM] = UNDEFINED;
		}
		for (int i = 0; i < MAX_STALL - 1; i++) // shifts the stall table down one 
		{
			stall_table[i] = stall_table[i + 1];
		}
		if (opcode == SW || opcode == BEQZ || opcode == BNEZ || opcode == BLTZ
			|| opcode == BGTZ || opcode == BLEZ || opcode == BGEZ || opcode == JUMP
			|| opcode == NOP || opcode == EOP)
		{
			stall_table[MAX_STALL - 1] = UNDEFINED;
		}
		else
		{
			stall_table[MAX_STALL - 1] = ((if_id_pipe[IR] >> 21) & 31); // insterts the register we are writing to into the stall table
		}
		for (int i = 0; i < NUM_SP_REGISTERS; i++)
		{
			if (i != A && i != B && i!= IMM && i != COND && i != ALU_OUTPUT)
			{
				id_ex_pipe[i] = if_id_pipe[i];
			}
		}
	}
}

void sim_pipe::execute()//executes the instruction
{
	unsigned opcode = id_ex_pipe[IR] >> 26; //copys and shifts IR into temp variable
	if (opcode == LW || opcode == SW)
	{
		ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] + id_ex_pipe[IMM];
	}
	else if (opcode == ADD || opcode == SUB || opcode == XOR || opcode == OR
		|| opcode == AND || opcode == MULT || opcode == DIV)
	{
		if (opcode == ADD)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] + id_ex_pipe[B];
		}
		else if (opcode == SUB)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] - id_ex_pipe[B];
		}
		else if (opcode == XOR)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] ^ id_ex_pipe[B];
		}
		else if (opcode == OR)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] | id_ex_pipe[B];
		}
		else if (opcode == AND)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] & id_ex_pipe[B];
		}
		else if (opcode == MULT)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] * id_ex_pipe[B];
		}
		else if (opcode == DIV)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] / id_ex_pipe[B];
		}
	}
	else if (opcode == ADDI || opcode == SUBI || opcode == XORI
		|| opcode == ORI || opcode == ANDI)
	{
		if (opcode == ADDI)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] + id_ex_pipe[IMM];
		}
		else if (opcode == SUBI)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] - id_ex_pipe[IMM];
		}
		else if (opcode == XORI)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] ^ id_ex_pipe[IMM];
		}
		else if (opcode == ORI)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] | id_ex_pipe[IMM];
		}
		else if (opcode == ANDI)
		{
			ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[A] & id_ex_pipe[IMM];
		}
	}
	else if (opcode == BEQZ || opcode == BNEZ || opcode == BLTZ
		|| opcode == BGTZ || opcode == BLEZ || opcode == BGEZ
		|| opcode == JUMP || opcode == NOP || opcode == EOP)
	{
		ex_mem_pipe[ALU_OUTPUT] = id_ex_pipe[ALU_OUTPUT];
	}
	for (int i = 0; i < NUM_SP_REGISTERS; i++)
	{
		if (i != ALU_OUTPUT)
		{
			ex_mem_pipe[i] = id_ex_pipe[i];
		}
	}
}

void sim_pipe::memory()//load, store or branch
{
	unsigned opcode = ex_mem_pipe[IR] >> 26; //copys and shifts IR into temp variable
	
	if (opcode == LW)
	{
		unsigned value = 0;
		value += data_memory[ex_mem_pipe[ALU_OUTPUT] + 3];
		value = value << 8;
		value += data_memory[ex_mem_pipe[ALU_OUTPUT] + 2];
		value = value << 8;
		value += data_memory[ex_mem_pipe[ALU_OUTPUT] + 1];
		value = value << 8;
		value += data_memory[ex_mem_pipe[ALU_OUTPUT] + 0];

		ex_mem_pipe[LMD] = value;
		gp_reg[mem_wb_pipe[B]] = mem_wb_pipe[LMD];
	}
	else if (opcode == SW)
	{
		//if (gp_reg[ex_mem_pipe[B]] > 0xFF)
		{
			int data = gp_reg[ex_mem_pipe[B]];
			data_memory[ex_mem_pipe[ALU_OUTPUT] + 0] = data & 0xFF;
			data_memory[ex_mem_pipe[ALU_OUTPUT] + 1] = (data & 0xFF00) >> 8;
			data_memory[ex_mem_pipe[ALU_OUTPUT] + 2] = (data & 0xFF0000) >> 16;
			data_memory[ex_mem_pipe[ALU_OUTPUT] + 3] = (data & 0xFF000000) >> 24;
		}
		//else
		{
		//	data_memory[ex_mem_pipe[ALU_OUTPUT]] = gp_reg[ex_mem_pipe[B]];
		}
		
	}
	for (int i = 0; i < NUM_SP_REGISTERS; i++)
	{
		mem_wb_pipe[i] = ex_mem_pipe[i];
	}
}

void sim_pipe::writeBack()// write back result to registers
{
	unsigned opcode = mem_wb_pipe[IR] >> 26; //copys and shifts IR into temp variable
	if (opcode == LW)
	{
		gp_reg[mem_wb_pipe[B]] = mem_wb_pipe[LMD];
	}
	else if (opcode == ADD || opcode == SUB || opcode == XOR || opcode == OR
		|| opcode == AND || opcode == MULT || opcode == DIV || opcode == ADDI
		|| opcode == SUBI || opcode == XORI || opcode == ORI || opcode == ANDI)
	{
		gp_reg[((mem_wb_pipe[IR] >> 21) & 31)] = mem_wb_pipe[ALU_OUTPUT];
	}
	else if (opcode == EOP)
	{
		eop = true;
		clock_cycles -= 1;
		instruction_count -=  1;
	}
	if (opcode != 63)
	{
		instruction_count++;
	}
}

unsigned sim_pipe::get_register_value(std::string str)
{
	unsigned rIndex = str.find_first_of('R');
	string reg = str.substr(rIndex + 1);
	int value = strtoul(reg.c_str(), NULL, 10);
	return value;
}

unsigned sim_pipe::get_first_letter(std::string str, unsigned start)

{
	unsigned index = start;
	unsigned i;
	for (i = start; i < str.length(); i++)
	{
		if (str[i] != '	' && str[i] != ' ')
		{
			index = i;
			break;
		}
	}
	return index;
}

unsigned sim_pipe::find_end_of_argument(std::string str, unsigned start)
{
	unsigned index = start;
	unsigned i;
	for (i = start; i < str.length(); i++)
	{
		if (str[i] == '	' || str[i] == ' ')
		{
			index = i;
			break;
		}
	}
	if (i == str.length())
	{
		index = str.length() + 1;
	}
	return index;
}

int sim_pipe::convert_string_to_number(std::string str)
{
	int imm = 0;
	if (str.find('b') < str.length())
	{
		str = str.substr(2);
		imm = strtoul(str.c_str(), NULL, 2);
	}
	else if ((str.find('x') < str.length()) || (str.find('X') < str.length()))
	{
		str = str.substr(2);
		imm = strtoul(str.c_str(), NULL, 16);
	}
	else if (str.find('d') < str.length()) 
	{
		str = str.substr(2);
		imm = strtoul(str.c_str(), NULL, 10);
	}
	else
	{
		str = str.substr(0);
		imm = strtoul(str.c_str(), NULL, 10);
	}
	return imm;
}

bool sim_pipe::branchIf(unsigned opcode, unsigned a)
{
	bool condition = false;
	if (opcode == BEQZ && a == 0)
	{
		condition = true;
	}
	else if (opcode == BNEZ && a != 0)
	{
		condition = true;
	}
	else if (opcode == BLTZ && a < 0)
	{
		condition = true;
	}
	else if (opcode == BGTZ && a > 0)
	{
		condition = true;
	}
	else if (opcode == BLEZ && a <= 0)
	{
		condition = true;
	}
	else if (opcode == BGEZ && a >= 0)
	{
		condition = true;
	}
	return condition;
}