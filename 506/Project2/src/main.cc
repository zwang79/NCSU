/*******************************************************
                          main.cc
********************************************************/

#include <stdlib.h>
#include <assert.h>
#include <fstream>
#include <iostream>

using namespace std;

#include "cache.h"

int main(int argc, char *argv[])
{
	
	ifstream fin;
	FILE * pFile;

	int cache_id;
	uchar op;
	ulong addr;
	request_t BusOp;
	bool COPY_EXIST;

	int cache_size;
	int cache_assoc;
	int blk_size;
	int num_processors; /*1, 2, 4, 8*/
	int protocol; /*0:MSI, 1:MESI, 2:Dragon*/
	char *fname =  (char *)malloc(20);
	char proceed;

	if(argv[1] == NULL){
		printf("input format: ");
		printf("./smp_cache <cache_size> <assoc> <block_size> <num_processors> <protocol> <trace_file> \n");
		cout << "Please choose if you want to proceed with default configurations (Y/N): " << endl;
		cin >> proceed;
		if (proceed == 'n' || proceed == 'N') {
			cout << "Abandon." << endl;
			exit(0); 
		}
		//exit(0);
		cache_size = 8192;
		cache_assoc= 8;
		blk_size   = 64;
		num_processors = 4;/*1, 2, 4, 8*/
		protocol   = 0;	 /*0:MSI, 1:MESI, 2:Dragon*/
 		fname = (char *)"../trace/canneal.04t.debug";
    }
    else {
    	cache_size = atoi(argv[1]);
		cache_assoc= atoi(argv[2]);
		blk_size   = atoi(argv[3]);
		num_processors = atoi(argv[4]);/*1, 2, 4, 8*/
		protocol   = atoi(argv[5]);	 /*0:MSI, 1:MESI, 2:Dragon*/
 		fname = argv[6];
    }

	
	//****************************************************//
	//**printf("===== Simulator configuration =====\n");**//
	//*******print out simulator configuration here*******//
 	cout << "===== 506 Personal information =====" << endl;
 	cout << "Name:            Zhiping Wang" << endl;
 	cout << "UnityID:         zwang79" << endl;
 	cout << "ECE492 Students? NO" << endl;
 	cout << "===== 506 SMP Simulator configuration =====" << endl;
 	cout << "L1_SIZE: " << cache_size << endl;
 	cout << "L1_ASSOC: " << cache_assoc << endl;
 	cout << "L1_BLOCKSIZE: " << blk_size <<endl;
 	cout << "NUMBER OF PROCESSORS: " << num_processors << endl;
 	cout << "COHERENCE PROTOCOL: ";
 	switch(protocol) {
 		case 0: cout << "MSI" << endl; break;
 		case 1: cout << "MESI" << endl; break;
 		case 2: cout << "Dragon" << endl; break;
 		default: {
 			cout << "Unknown protocol" << endl;
 			exit(0);
 		}
 	}
 	cout << "TRACE FILE: " << &fname[3] << endl; 
	//****************************************************//

 
	//*********************************************//
        //*****create an array of caches here**********//
 	Cache *L1_cache[num_processors];

 	for (int i = 0; i < num_processors; ++i) {
 		L1_cache[i] = new Cache(cache_size, cache_assoc, blk_size); // construct
 		L1_cache[i]->protocol = protocol; // pass protocol
 	}
	//*********************************************//	

	pFile = fopen (fname,"r");
	if(pFile == 0)
	{   
		printf("Trace file problem\n");
		exit(0);
	}
	///******************************************************************//
	//**read trace file,line by line,each(processor#,operation,address)**//
	//*****propagate each request down through memory hierarchy**********//
	//*****by calling cachesArray[processor#]->Access(...)***************//
	///******************************************************************//
	ifstream f(fname);
	while (f.good()) {
		op = 'e';
		f >> cache_id >> op >> hex >> addr; // read input file line by line
		if (op == 'e') break;
		COPY_EXIST = false;
        
		L1_cache[cache_id]->Access(addr, op);
		
		BusOp = L1_cache[cache_id]->BusRequest();

		for (int i = 0; i < num_processors; ++i) { // bus snoop
			if (i != cache_id) {
				COPY_EXIST = (L1_cache[i]->BusOp(addr, BusOp))? 1 : COPY_EXIST;
			}
		}
		L1_cache[cache_id]->CopyResponse(COPY_EXIST, addr);

		if (protocol == 2) { // only Dragon has second bus request
			BusOp = L1_cache[cache_id]->BusRequest(); 
			for (int i = 0; i < num_processors; ++i) { // bus snoop
				if (i != cache_id) L1_cache[i]->BusOp(addr, BusOp);
			}
		}
	}

	fclose(pFile);

	//********************************//
	//print out all caches' statistics //
	for (int i = 0; i < num_processors; ++i) {
		L1_cache[i]->printStats(i);
	}
	//********************************//
	
}
