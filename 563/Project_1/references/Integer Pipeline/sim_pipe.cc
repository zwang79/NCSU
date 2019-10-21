

/*PROJECT 1 : INTERGER PIPELINE SIMULATOR - MAIN FILE */

// 	NAME 			: SUDHARSHAN KANNAN
// 	UNITY ID		: skannan4
// 	EMAIL 			: skannan4@ncsu.edu
//	STUDENT ID		: 200152199




/*********************************************************************/

/* HEADER SECTION*/

/**********************************************************************/

#include "sim_pipe.h"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <iomanip>
#include <map>
#include <valarray>
#include <fstream>
#include <cstring>
#include <string>
#include <list>
#include <string.h>



using namespace std;
const int instruction_mem_size = 100;		/* Instruction memory of fixed size - constant based on target system */


//used for debugging purposes
static const char *reg_names[NUM_SP_REGISTERS] = {"PC", "NPC", "IR", "A", "B", "IMM", "COND", "ALU_OUTPUT", "LMD"};
static const char *stage_names[NUM_STAGES] = {"IF", "ID", "EX", "MEM", "WB"};

string str[instruction_mem_size]; 		// Array of strings to collect parsed string from file

// C++ List object to represent symbol table for branches and jumps

std::list <Entry> branches;

/****************************************************************************************************/

/*GLOBAL VARIABLES SECTION*/

/****************************************************************************************************/

bool global_hazard;
unsigned global_type=0;
unsigned global_branch_delay = 0;
bool global_lock = false;
Entry k;
pipeline_reg IF_ID, ID_EX, EX_MEM, MEM_WB;
pipeline_reg save_register;
pipeline_reg preserver;
instruction *instr = new instruction[instruction_mem_size];


/*********************************************************************************

CONSTRUCTOR SECTION :


**********************************************************************************/

pipeline_reg::pipeline_reg()
{
    PC = 0x10000000;
    NPC = UNDEFINED;
    COND = UNDEFINED;
    ALU_OUTPUT = UNDEFINED;
    LMD = UNDEFINED;
    A = UNDEFINED;
    B = UNDEFINED;
    IMM = UNDEFINED;
    
}

sim_pipe::sim_pipe(unsigned mem_size, unsigned mem_latency) 
{

    

    // 1. Initialize Data Memory Size

    data_memory_size = mem_size;
    memory_wall = mem_latency;

    
    // 3. Initialize Data Memory

    data_memory = new unsigned char[data_memory_size];
    
    
    for (unsigned z = 0; z < data_memory_size; z++) {
        data_memory[z] = 0xff;
    }

    // 4. Initialize General and Special Purpose Registers 

    IF_ID.PC = 0x10000000;
    
    for (int c =0; c < 32 ; c++)
    {
        regs[c] = UNDEFINED;
    }


    clock_cycles = 0;

    num_instructions = 0;

    

}


/**********************************************************************************

DESTRUCTOR SECTION :

***********************************************************************************/

sim_pipe::~sim_pipe() {

    delete[] data_memory;
    delete[] instr;
}


/************************************************************************************

PARSER AND LOADER SECTION :

*************************************************************************************/

void sim_pipe::load_program(const char *filename, unsigned base_address) 

{

    int n=0;
    int x = 0, addr;
    int y = 0; 
    string i_mem;
    unsigned mem_size = 0;
    

    ifstream assembly(filename);
    
    addr = base_address;
    std::string eop = "EOP";

    if (assembly.is_open()) 
    { 
        
        do {
            	getline(assembly, str[x]);
  		std::size_t terminate = str[x].find (eop);
            	if (terminate != std::string::npos)
                    str[x] = "EOP";
            	else
            	{
                    instr[x].address = addr;
                    instr[x].status = not_stalled;
                    addr = addr + 0x04;
            	}
            
            	x++;

        } while ( (str[x-1] != "EOP") ); 

        assembly.close();

        do
        {
         	n = str[y].length();
            	char char_array[n + 1];
		strcpy(char_array, str[y].c_str());
		char *token = strtok(char_array, " :\r\n\t");
            
    		while (token != NULL) 
    		{
                	if (strcmp(token, "ADD") == 0) 
                	{
		            	instr[y].opcode = ADD;
		            	instr[y].bin_op = 0;
		            	token = strtok(NULL, " \t");
		           	instr[y].destination_index = atoi(token + 1);
				token = strtok(NULL, " \t");
		           	instr[y].source_1_index = atoi(token + 1);
				token = strtok(NULL, " \t");
                   		instr[y].source_2_index = atoi(token + 1);
				y++;

                	}

                	else if (strcmp(token, "SUB") == 0) 
                	{
                   	 	instr[y].opcode = SUB;
                    		instr[y].bin_op = 1;
                   		token = strtok(NULL, " \t");
                  		instr[y].destination_index = atoi(token + 1);
  				token = strtok(NULL, " \t");
                   		instr[y].source_1_index = atoi(token + 1);
				token = strtok(NULL, " \t");
                    		instr[y].source_2_index = atoi(token + 1);
				y++;

                	}


               		else if (strcmp(token, "XOR") == 0) 
               		{
		            instr[y].opcode = XOR;
		            instr[y].bin_op = 2;
		            token = strtok(NULL, " \t");
		           

		            instr[y].destination_index = atoi(token + 1);
		            


		            token = strtok(NULL, " \t");
		           
		            instr[y].source_1_index = atoi(token + 1);

		           

		            token = strtok(NULL, " \t");
		          
		            instr[y].source_2_index = atoi(token + 1);

		          

		            y++;

                }
                
                else if (strcmp(token, "OR") == 0) {
                    instr[y].opcode = OR;
                    instr[y].bin_op = 3;
                    token = strtok(NULL, " \t");
                   

                    instr[y].destination_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                   
                    instr[y].source_1_index = atoi(token + 1);

                   

                    token = strtok(NULL, " \t");
                   
                    instr[y].source_2_index = atoi(token + 1);

                    

                    y++;

                }
                
                else if (strcmp(token, "AND") == 0) {
                    instr[y].opcode = AND;
                    instr[y].bin_op = 4;
                    token = strtok(NULL, " \t");
                   

                    instr[y].destination_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                   
                    instr[y].source_1_index = atoi(token + 1);

                    

                    token = strtok(NULL, " \t");
                    
                    instr[y].source_2_index = atoi(token + 1);

                   

                    y++;

                }
                
                else if (strcmp(token, "MULT") == 0) {
                    instr[y].opcode = MULT;
                    instr[y].bin_op = 5;
                    token = strtok(NULL, " \t");
                   

                    instr[y].destination_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                   
                    instr[y].source_1_index = atoi(token + 1);

                   

                    token = strtok(NULL, " \t");
                  
                    instr[y].source_2_index = atoi(token + 1);

                 

                    y++;

                }
                
                else if (strcmp(token, "DIV") == 0) {
                    instr[y].opcode = DIV;
                    instr[y].bin_op = 6;
                    token = strtok(NULL, " \t");
                  

                    instr[y].destination_index = atoi(token + 1);
                  


                    token = strtok(NULL, " \t");
                  
                    instr[y].source_1_index = atoi(token + 1);

                   

                    token = strtok(NULL, " \t");
                  
                    instr[y].source_2_index = atoi(token + 1);

                   

                    y++;

                }

                else if (strcmp(token, "ADDI") == 0) {
                    instr[y].opcode = ADDI;
                    instr[y].bin_op = 7;
                    token = strtok(NULL, " \t");
                   

                    instr[y].destination_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                   
                    instr[y].source_1_index = atoi(token + 1);

                   

                    token = strtok(NULL, " \t");
                  
                    
                    if((token[1] == 'x') || (token[1] == 'X') )
                        instr[y].imm = (unsigned) strtol((token + 2), NULL, 16);
                    
                    else 
                        instr[y].imm = atoi(token);

                   

                    y++;

                }


                else if (strcmp(token, "SUBI") == 0) {
                    instr[y].opcode = SUBI;
                    instr[y].bin_op = 8;
                    token = strtok(NULL, " \t");
                  

                    instr[y].destination_index = atoi(token + 1);
                  


                    token = strtok(NULL, " \t");
                  
                    instr[y].source_1_index = atoi(token + 1);

                  

                    token = strtok(NULL, " \t");
                   
                    
                  if((token[1] == 'x') || (token[1] == 'X') )
                        instr[y].imm = (unsigned) strtol((token + 2), NULL, 16);
                    else 
                        instr[y].imm = atoi(token);

                   

                    y++;

                }
                
                
                else if (strcmp(token, "XORI") == 0) {
                    instr[y].opcode = XORI;
                    instr[y].bin_op = 9;
                    token = strtok(NULL, " \t");
                   

                    instr[y].destination_index = atoi(token + 1);
                  


                    token = strtok(NULL, " \t");
                  
                    instr[y].source_1_index = atoi(token + 1);

                   

                    token = strtok(NULL, " \t");
                  
                    
                  if((token[1] == 'x') || (token[1] == 'X') )
                        instr[y].imm = (unsigned) strtol((token + 2), NULL, 16);
                    else 
                        instr[y].imm = atoi(token);

                   

                    y++;

                }
                
                else if (strcmp(token, "ORI") == 0) {
                    instr[y].opcode = ORI;
                    instr[y].bin_op = 10;
                    token = strtok(NULL, " \t");
                   

                    instr[y].destination_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                  
                    instr[y].source_1_index = atoi(token + 1);

                  

                    token = strtok(NULL, " \t");
                    
                    
                  if((token[1] == 'x') || (token[1] == 'X') )
                        instr[y].imm = (unsigned) strtol((token + 2), NULL, 16);
                    else 
                        instr[y].imm = atoi(token);

                   

                    y++;

                }
                
                else if (strcmp(token, "ANDI") == 0) {
                    instr[y].opcode = ANDI;
                    instr[y].bin_op = 11;
                    token = strtok(NULL, " \t");
                  

                    instr[y].destination_index = atoi(token + 1);
                  


                    token = strtok(NULL, " \t");
                  
                    instr[y].source_1_index = atoi(token + 1);

                   

                    token = strtok(NULL, " \t");
                  
                    
                  if((token[1] == 'x') || (token[1] == 'X') )
                        instr[y].imm = (unsigned) strtol((token + 2), NULL, 16);
                    else 
                        instr[y].imm = atoi(token);

                   

                    y++;

                }
                
                
                

                else if (strcmp(token, "LW") == 0) {
                    instr[y].opcode = LW;
                    instr[y].bin_op = 12;
                    token = strtok(NULL, " \t");
                   

                    instr[y].destination_index = atoi(token + 1);
                   


                    token = strtok(NULL, "( \t");
                   
                    instr[y].offset = atoi(token);

                    

                    token = strtok(NULL, " \t)");
                   
                    instr[y].base_reg_index = atoi(token + 1);

                  

                    y++;

                }

                else if (strcmp(token, "SW") == 0) {
                    instr[y].opcode = SW;
                    instr[y].bin_op = 13;
                    token = strtok(NULL, " \t");
                   

                    instr[y].source_1_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t(");
                    
                    instr[y].offset = atoi(token);

                   

                    token = strtok(NULL, " \t)");
                   
                    instr[y].base_reg_index = atoi(token + 1);

                  

                    y++;

                }

                else if (strcmp(token, "BLTZ") == 0) {
                    
                    
                    instr[y].opcode = BLTZ;
                    instr[y].bin_op = 14;
                    token = strtok(NULL, " \t");
                   

                    instr[y].source_1_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                   
                    instr[y].label = token;
                    y++;

                }
                else if (strcmp(token, "BNEZ") == 0) {
                    
                    
                   
                   
                    instr[y].opcode = BNEZ;
                    instr[y].bin_op = 15;
                    token = strtok(NULL, " \t");
                   

                    instr[y].source_1_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                  
                    instr[y].label = token;
                    y++;
                    
                    

                }
                
                else if (strcmp(token, "BEQZ") == 0) {
                    
                    
                    instr[y].opcode = BEQZ;
                    instr[y].bin_op = 16;
                    token = strtok(NULL, " \t");
                   

                    instr[y].source_1_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                  
                    instr[y].label = token;
                    y++;

                }
                
                else if (strcmp(token, "BGTZ") == 0) {
                    
                    
                    instr[y].opcode = BGTZ;
                    instr[y].bin_op = 17;
                    token = strtok(NULL, " \t");
                   

                    instr[y].source_1_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                   
                    instr[y].label = token;
                    y++;

                }
                
                else if (strcmp(token, "BLEZ") == 0) {
                    
                    
                    instr[y].opcode = BLEZ;
                    instr[y].bin_op = 18;
                    token = strtok(NULL, " \t");
                    

                    instr[y].source_1_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                    
                    instr[y].label = token;
                    y++;

                }
                
                else if (strcmp(token, "BGEZ") == 0) {
                    
                    
                    instr[y].opcode = BGEZ;
                    instr[y].bin_op = 19;
                    token = strtok(NULL, " \t");
                  

                    instr[y].source_1_index = atoi(token + 1);
                   


                    token = strtok(NULL, " \t");
                  
                    instr[y].label = token;
                    y++;

                }
                
                else if ( (strcmp(token, "J") == 0) || (strcmp(token,"JUMP") ==0) )  {
                    
                    
                    instr[y].opcode = JUMP;
                    instr[y].bin_op = 20;
                    token = strtok(NULL, " \t");
                   

                    token = strtok(NULL, " \t");
                   
                    instr[y].label = token;
                    y++;

                }
                
                
                
                
                else if (strcmp(token, "EOP") == 0) {
                   
                    
                    instr[y].opcode = EOP;
                    token = NULL;
                    y++;
                    
                 
                } else {    
                   

                    k.label = token;
                   
                    k.target = instr[y].address;
                    k.insert_elt(k);

                   

                }


                if(token!=NULL)
                token = strtok(NULL, " :\t\r\n");
            }



           if(instr[y-1].opcode == EOP && token==NULL)
               break;
        }  while (str[y-1] != " \t\r\nEOP");



    } else {
        fprintf( stderr, "Error opening file.\n");
        fprintf( stderr, "Aborting Simulator....\n" );
        return;
    }


}


/* SIMULATOR CONTROL */


void sim_pipe::run(unsigned cycles) {

    
    fsm status;
    status.s = in_progress;
    while (status.s != terminated) {

        status = engine(cycles);


    }

    
}

void sim_pipe::reset() {
}



/* SIMULATOR OUTPUTS - STAGE WISE PIPELINE REGISTER VALUES*/


unsigned sim_pipe::get_sp_register(sp_register_t reg, stage_t s) {
    
    unsigned value=0;

    if (s == IF) 
    {
        switch (reg) {
            case PC: return IF_ID.PC;
            case NPC: return UNDEFINED;
            case A: return UNDEFINED;
            case B: return UNDEFINED;
            case IMM: return UNDEFINED;
            case COND: return UNDEFINED;
            case ALU_OUTPUT: return UNDEFINED;
            case LMD: return UNDEFINED;
            default: return UNDEFINED;
        }
    }
    else if (s == ID) 
    {

        
        
        
        if ( IF_ID.IR.fetch == true )
        switch (reg) {
            case PC: return UNDEFINED;
            case NPC: return IF_ID.NPC;
            case A: return UNDEFINED;
            case B: return UNDEFINED;
            case IMM: return UNDEFINED;
            case COND: return UNDEFINED;
            case ALU_OUTPUT: return UNDEFINED;
            case LMD: return UNDEFINED;
            default: return UNDEFINED;
        }
        
        else 
        {
        	switch (reg) {
            case PC: return UNDEFINED;
            case NPC: return UNDEFINED;
            case A: return UNDEFINED;
            case B: return UNDEFINED;
            case IMM: return UNDEFINED;
            case COND: return UNDEFINED;
            case ALU_OUTPUT: return UNDEFINED;
            case LMD: return UNDEFINED;
            default: return UNDEFINED;
        	}
        
        }
        
        


    }
    else if (s == EX) 
    {
        if( (EX_MEM.IR.opcode == EOP))
            {
                 switch (reg) {
                     
                case PC: return UNDEFINED;
                case NPC: return ID_EX.NPC;
                case A: return UNDEFINED;
                case B: return UNDEFINED;
                case IMM: return UNDEFINED;
                case COND: return UNDEFINED;
                case ALU_OUTPUT: return UNDEFINED;
                case LMD: return UNDEFINED;
                default: return UNDEFINED;
                 }
            }
      
        
            
        else if( ((ID_EX.IR.opcode == ADD) || (ID_EX.IR.opcode == SUB) || (ID_EX.IR.opcode == XOR) || (ID_EX.IR.opcode == AND) || (ID_EX.IR.opcode == MULT) || (ID_EX.IR.opcode == DIV) || ((ID_EX.IR.opcode == OR)))) 
            {
            
            		
                    if ((ID_EX.IR.status != stalled) && (ID_EX.IR.decode == true))
                    {
                                        switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return ID_EX.NPC;
                                        case A: return ID_EX.A;
                                        case B: return ID_EX.B;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                    }
            
                    else
                    {   
                                        switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                        
                    }
                
            }
        
            
            else if ((ID_EX.IR.opcode == ADDI) || (ID_EX.IR.opcode == SUBI) || (ID_EX.IR.opcode == XORI) || (ID_EX.IR.opcode == ANDI) || (ID_EX.IR.opcode == ORI))
            {
                      
                     if ( (ID_EX.IR.status != stalled) && (ID_EX.IR.decode == true) )
                     {
                                    switch (reg) {
                                    case PC: return UNDEFINED;
                                    case NPC: return ID_EX.NPC;
                                    case A: return ID_EX.A;
                                    case B: return UNDEFINED;
                                    case IMM: return ID_EX.IMM;
                                    case COND: return UNDEFINED;
                                    case ALU_OUTPUT: return UNDEFINED;
                                    case LMD: return UNDEFINED;
                                    default: return UNDEFINED;
                                    }
                     }
                     
                     else
                     {
                         
                         switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                         
                     }
            }
            else if ((ID_EX.IR.opcode == SW))
            {
                
                		
                             if ((ID_EX.IR.status != stalled) && (ID_EX.IR.decode == true))
                             {
                                        switch (reg) {
                                       case PC: return UNDEFINED;
                                       case NPC: return ID_EX.NPC;
                                       case A: return ID_EX.A;
                                       case B: return ID_EX.B;
                                       case IMM: return ID_EX.IMM;
                                       case COND: return UNDEFINED;
                                       case ALU_OUTPUT: return UNDEFINED;
                                       case LMD: return UNDEFINED;
                                       default: return UNDEFINED;
                                        }
                            }
                             
                             else
                             {
                                        switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                             }
            }
        
            else if ((ID_EX.IR.opcode == LW))
            {
                          
                
                             if ((ID_EX.IR.status != stalled) && (ID_EX.IR.decode == true))
                             {
                                        switch (reg) {
                                       case PC: return UNDEFINED;
                                       case NPC: return ID_EX.NPC;
                                       case A: return ID_EX.A;
                                       case B: return UNDEFINED;
                                       case IMM: return ID_EX.IMM;
                                       case COND: return UNDEFINED;
                                       case ALU_OUTPUT: return UNDEFINED;
                                       case LMD: return UNDEFINED;
                                       default: return UNDEFINED;
                                        }
                            }
                             
                             else
                             {
                                        switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                             }
            }
        
        
            else if ((IF_ID.IR.opcode == BLTZ) || (IF_ID.IR.opcode == BGTZ) || (IF_ID.IR.opcode == BNEZ) || (IF_ID.IR.opcode == BEQZ) || (IF_ID.IR.opcode == BLEZ) || (IF_ID.IR.opcode == BGEZ) || (IF_ID.IR.opcode == JUMP) )
            {
                
                		
                             if ((ID_EX.IR.status != stalled) && (ID_EX.IR.decode == true))
                             {
                                        switch (reg) {
                                       case PC: return UNDEFINED;
                                       case NPC: return ID_EX.NPC;
                                       case A: return ID_EX.A;
                                       case B: return UNDEFINED;
                                       case IMM: return ID_EX.IMM;
                                       case COND: return UNDEFINED;
                                       case ALU_OUTPUT: return UNDEFINED;
                                       case LMD: return UNDEFINED;
                                       default: return UNDEFINED;
                                        }
                            }
                             
                             else
                             {
                                 
                                    
                                        switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                             }
            }
            
            else
            {
            				switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
            
            }
        
            
    }


    else if (s == MEM) 
    {
        if( (EX_MEM.IR.opcode == EOP))
            {
                 switch (reg) {
                     
                case PC: return UNDEFINED;
                case NPC: return UNDEFINED;
                case A: return UNDEFINED;
                case B: return UNDEFINED;
                case IMM: return UNDEFINED;
                case COND: return UNDEFINED;
                case ALU_OUTPUT: return UNDEFINED;
                case LMD: return UNDEFINED;
                default: return UNDEFINED;
                 }
            }
        
            
     
            else if( (EX_MEM.IR.opcode == LW))
            {
            
                        if ( (EX_MEM.IR.status != stalled))
                        {
                        
                        		
                                    switch (reg) {

                                   case PC: return UNDEFINED;
                                   case NPC: return EX_MEM.NPC;
                                   case A: return UNDEFINED;
                                   case B: return UNDEFINED;
                                   case IMM: return UNDEFINED;
                                   case COND: return UNDEFINED;
                                   case ALU_OUTPUT: return EX_MEM.ALU_OUTPUT;
                                   case LMD: return UNDEFINED;
                                   default: return UNDEFINED;
                                    }
                        }
                        
                        else
                            {
                                                        switch (reg) {

                                                        case PC: return UNDEFINED;
                                                        case NPC: return UNDEFINED;
                                                        case A: return UNDEFINED;
                                                        case B: return UNDEFINED;
                                                        case IMM: return UNDEFINED;
                                                        case COND: return UNDEFINED;
                                                        case ALU_OUTPUT: return UNDEFINED;
                                                        case LMD: return UNDEFINED;
                                                        default: return UNDEFINED;
                                                         }
                            }

                        
                                    
                                    
            }
            
            else if (( EX_MEM.IR.opcode == SW))
            {
                
                	
                         if (EX_MEM.IR.status != stalled)
                         {
                                    switch (reg) {

                                    case PC: return UNDEFINED;
                                    case NPC: return EX_MEM.NPC;
                                    case A: return UNDEFINED;
                                    case B: return EX_MEM.B;
                                    case IMM: return UNDEFINED;
                                    case COND: return UNDEFINED;
                                    case ALU_OUTPUT: return EX_MEM.ALU_OUTPUT;
                                    case LMD: return UNDEFINED;
                                    default: return UNDEFINED;
                                     }
                         }
                         
                         else 
                         {
                                    switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                             
                         }
                
            }
            
            else if ((EX_MEM.IR.opcode == ADDI) || (EX_MEM.IR.opcode == SUBI) || (EX_MEM.IR.opcode == XORI) || (EX_MEM.IR.opcode == ANDI) || (EX_MEM.IR.opcode == ORI) )
            {
                
                	
                        if (EX_MEM.IR.status != stalled)
                        {
                                        switch (reg) {
                                       case PC: return UNDEFINED;
                                       case NPC: return EX_MEM.NPC;
                                       case A: return UNDEFINED;
                                       case B: return UNDEFINED;
                                       case IMM: return UNDEFINED;
                                       case COND: return UNDEFINED;
                                       case ALU_OUTPUT: return EX_MEM.ALU_OUTPUT;
                                       case LMD: return UNDEFINED;
                                       default: return UNDEFINED;
                                        }
                        }
                        
                        else 
                        {
                                        
                            switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                        }
            }
            
            else if( ((EX_MEM.IR.opcode == ADD) || (EX_MEM.IR.opcode == SUB) || (EX_MEM.IR.opcode == XOR) || ((EX_MEM.IR.opcode == OR) || (EX_MEM.IR.opcode == AND) || (EX_MEM.IR.opcode == MULT) || (EX_MEM.IR.opcode == DIV))  )) 
            {
        			
                             if((EX_MEM.IR.status != stalled) && (EX_MEM.IR.execute==true) )
                             {
                              switch (reg) {
                                       case PC: return UNDEFINED;
                                       case NPC: return EX_MEM.NPC;
                                       case A: return UNDEFINED;
                                       case B: return EX_MEM.B;
                                       case IMM: return UNDEFINED;
                                       case COND: return UNDEFINED;
                                       case ALU_OUTPUT: return EX_MEM.ALU_OUTPUT;
                                       case LMD: return UNDEFINED;
                                       default: return UNDEFINED;
                              
                                        }
                             }
                             else
                             {
                                       if ( ( ( (global_type!=2) || global_hazard!=true ) && ( (global_type!=3) || global_hazard!=true) ) )
                                       {
                                                    switch (reg) {
                                                   case PC: return UNDEFINED;
                                                   case NPC: return UNDEFINED;
                                                   case A: return UNDEFINED;
                                                   case B: return UNDEFINED;
                                                   case IMM: return UNDEFINED;
                                                   case COND: return UNDEFINED;
                                                   case ALU_OUTPUT: return UNDEFINED;
                                                   case LMD: return UNDEFINED;
                                                   default: return UNDEFINED;

                                                    }
                                       }
                                       
                                       else
                                       {
                                                    switch (reg) {
                                                   case PC: return UNDEFINED;
                                                   case NPC: return EX_MEM.NPC;
                                                   case A: return UNDEFINED;
                                                   case B: return UNDEFINED;
                                                   case IMM: return UNDEFINED;
                                                   case COND: return UNDEFINED;
                                                   case ALU_OUTPUT: return EX_MEM.ALU_OUTPUT;
                                                   case LMD: return UNDEFINED;
                                                   default: return UNDEFINED;

                                                    }
                                       }
                             }
                        
                
            }
        
            else
            {
                
                	
                         if ((EX_MEM.IR.status != stalled) )
                         {
                                        switch (reg) {
                                       case PC: return UNDEFINED;
                                       case NPC: return EX_MEM.NPC;
                                       case A: return UNDEFINED;
                                       case B: return UNDEFINED;
                                       case IMM: return UNDEFINED;
                                       case COND: return EX_MEM.COND;
                                       case ALU_OUTPUT: return UNDEFINED;
                                       case LMD: return UNDEFINED;
                                       default: return UNDEFINED;
                                        }
                         }
                         
                         
                         
                         else if ( ( (EX_MEM.IR.opcode==BLTZ) || (EX_MEM.IR.opcode == BNEZ) || (EX_MEM.IR.opcode == JUMP) )  ) 
                         
                         {
                         
                         	if (global_lock == true)
                         	{
                         		switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return UNDEFINED;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                                }
                                
                                else
                                {
                                
                                	switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return EX_MEM.ALU_OUTPUT;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                                
                                }
                         
                         
                         }
                   
                         else 
                         {
                                        
                                        switch (reg) {
                                        case PC: return UNDEFINED;
                                        case NPC: return UNDEFINED;
                                        case A: return UNDEFINED;
                                        case B: return UNDEFINED;
                                        case IMM: return UNDEFINED;
                                        case COND: return UNDEFINED;
                                        case ALU_OUTPUT: return EX_MEM.ALU_OUTPUT;
                                        case LMD: return UNDEFINED;
                                        default: return UNDEFINED;
                                        }
                         }
                
            }
                    
                    
    }
    else if (s == WB) 
    {
        
        
        if( (EX_MEM.IR.opcode == EOP))
            {
                 switch (reg) {
                     
                case PC: return UNDEFINED;
                case NPC: return UNDEFINED;
                case A: return UNDEFINED;
                case B: return UNDEFINED;
                case IMM: return UNDEFINED;
                case COND: return UNDEFINED;
                case ALU_OUTPUT: return UNDEFINED;
                case LMD: return UNDEFINED;
                default: return UNDEFINED;
                 }
            }

        
            
        else if (MEM_WB.IR.opcode == LW)
            {
            
                        if (MEM_WB.IR.status != stalled && ((MEM_WB.IR.mem == true)))
                        {
                                    switch (reg) {
                                    case PC: return UNDEFINED;
                                    case NPC: return UNDEFINED;
                                    case A: return UNDEFINED;
                                    case B: return MEM_WB.B;
                                    case IMM: return UNDEFINED;
                                    case COND: return UNDEFINED;
                                    case ALU_OUTPUT: return MEM_WB.ALU_OUTPUT;
                                    case LMD: return MEM_WB.LMD;
                                    default: return UNDEFINED;
                                    }
                        }
                        
                        else
                        {
                                    switch (reg) {
                     
                                                    case PC: return UNDEFINED;
                                                    case NPC: return UNDEFINED;
                                                    case A: return UNDEFINED;
                                                    case B: return UNDEFINED;
                                                    case IMM: return UNDEFINED;
                                                    case COND: return UNDEFINED;
                                                    case ALU_OUTPUT: return UNDEFINED;
                                                    case LMD: return UNDEFINED;
                                                    default: return UNDEFINED;
                                                    }
                        }
            }
            else if ( (MEM_WB.IR.opcode == SW) || (MEM_WB.IR.opcode == BNEZ) || (MEM_WB.IR.opcode == BLTZ) || (MEM_WB.IR.opcode == BEQZ) || (MEM_WB.IR.opcode == BGTZ) || (MEM_WB.IR.opcode == BGEZ) || (MEM_WB.IR.opcode == BLEZ) || (MEM_WB.IR.opcode == JUMP) )
            {
                
                             if (MEM_WB.IR.status != stalled && ((MEM_WB.IR.mem == true)))
                             {
                                                    switch (reg) {
                                                    case PC: return UNDEFINED;
                                                    case NPC: return UNDEFINED;
                                                    case A: return UNDEFINED;
                                                    case B: return UNDEFINED;
                                                    case IMM: return UNDEFINED;
                                                    case COND: return UNDEFINED;
                                                    case ALU_OUTPUT: return MEM_WB.ALU_OUTPUT;
                                                    case LMD: return UNDEFINED;
                                                    default: return UNDEFINED;
                                                    }
                             }
                             
                             else
                             {
                                 
                                                switch (reg) {
                     
                                                    case PC: return UNDEFINED;
                                                    case NPC: return UNDEFINED;
                                                    case A: return UNDEFINED;
                                                    case B: return UNDEFINED;
                                                    case IMM: return UNDEFINED;
                                                    case COND: return UNDEFINED;
                                                    case ALU_OUTPUT: return UNDEFINED;
                                                    case LMD: return UNDEFINED;
                                                    default: return UNDEFINED;
                                                    }
                                 
                             }
            }
        
        
        
            else
            {
                            if ((MEM_WB.IR.status != stalled) && (MEM_WB.IR.mem == true) )
                            {
                                
                
                                                    switch (reg) {
                                                    case PC: return UNDEFINED;
                                                    case NPC: return UNDEFINED;
                                                    case A: return UNDEFINED;
                                                    case B: return UNDEFINED;
                                                    case IMM: return UNDEFINED;
                                                    case COND: return UNDEFINED;
                                                    case ALU_OUTPUT: return MEM_WB.ALU_OUTPUT;
                                                    case LMD: return UNDEFINED;
                                                    default: return UNDEFINED;
                                                    }
                            }
                            else
                            {
                                
                                                    switch (reg) {
                     
                                                    case PC: return UNDEFINED;
                                                    case NPC: return UNDEFINED;
                                                    case A: return UNDEFINED;
                                                    case B: return UNDEFINED;
                                                    case IMM: return UNDEFINED;
                                                    case COND: return UNDEFINED;
                                                    case ALU_OUTPUT: return UNDEFINED;
                                                    case LMD: return UNDEFINED;
                                                    default: return UNDEFINED;
                                                    }
                                
                            }
                
            }
        }

    return 0; 

}

int sim_pipe::get_gp_register(unsigned reg) {


    return regs[reg];
}

void sim_pipe::set_gp_register(unsigned reg, int value) {
    
    regs[reg] = value;
}

float sim_pipe::get_IPC() {

    float ipc;
    ipc = (float) num_instructions / (float) clock_cycles;
   
    return ipc;


}

unsigned sim_pipe::get_instructions_executed() {
    return num_instructions;
}

unsigned sim_pipe::get_stalls() {
    return num_stalls; 
}

unsigned sim_pipe::get_clock_cycles() {
    return clock_cycles; 
}

void sim_pipe::print_memory(unsigned start_address, unsigned end_address) {
    cout << "data_memory[0x" << hex << setw(8) << setfill('0') << start_address << ":0x" << hex << setw(8) << setfill('0') << end_address << "]" << endl;
    unsigned i;
    for (i = start_address; i < end_address; i++) {
        if (i % 4 == 0) cout << "0x" << hex << setw(8) << setfill('0') << i << ": ";
        cout << hex << setw(2) << setfill('0') << int(data_memory[i]) << " ";
        if (i % 4 == 3) cout << endl;
    }
}

void sim_pipe::write_memory(unsigned address, unsigned value) {
    
    data_memory [address] = value;
    data_memory [address+1] = value >> 8;
    data_memory [address + 2] = value >> 16 ;
    data_memory [address + 3] = value >> 24;
}

void sim_pipe::print_registers() {
    cout << "Special purpose registers:" << endl;
    unsigned i, s;
    for (s = 0; s < NUM_STAGES; s++) {
        cout << "Stage: " << stage_names[s] << endl;
        for (i = 0; i < NUM_SP_REGISTERS; i++)
            if ((sp_register_t) i != IR && (sp_register_t) i != COND && get_sp_register((sp_register_t) i, (stage_t) s) != UNDEFINED) cout << reg_names[i] << " = " << dec << get_sp_register((sp_register_t) i, (stage_t) s) << hex << " / 0x" << get_sp_register((sp_register_t) i, (stage_t) s) << endl;
    }
    cout << "General purpose registers:" << endl;
    for (i = 0; i < NUM_GP_REGISTERS; i++)
        if (get_gp_register(i) != UNDEFINED)cout << "R" << dec << i << " = " << get_gp_register(i) << hex << " / 0x" << get_gp_register(i) << endl;
}


/******************************************************************************************

	MAIN SIMULATOR ENGINE AS A FINITE STATE MACHINE

*******************************************************************************************/




fsm sim_pipe::engine(unsigned c) {
    
   

    static unsigned duration=0;
    static unsigned type=0;
    
    static int n = 0;
    static unsigned num_cycles = 0;
    static fsm current_status;
    static unsigned next=1;
   
    static bool memory_lock=false;
    static unsigned lock_duration = 0;
    
    static unsigned stalls=0;
    
    static enum {
        fetch, decode, execute, mem_access, write_back
    } exec_state = fetch;
    static int value = 0;
    static int mask = 0;
    static bool flag = false;
    
    static unsigned branch_delay=0;
    static bool clash = false;
    
    static bool preserved = false;
    
    
    static unsigned fsm_period = 0;

  
    
    clock_cycles = num_cycles+1;
 
    num_stalls = stalls;
    
    global_hazard = flag;
    
    global_type = type;
    
    global_branch_delay = branch_delay;
    
    global_lock = memory_lock;
    
    
    
    
    switch (exec_state) {
    
    
    	/******************************************   THE FETCH STAGE - ********************************************************/
    
    				// 1. Fetch the instruction from memory pointed to by PC and load into IR
    				// 2. Account for branch delays
    				// 3. Change state based on machine cycle number
    				
    
        case fetch:
        {


           
          
            {

                
      
                
                
                // Stall the fetch when branch delay exist
                
                
                if ( (branch_delay > 0) && (IF_ID.IR.status == not_stalled) )
                {
                   
                    IF_ID.IR.fetch = false;
                    branch_delay--;
                    
                }
                
                // Stall the fetch if the instruction is stalled
                 
                 else if (IF_ID.IR.status == stalled && num_cycles >= 2) {

                   
                   
                }
                    

		// Skip fetch after encountering EOP
               
                 else if (IF_ID.IR.opcode == EOP) {
                   
                 

                }
                
                
                // Do the instruction fetch otherwise
                
                else 
                {
                    
                    
                    // Check whether to change PC 
                   
                    if ( ( (IF_ID.IR.opcode == BNEZ ) || (IF_ID.IR.opcode == BLTZ) || (IF_ID.IR.opcode == BGTZ) || (IF_ID.IR.opcode == BEQZ) || (IF_ID.IR.opcode == BLEZ) || (IF_ID.IR.opcode == BGEZ) ) && (EX_MEM.COND) )
                    {
                        
                      
                        IF_ID.PC= EX_MEM.ALU_OUTPUT + 0x04;
                        
                        
                    }
                    else if (IF_ID.IR.opcode == JUMP)
                    {
                    
                    	IF_ID.PC= EX_MEM.ALU_OUTPUT + 0x04;
                    
                    }
                    
                    else 
                    {
                        IF_ID.PC= IF_ID.PC + 0x04;
                    }
                    
                    
                    
                    // Fetch the instruction from the IR from memory pointed to by PC
                    
                    n = (IF_ID.PC- BASE_ADDRESS) / 4;
                    instr[n].stage = IF;
                    
                   
                    // Indicate stall due to branch delay
                    
                    if ( (instr[n].opcode == BNEZ) || (instr[n].opcode == BLTZ) || (instr[n].opcode == BEQZ) || (instr[n].opcode == BGTZ) || (instr[n].opcode == BGEZ) || (instr[n].opcode == BLEZ) || (instr[n].opcode == JUMP) ) 
                        
                    {
                        
                        stalls = stalls + 2;
                        branch_delay = 2;
                    }
                        
  
                    // Pass on the PC,NPC,and fetch status to ID stage
                    
                    IF_ID.NPC = IF_ID.PC;
                    IF_ID.IR = instr[n];
                    IF_ID.IR.fetch = true;
                    


                   
                    
                    
                }

               
               
               // Change states based on machine cycle

                if (next == 1) {
                    exec_state = decode;
                    num_cycles++;
                    fsm_period++;
                    
                    if( (fsm_period < c) || (num_cycles < c) || (c==0) )
                    {
                            
                            current_status.s = in_progress;
                            next++;
                            break;
                    }
                    else
                    {
                            
                            fsm_period = 0;
                            next++;
                            current_status.s = terminated;
                            break;
                    }
                }


                if (next == 2) {

                    exec_state = execute;
                    num_cycles++;
                    fsm_period++;
                    
                    if( (fsm_period < c) || (num_cycles < c) || (c==0) )
                    {
                            
                            current_status.s = in_progress;
                            next++;
                            break;
                    }
                    
                    else
                    {
                            
                            fsm_period = 0 ;
                            next++;
                            current_status.s = terminated;
                            break;
                    }
                    
                    
                }
                else if (next == 3) {
                    exec_state = mem_access;
                    num_cycles++;
                    fsm_period ++;
                    
                   if( (fsm_period < c) || (num_cycles < c) || (c==0))
                    {
                            
                            current_status.s = in_progress;
                            next++;
                            break;
                    }
                    
                    else
                    {
                           
                            fsm_period = 0 ;
                            next++;
                            current_status.s = terminated;
                            break;
                    }
                    
                }
                else if (next >= 4) {
                    exec_state = write_back;
                    num_cycles++;
                    fsm_period++;
                    
                   if( (fsm_period < c) || (num_cycles < c) || (c==0) )
                    {
                            
                            current_status.s = in_progress;
                            next++;
                            break;
                    }
                    
                    else
                    {
                          
                            fsm_period = 0;
                            next++;
                            current_status.s = terminated;
                            break;
                    }
                }


            }


            
        }
        
        
        
      /******************************************   THE DECODE STAGE - ********************************************************/
    
    				// 1. Check if the fetch was done for this instruction , skip otherwise
    				// 2. Detect RAW hazards and stall the instruction accordingly 
    				// 3. Check is the hazard can be resolved if exists
    				// 4. Decode the instruction after hazard resolution
    				// 3. Next state is Fetch

        case decode:
        {

            // Skip through if the fetch wasn't done for this instruction
            if(IF_ID.IR.fetch == false) 
            {
                
                       
                        exec_state = fetch;
                        current_status.s = in_progress;
                        ID_EX.IR = IF_ID.IR;
                        ID_EX.IR.decode = false;
                        
                        break;
                
            }


           

            if (IF_ID.IR.opcode == EOP) {

                // Do nothing
            }
            
           
            
                // Hazard detection Logic : 1. Check if RAW exists between this and its previous instruction

            else if (((ID_EX.IR.destination_index == IF_ID.IR.source_1_index) || (ID_EX.IR.destination_index == IF_ID.IR.source_2_index) || ( (ID_EX.IR.destination_index == IF_ID.IR.base_reg_index) && ( (IF_ID.IR.opcode == LW)||(IF_ID.IR.opcode==SW) ) ) ) && (num_cycles >= 2) && (IF_ID.IR.status==not_stalled) && (ID_EX.IR.opcode != SW) && (ID_EX.IR.opcode != BNEZ) && (ID_EX.IR.opcode != BLTZ) && (ID_EX.IR.opcode != BEQZ) && (ID_EX.IR.opcode != BGTZ) && (ID_EX.IR.opcode != BLEZ) && (ID_EX.IR.opcode != BGEZ) && (ID_EX.IR.opcode != JUMP) ) 
            {
                
                
                
            
                if( ((ID_EX.IR.opcode == LW) || (ID_EX.IR.opcode == SW)))
                {
                  
                    IF_ID.IR.status = stalled;
                    ID_EX.IR = IF_ID.IR;
                    type = 2;
                   
                    
                }
                
                else 
               
                {
                   
                    IF_ID.IR.status = stalled;
                   
                    ID_EX.IR = IF_ID.IR;
                    type=0;
                }
               
                
            }
            
            
            // Hazard Detection Logic : 2. Check if RAW exists between current instruction and the one before its previous instruction 
                

            else if (((MEM_WB.IR.destination_index == IF_ID.IR.source_1_index) || (MEM_WB.IR.destination_index == IF_ID.IR.source_2_index) || (MEM_WB.IR.destination_index == IF_ID.IR.base_reg_index) ) && (num_cycles > 2) && (IF_ID.IR.status==not_stalled) && (MEM_WB.IR.opcode != SW) && (MEM_WB.IR.opcode != BNEZ) && (MEM_WB.IR.opcode != BLTZ)  && (MEM_WB.IR.opcode != BEQZ) && (MEM_WB.IR.opcode != BGTZ) && (MEM_WB.IR.opcode != BLEZ) && (MEM_WB.IR.opcode != BGEZ) && (MEM_WB.IR.opcode != JUMP) )               
            {
                
                
                
                if( (ID_EX.IR.opcode == LW) || (ID_EX.IR.opcode == SW) )
                {
                   
                    IF_ID.IR.status = stalled;
                    ID_EX.IR = IF_ID.IR;
                    type = 3;
                    
                    
                }
                
                
                
                else
                {
                   
                    IF_ID.IR.status = stalled;
                  
                    ID_EX.IR = IF_ID.IR;
                    type=1;
                }
               
                
            }


             // Hazard Resoltion Logic : If the instruction was already stalled, proceed for decoding, else stall the decode stage

            if ((IF_ID.IR.status == stalled) && num_cycles >= 2) {
               
                if (type==0) {
                    
                    
                    duration++;
                    if(duration > 2)
                    {
                       
                        ID_EX.IR.status = not_stalled;
                        IF_ID.IR.status = not_stalled;
                        duration=0;
                        
                    }
                    else {
                       
                        stalls++;
                        exec_state = fetch;
                        current_status.s = in_progress;
                        ID_EX.IR.decode = false;
                        break;
                    } 
                }
                else if (type==1)
                {
                    duration++;
                    if(duration > 1)
                    {
                        
                        ID_EX.IR.status = not_stalled;
                        IF_ID.IR.status = not_stalled;
                        duration=0;
                        
                    }
                    else {
                       
                        stalls++;
                        exec_state = fetch;
                        current_status.s = in_progress;
                        ID_EX.IR.decode = false;
                        break;
                    } 
                    
                }
                else if (type == 2)
                {
                    duration++;
                    if(duration == memory_wall + 1)
                        clash = true;
                    if(duration > (memory_wall + 2) )
                    {
                      
                        ID_EX.IR.status = not_stalled;
                        IF_ID.IR.status = not_stalled;
                        duration=0;
                        flag=false;
                        
                    }
                    else {
                       
                        stalls++;
                        exec_state = fetch;
                        current_status.s = in_progress;
                        ID_EX.IR.decode = false;
                        flag = true;
                        break;
                    }
                    
                }
                
                else if (type == 3)
                {
                    duration++;
                    if(duration > (memory_wall + 1) )
                    {
                       
                        ID_EX.IR.status = not_stalled;
                        IF_ID.IR.status = not_stalled;
                        duration=0;
                        flag = false;
                       
                    }
                    else {
                      
                        stalls++;
                        exec_state = fetch;
                        current_status.s = in_progress;
                        ID_EX.IR.decode = false;
                        flag=true;
                        break;
                    }
                    
                }
            }
            

            
            	// Propogate the PC to next stage

           
                IF_ID.IR.stage = ID;
                ID_EX.PC = IF_ID.PC;
                
                
                // Decode the instruction now - control wouldn't come here if decode should be stalled
                
                if ((IF_ID.IR.opcode == ADD) || (IF_ID.IR.opcode == SUB) || (IF_ID.IR.opcode == XOR) || (IF_ID.IR.opcode == OR) || (IF_ID.IR.opcode == AND) || (IF_ID.IR.opcode == MULT) || (IF_ID.IR.opcode == DIV)) {
                    ID_EX.A = regs[IF_ID.IR.source_1_index];
                    ID_EX.B = regs[IF_ID.IR.source_2_index];
                  


                }
                else if ((IF_ID.IR.opcode == ADDI) || (IF_ID.IR.opcode == SUBI) ||  (IF_ID.IR.opcode == ANDI) ||  (IF_ID.IR.opcode == ORI) ||  (IF_ID.IR.opcode == XORI) ) {

                    ID_EX.A = regs[IF_ID.IR.source_1_index];
               
                    value = (0x0000FFFF & IF_ID.IR.imm);
                    mask = 0x000080000;
                    if (mask & IF_ID.IR.imm)
                        value = value + 0xFFFF0000;
                    ID_EX.IMM = value;


                }
                else if (IF_ID.IR.opcode == LW) {
                    ID_EX.A = regs[IF_ID.IR.base_reg_index];
                 
                    ID_EX.IMM = IF_ID.IR.offset;


                }
                else if (IF_ID.IR.opcode == SW) {
                    ID_EX.A = regs[IF_ID.IR.base_reg_index];
                    ID_EX.B = regs[IF_ID.IR.source_1_index];
                    ;
                    ID_EX.IMM = IF_ID.IR.offset;


                }
                
		// Propogate the NPC and IR to EX stage

                ID_EX.IR = IF_ID.IR;
                ID_EX.NPC = IF_ID.NPC;
                


                ID_EX.IR.decode = true;
                exec_state = fetch;
                current_status.s = in_progress;
                break;



          


        }
        
        
         /******************************************   THE EXECUTE STAGE - ********************************************************/
    
    				// 1. Check if the decode was done for this instruction , skip otherwise
    				// 2. Proceed to execute the instruction only when the instruction shouldn't be stalled 
    				// 3. Next state is Decode
        

        case execute:

        {


            if ( (ID_EX.IR.status == stalled) || ID_EX.IR.decode == false) {
                
                EX_MEM.IR = ID_EX.IR;
                EX_MEM.IR.execute = false;
                
                exec_state = decode;
                current_status.s = in_progress;
                break;
            }
            else if ((ID_EX.IR.status == not_stalled)) {
               
              
                ID_EX.IR.stage = EX;
                
                if (ID_EX.IR.opcode == ADD)
                {
                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A + ID_EX.B;
               
                }
                
                else if (ID_EX.IR.opcode == SUB) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A - ID_EX.B;
                  

                }
                else if (ID_EX.IR.opcode == XOR) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A ^ ID_EX.B;
               

                }
                
                else if (ID_EX.IR.opcode == AND)
                {
                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A & ID_EX.B;
               
                }
                
                else if (ID_EX.IR.opcode == OR)
                {
                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A | ID_EX.B;
               
                }
                
                else if (ID_EX.IR.opcode == MULT)
                {
                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A * ID_EX.B;
               
                }
                
                else if (ID_EX.IR.opcode == DIV)
                {
                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A / ID_EX.B;
               
                }
                
                else if (ID_EX.IR.opcode == ADDI) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A + ID_EX.IMM;
                    

                }
                else if (ID_EX.IR.opcode == SUBI) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A - ID_EX.IMM;
                   

                }
                
                else if (ID_EX.IR.opcode == ANDI) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A & ID_EX.IMM;
                   

                }
                
                else if (ID_EX.IR.opcode == ORI) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A | ID_EX.IMM;
                   

                }
                
                else if (ID_EX.IR.opcode == XORI) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A ^ ID_EX.IMM;
                   

                }
                
                  

                else if (ID_EX.IR.opcode == LW) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A + ID_EX.IMM;
                   

                }
                else if (ID_EX.IR.opcode == SW) {

                    EX_MEM.IR = ID_EX.IR;
                    EX_MEM.ALU_OUTPUT = ID_EX.A + ID_EX.IMM;
                    EX_MEM.B = ID_EX.B;
                  

                }
                   
                
                // Get Offset from the current NPC using symbol table and obtain branch target
                   
                else if (ID_EX.IR.opcode == BLTZ) {
                    EX_MEM.IR = ID_EX.IR;
                    unsigned off = k.find_elt(ID_EX.IR.label)-ID_EX.IR.address-0x04 ;
                    ID_EX.IR.offset = off;
                    
                   
                    
                    EX_MEM.COND = (regs[ID_EX.IR.source_1_index] < 0);
                    if (EX_MEM.COND) {
                        
                        EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                        
                     
                    }
                    else 
                       
                        EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                        

                }
                
                else if (ID_EX.IR.opcode == BGTZ) {
                    EX_MEM.IR = ID_EX.IR;
                    unsigned off = k.find_elt(ID_EX.IR.label)-ID_EX.IR.address-0x04 ;
                    ID_EX.IR.offset = off;
                    
                   
                    
                    EX_MEM.COND = (regs[ID_EX.IR.source_1_index] > 0);
                    if (EX_MEM.COND) {
                        
                        EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                        
                     
                    }
                    else 
                       
                        EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                        

                }
                
                else if (ID_EX.IR.opcode == BEQZ) {
                    EX_MEM.IR = ID_EX.IR;
                    unsigned off = k.find_elt(ID_EX.IR.label)-ID_EX.IR.address-0x04 ;
                    ID_EX.IR.offset = off;
                    
                
                   
                    EX_MEM.COND = (regs[ID_EX.IR.source_1_index] == 0);

                    if (EX_MEM.COND) {
                        
                   
                       EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                     
                    }
                    else
                      
                        EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                        


                }
                
                
                
                
                
                
                else if (ID_EX.IR.opcode == BNEZ) {
                    EX_MEM.IR = ID_EX.IR;
                    unsigned off = k.find_elt(ID_EX.IR.label)-ID_EX.IR.address-0x04 ;
                    ID_EX.IR.offset = off;
                    
                  
                   
                    EX_MEM.COND = (regs[ID_EX.IR.source_1_index] != 0);

                    if (EX_MEM.COND) {
                        
                       
                       EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                       
                    }
                    else
                    
                        EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                        


                }
                
                else if (ID_EX.IR.opcode == BLEZ) {
                    EX_MEM.IR = ID_EX.IR;
                    unsigned off = k.find_elt(ID_EX.IR.label)-ID_EX.IR.address-0x04 ;
                    ID_EX.IR.offset = off;
                    
                 
                   
                    EX_MEM.COND = (regs[ID_EX.IR.source_1_index] <= 0);

                    if (EX_MEM.COND) {
                        
                      
                       EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                      
                    }
                    else
                      
                        EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                        


                }
                
                else if (ID_EX.IR.opcode == BGEZ) {
                    EX_MEM.IR = ID_EX.IR;
                    unsigned off = k.find_elt(ID_EX.IR.label)-ID_EX.IR.address-0x04 ;
                    ID_EX.IR.offset = off;
                    
                   
                   
                    EX_MEM.COND = (regs[ID_EX.IR.source_1_index] >= 0);

                    if (EX_MEM.COND) {
                        
                      
                       EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                       
                    }
                    else
                      
                        EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                        


                }
                else if (ID_EX.IR.opcode == JUMP) {
                    EX_MEM.IR = ID_EX.IR;
                    unsigned off = k.find_elt(ID_EX.IR.label)-ID_EX.IR.address-0x04 ;
                    ID_EX.IR.offset = off;
                    
                   
                       EX_MEM.ALU_OUTPUT = ID_EX.NPC + ID_EX.IR.offset;
                      
                        


                }
                
                
                
                else if (ID_EX.IR.opcode == EOP) {
                    EX_MEM.IR = ID_EX.IR;
               	 }


                
                    EX_MEM.B = ID_EX.B;
                    EX_MEM.IR.execute = true;
                    exec_state = decode;
                    current_status.s = in_progress;
                    break;
                
                } 
            }


        
		 /******************************************   THE MEM ACCESS STAGE - ********************************************************/
    
    				// 1. Check if the execute was done for this instruction , skip otherwise
    				// 2. Terminate the simulator engine if EOP was encountered
    				// 3. Repeat this stage based on MEM latency
    				// 4. LW and SW will lock the memory unit until they finish the memory access operation
    				// 5. Negotiate with RAW hazards in decode stage and Structural hazards on this stage with other instruction
    				// 6. Next state can be either itself or execute state or terminate

        case mem_access:


        {

          
		// terminate the FSM when you see EOP - All other instructions would have been completed by then

            if ((EX_MEM.IR.opcode == EOP) && (memory_lock==false)) {
               
                current_status.s = terminated;
                IF_ID.PC -= 0x04;
                IF_ID.NPC -= 0x04;
                ID_EX.NPC -= 0x04;
                break;
            }
            
            
            if (duration == memory_wall + 2)
            {
                
                    MEM_WB.IR = EX_MEM.IR;
                    MEM_WB.ALU_OUTPUT = EX_MEM.ALU_OUTPUT;
                    MEM_WB.IR.mem = false;
                    exec_state = execute;
                    current_status.s = in_progress;
                    break;
                
            }
          
          // Save the contents of the register before stalling due to Structural hazard
          
            else if (flag == true)
            {
                if(clash)
                {
                    preserved = false;
                    clash = false;
                 
                    
                    EX_MEM.IR.stage = MEM;
                    if ((preserver.IR.opcode == LW) ) {
                    
                     
                        MEM_WB.IR = preserver.IR;
                        MEM_WB.LMD = data_memory [ preserver.ALU_OUTPUT + 3] << 24;
                        MEM_WB.LMD += data_memory [ preserver.ALU_OUTPUT + 2] << 16;
                        MEM_WB.LMD += data_memory [ preserver.ALU_OUTPUT + 1] << 8;
                        MEM_WB.LMD += data_memory [ preserver.ALU_OUTPUT] << 0;
                        
                        MEM_WB.ALU_OUTPUT = preserver.ALU_OUTPUT;
                        MEM_WB.IR.mem = true;
                        exec_state = execute;
                        current_status.s = in_progress;
                        break;
                    


                        }
                    
                    
                }
                else
            
                {
                   
                    if (preserved == false)
                    {
                     
                        preserved = true;
                        preserver = EX_MEM;
                        
                    }
                   
                    MEM_WB.IR = EX_MEM.IR;
                    MEM_WB.ALU_OUTPUT = EX_MEM.ALU_OUTPUT;
                    MEM_WB.IR.mem = false;
                    exec_state = execute;
                    current_status.s = in_progress;
                    break;
                    
                }
            }
            
            else if (memory_lock && flag==false)
            {
                
                lock_duration++;
                
               
                
                if(lock_duration >= memory_wall+1)
                {
                   
                    
                    lock_duration=0;
                    memory_lock = false;
                    MEM_WB.IR.mem = true;
                    MEM_WB.IR.status = not_stalled;
                    
                   
                    

                    
                    if (save_register.IR.opcode == LW) {
                    
                       
                        MEM_WB.IR = save_register.IR;
                        MEM_WB.IR.status = not_stalled;
                        MEM_WB.LMD = data_memory [ save_register.ALU_OUTPUT + 3] << 24;
                        MEM_WB.LMD += data_memory [ save_register.ALU_OUTPUT + 2] << 16;
                        MEM_WB.LMD += data_memory [ save_register.ALU_OUTPUT + 1] << 8;
                        MEM_WB.LMD += data_memory [ save_register.ALU_OUTPUT] << 0;
                    


                } else if (save_register.IR.opcode == SW) {
                    
                        
                       
                        MEM_WB.IR = save_register.IR;
                        
                        data_memory[save_register.ALU_OUTPUT] = save_register.B >> 0;
                        data_memory[save_register.ALU_OUTPUT + 1] = save_register.B >> 8;
                        data_memory[save_register.ALU_OUTPUT + 2] = save_register.B >> 16;
                        data_memory[save_register.ALU_OUTPUT + 3] = save_register.B >> 24;
                    
                }
                    
                    MEM_WB.ALU_OUTPUT = EX_MEM.ALU_OUTPUT;
                    memory_lock = false;
                    MEM_WB.IR.mem = true;
                    MEM_WB.IR.status = not_stalled;
                    exec_state = execute;
                    current_status.s = in_progress;
                    break;
                }
                
                
                // Bounce through this state for as many cycles until LW or SW completes its operation 
                
                else
                {
                       
                        num_cycles++;
                        MEM_WB.ALU_OUTPUT = EX_MEM.ALU_OUTPUT;
                        stalls++;
                        fsm_period++;
                        exec_state = mem_access;
                        if( (num_cycles < c) || (c==0) || (fsm_period < c))
                            current_status.s = in_progress;
                        else
                        {
                            current_status.s = terminated;
                            fsm_period = 0 ;
                        }
                        break;
                }
            }
            
            else if (  ((EX_MEM.IR.opcode == LW) || (EX_MEM.IR.opcode == SW)) && (EX_MEM.IR.execute == true) &&(memory_lock==false) && (flag==false) && (memory_wall))
              
            {
            
               
                memory_lock = true;
                MEM_WB.ALU_OUTPUT = EX_MEM.ALU_OUTPUT;
                save_register = EX_MEM;
                exec_state = mem_access;
                if( (num_cycles < c) || (c==0) || (fsm_period < c))
                            current_status.s = in_progress;
                        else
                        {
                            current_status.s = terminated;
                            fsm_period = 0 ;
                        }
                        break;
                
            }
                
                // Don't do memory stage for this instruction if was already stalled in its earlier stages

            if ((EX_MEM.IR.status == stalled) || (EX_MEM.IR.execute ==false)) {
                MEM_WB.IR = ID_EX.IR;
                MEM_WB.ALU_OUTPUT = EX_MEM.ALU_OUTPUT;
                MEM_WB.IR.mem = false;
                exec_state = execute;
                current_status.s = in_progress;
                break;
            }
            
	
		// Perform memory operation and pass on the IR to next stage after latency of the unit expires


            else if ((EX_MEM.IR.status == not_stalled) && (memory_lock==false)) {
               
                
                
                EX_MEM.IR.stage = MEM;
                if ((EX_MEM.IR.opcode == LW) ) {
                    
                      
                        MEM_WB.IR = EX_MEM.IR;
                        MEM_WB.LMD = data_memory [ EX_MEM.ALU_OUTPUT + 3] << 24;
                        MEM_WB.LMD += data_memory [ EX_MEM.ALU_OUTPUT + 2] << 16;
                        MEM_WB.LMD += data_memory [ EX_MEM.ALU_OUTPUT + 1] << 8;
                        MEM_WB.LMD += data_memory [ EX_MEM.ALU_OUTPUT] << 0;
                    


                } else if (EX_MEM.IR.opcode == SW) {
                    
                        
                        MEM_WB.IR = EX_MEM.IR;
                        data_memory[EX_MEM.ALU_OUTPUT] = EX_MEM.B >> 0;
                        data_memory[EX_MEM.ALU_OUTPUT + 1] = EX_MEM.B >> 8;
                        data_memory[EX_MEM.ALU_OUTPUT + 2] = EX_MEM.B >> 16;
                        data_memory[EX_MEM.ALU_OUTPUT + 3] = EX_MEM.B >> 24;
                    
                }
                
                
                // For all non-memory operations, just pass on the IR and ALU_OUTPUT

                else {
                    MEM_WB.IR = EX_MEM.IR;
                    MEM_WB.ALU_OUTPUT = EX_MEM.ALU_OUTPUT;
                }
                


		// Pass through ALU_OUTPUT and memory status for this instruction to the write back stage

                MEM_WB.ALU_OUTPUT = EX_MEM.ALU_OUTPUT;
                MEM_WB.IR.mem = true;
                exec_state = execute;
                current_status.s = in_progress;
                break;

            } 
        }


	 /******************************************   THE WRITE BACK STAGE - ********************************************************/
    
    				// 1. Check if the MEM_ACCESS was done for this instruction , skip otherwise
    				// 2. Load the value in LMD for LOAD instructions 
    				// 3. Next state is mem_access
    				// 4. Keeps track of instruction execution count


        case write_back:

        {


		// Don't do write_back for this instruction is it was stalled earlier or it mem stage was unsuccessfull

          

            if ( (MEM_WB.IR.status == stalled) || (MEM_WB.IR.mem == false)) {
                exec_state = mem_access;
                current_status.s = in_progress;
                break;
            }

          
          	// Proceed to write to register file if no structural hazard in MEM was incurred for this instruction
            
                else if ( ( (MEM_WB.IR.mem == true) || (memory_lock == false) || (MEM_WB.IR.status == not_stalled) ) ) {
                MEM_WB.IR.stage = WB;

              
                if ((MEM_WB.IR.opcode == LW)) {
                  
                    regs[MEM_WB.IR.destination_index] = MEM_WB.LMD;
                 
                } else if ((MEM_WB.IR.opcode != SW) && (MEM_WB.IR.opcode != BLTZ) && (MEM_WB.IR.opcode != BNEZ) && (MEM_WB.IR.opcode != BEQZ) && (MEM_WB.IR.opcode != BGTZ) && (MEM_WB.IR.opcode != BLEZ) && (MEM_WB.IR.opcode != BGEZ) && (MEM_WB.IR.opcode != JUMP) ) {
                    regs[MEM_WB.IR.destination_index] = MEM_WB.ALU_OUTPUT;
                  
                }

                num_instructions++;
                exec_state = mem_access;
                current_status.s = in_progress;
                break;
            } 

        }


    }

    return current_status;

}


// C++ List for returning offset from current NPC - elements were inserted while parsing 


void Entry::insert_elt(Entry& e) {
    branches.push_front(e);
}

unsigned Entry::find_elt(string& s) {
    
    
   
    

    typedef list <Entry> :: iterator LI;
    for (LI i = branches.begin(); i != branches.end(); ++i) {
        Entry& z = *i;
        if (s == z.label)
        {
           
            return z.target;
        }
    }

    return 0;
}


