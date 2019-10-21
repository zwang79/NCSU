#include "sim.h"
#include <stdlib.h>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <string.h>
#include <stdio.h>

/*
SP registers (sp_reg[?])
PC = 0					
NPC = 1					
IR = 2
A = 3
B = 4
IMM = 5
COND = 6
ALU_OUTPUT = 7
LMD = 8
*/

using namespace std;

//used for debugging purposes
static const char *reg_names[NUM_SP_REGISTERS] = {"PC", "NPC", "IR", "A", "B", "IMM", "COND", "ALU_OUTPUT", "LMD"};

sim::sim(unsigned mem_size)
{
	data_memory = new unsigned char[mem_size];
	for(unsigned i=0;i<mem_size;i++)
	{
		data_memory[i] = 0xFF;
	}
	data_memory_size = mem_size;
	
	instruction_memory = new unsigned int[mem_size*2];
	for(unsigned i=0;i<mem_size*2;i++)
	{
		instruction_memory[i] = 0x00;
	}
	
	reset();
	
	stage = 0;
}
	
sim::~sim()
{
	delete(data_memory);
}

void sim::load_program(const char *filename, unsigned base_address)
{
	string line;
	ifstream program(filename, ios::in|ios::binary);

	if(program.is_open())
	{
		unsigned i = base_address;
		instruction_memory_size = base_address;

		string line, param, offset, address;
		string labelTable[BTABLE];
		unsigned addressTable[BTABLE];
		unsigned table_index = 0, index = 0, reg;
		unsigned space1,space2,space3,space4;
		while(!program.eof())
		{
			getline(program,line);
			space1 = line.find(' ');
			string opcode = line.substr(index,space1);
			if(opcode.find(':') != -1)
			{
				labelTable[table_index] = opcode.substr(0,opcode.find(':')-1);
				addressTable[table_index] = i;
				table_index++;
				index = space1;
				space1 = line.find_first_of(' ',index);
				opcode = line.substr(index,space1);
			}
			
			if(opcode == "LW")
			{
				//load opcode
				instruction_memory[i] += LW;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load address
				space3 = line.find_first_of('(',space2);
				offset = line.substr(space2,space3);
				space4 = line.find_first_of(')',space3);
				param = line.substr(space3,space4);
				
				
			}
			else if(opcode == "SW")
			{
				//load opcode
				instruction_memory[i] += SW;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load address
				space3 = line.find_first_of('(',space2);
				offset = line.substr(space2,space3);
				space4 = line.find_first_of(')',space3);
				param = line.substr(space3,space4);
				
			}
			else if(opcode == "ADD")
			{
				//load opcode
				instruction_memory[i] += ADD;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rt
				space3 = line.find_first_of(' ',space2);
				param = line.substr(space2,space3);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rd
				space4 = line.find_first_of(' ',space3);
				param = line.substr(space3,space4);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 11;
			}
			else if(opcode == "SUB")
			{
				//load opcode
				instruction_memory[i] += SUB;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rt
				space3 = line.find_first_of(' ',space2);
				param = line.substr(space2,space3);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rd
				space4 = line.find_first_of(' ',space3);
				param = line.substr(space3,space4);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 11;
			}
			else if(opcode == "XOR")
			{
				//load opcode
				instruction_memory[i] += XOR;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rt
				space3 = line.find_first_of(' ',space2);
				param = line.substr(space2,space3);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rd
				space4 = line.find_first_of(' ',space3);
				param = line.substr(space3,space4);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 11;
			}
			else if(opcode == "ADDI")
			{
				//load opcode
				instruction_memory[i] += ADDI;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rt
				space3 = line.find_first_of(' ',space2);
				param = line.substr(space2,space3);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 16;
				//load immediate
				space3 = line.find_first_of('x',space2);
				space4 = line.find_first_of(' ',space3+1); 
				param = line.substr(space4);
				int imm = std::stoi(param,&space3,16);// convert string hex to int
				instruction_memory[i] += imm;
				
			}
			else if(opcode == "SUBI")
			{
				//load opcode
				instruction_memory[i] += SUBI;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//load rt
				space3 = line.find_first_of(' ',space2);
				param = line.substr(space2,space3);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 16;
				//load immediate
				space3 = line.find_first_of('x',space2);
				space4 = line.find_first_of(' ',space3+1); 
				param = line.substr(space4);
				int imm = std::stoi(param,&space3,16);// convert string hex to int
				instruction_memory[i] += imm;
			}
			else if(opcode == "BNEZ")
			{
				//load opcode
				instruction_memory[i] += BNEZ;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//get address
				space3 = line.find_first_of(' ',space2);
				param = line.substr(space2,space3);

				for(int j=0;j<BTABLE;j++)
				{
					if(param == labelTable[j])
					{
						instruction_memory[i] += addressTable[j];
						instruction_memory[i] = instruction_memory[i] << 21;
						break;
					}
				}
			}
			else if(opcode == "BLTZ")
			{
				//load opcode
				instruction_memory[i] += BLTZ;
				instruction_memory[i] = instruction_memory[i] << 6;
				//load rs
				space2 = line.find_first_of(' ',space1);
				param = line.substr(space1,space2);
				reg = get_register_value(param);
				instruction_memory[i] += reg;
				instruction_memory[i] = instruction_memory[i] << 5;
				//get address
				space3 = line.find_first_of(' ',space2);
				param = line.substr(space2,space3);

				for(int j=0;j<BTABLE;j++)
				{
					if(param == labelTable[j])
					{
						instruction_memory[i] += addressTable[j];
						instruction_memory[i] = instruction_memory[i] << 21;
						break;
					}
				}
			}
			else if(opcode == "EOP")
			{
				//load opcode
				instruction_memory[i] += EOP;
				instruction_memory[i] = instruction_memory[i] << 26;
			}
			else
			{
				
			}
			
			i++;
		}
		sp_reg[0] = base_address;
		program.close();
		
	}
	else
	{
		instruction_count++;
		return;
	}
	
}

void sim::run(unsigned cycles)
{
	if(cycles == 0)
	{
		while(false) //find condition to stop running!
		{
			switch(stage)
			{
				case 0: fetch();
				break;
				
				case 1: decode();
				break;
				
				case 2: execute();
				break;
				
				case 3: memory();
				break;
				
				case 4: writeBack();
						instruction_count++;
				break;
				
				default:
				break;
			}
			clock_cycles++;
		}
	}
	else //run for select amount of cycles
	{
		unsigned i;
		for(i=0;i<cycles;i++)
		{
			switch(stage)
			{
				case 0: fetch();
				break;
				
				case 1: decode();
				break;
				
				case 2: execute();
				break;
				
				case 3: memory();
				break;
				
				case 4: writeBack();
						instruction_count++;
				break;
				
				default:
				break;
			}
			clock_cycles++;
		}
	}
}

void sim::fetch()//gets instruction from memory
{
	sp_reg[1] = sp_reg[0] + 1; //increments PC by 1 and stores in NPC	
}

void sim::decode()//decodes instruction and sets up execution
{
	unsigned instruction = sp_reg[2]; //copys IR into temp variable
	//instruction_memory[i] = instruction_memory[ >> 26; //shift all the way till just the opcode remains
	//switch(instruction)
	{
		
	}
}

void sim::execute()//executes the instruction
{
	
}

void sim::memory()//load, store or branch
{
	
}

void sim::writeBack()// write back result to registers
{
	
}

void sim::reset()
{
	for(int i=0;i<NUM_SP_REGISTERS;i++)
	{
		sp_reg[i] = UNDEFINED;
	}
	
	for(int i=0;i<NUM_GP_REGISTERS;i++)
	{
		gp_reg[i] = UNDEFINED;
	}
	clock_cycles = 0;
	instruction_count = 0;
}

unsigned sim::get_sp_register(sp_register_t reg)
{
	int i = (int) reg;
	return sp_reg[i]; //please modify
}

unsigned sim::get_gp_register(unsigned reg)
{
	int i = (int) reg;
	return gp_reg[i]; //please modify
}

float sim::get_IPC()
{
	return instruction_count / clock_cycles; //please modify
}

unsigned sim::get_instructions_executed()
{
	return (unsigned) instruction_count; //please modify
}

void sim::print_instruction_memory(unsigned start_address, unsigned end_address){
	cout << "instruction_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8) << setfill('0') <<  end_address << "]" << endl;
	unsigned i;
	for (i=instruction_memory_size; i<instruction_memory_size+100; i++){
		if (i % 4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": ";
		cout << hex << setw(2) << setfill('0') << int(instruction_memory[i]) << " ";
		if (i % 4 == 3) cout << endl;
	} 
}


void sim::print_memory(unsigned start_address, unsigned end_address){
	cout << "data_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8) << setfill('0') <<  end_address << "]" << endl;
	unsigned i;
	for (i=start_address; i<end_address; i++){
		if (i%4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": "; 
		cout << hex << setw(2) << setfill('0') << int(data_memory[i]) << " ";
		if (i%4 == 3) cout << endl;
	} 
}

void sim::write_memory(unsigned address, unsigned value)
{
	
}

void sim::print_registers(){
	cout << "Special purpose registers:" << endl;
        unsigned i;
	for (i=0; i< NUM_SP_REGISTERS; i++)
		if ((sp_register_t)i != IR && get_sp_register((sp_register_t)i)!=UNDEFINED) cout << reg_names[i] << " = " << dec <<  get_sp_register((sp_register_t)i) << hex << " / 0x" << get_sp_register((sp_register_t)i) << endl;
	cout << "General purpose registers:" << endl;
	for (i=0; i< NUM_GP_REGISTERS; i++)
		if (get_gp_register(i)!=UNDEFINED) cout << "R" << dec << i << " = " << get_gp_register(i) << hex << " / 0x" << get_gp_register(i) << endl;
}

unsigned sim::get_register_value(std::string str)
{
	unsigned rIndex = str.find_first_of('R');
	string reg = str.substr(rIndex+1);
	int value = std::stoi(reg,0,10);
	return value;
}
