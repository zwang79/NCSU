/*******************************************************
                          cache.cc
********************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "cache.h"
using namespace std;

Cache::Cache(int s,int a,int b )
{
   ulong i, j;
   reads = readMisses = writes = 0; 
   writeMisses = writeBacks = currentCycle = 0;

   bus_request = NOP;

   size       = (ulong)(s);
   lineSize   = (ulong)(b);
   assoc      = (ulong)(a);   
   sets       = (ulong)((s/b)/a);
   numLines   = (ulong)(s/b);
   log2Sets   = (ulong)(log2(sets));   
   log2Blk    = (ulong)(log2(b));   
  
   //*******************//
   //initialize your counters here//
   c2cs = mem_trans = interventions = invalidations = flushes = num_BusRdX = 0;
   //*******************//
 
   tagMask =0;
   for(i=0;i<log2Sets;i++)
   {
		tagMask <<= 1;
        tagMask |= 1;
   }
   
   /**create a two dimentional cache, sized as cache[sets][assoc]**/ 
   cache = new cacheLine*[sets];
   for(i=0; i<sets; i++)
   {
      cache[i] = new cacheLine[assoc];
      for(j=0; j<assoc; j++) 
      {
	   cache[i][j].invalidate();
      }
   }      
   
}

/**you might add other parameters to Access()
since this function is an entry point 
to the memory hierarchy (i.e. caches)**/
void Cache::Access(ulong addr,uchar op)
{
	currentCycle++;/*per cache global counter to maintain LRU order 
			among cache ways, updated on every cache access*/
        	
	if(op == 'w') writes++;
	else          reads++;
	
	cacheLine * line = findLine(addr);
	if(line == NULL)/*miss*/
	{
		cacheLine *newline = fillLine(addr);
		if(op == 'w') { // write miss
			writeMisses++;
			writemiss(newline);
		}
		else { // read miss
			readMisses++;
			readmiss(newline);
		}
	}
	else
	{   /**since it's a hit, update LRU**/
		updateLRU(line);
		if(op == 'w') writehit(line);
		else          readhit(line);
	}
}

/*look up line*/
cacheLine * Cache::findLine(ulong addr)
{
   ulong i, j, tag, pos;
   
   pos = assoc;
   tag = calcTag(addr);
   i   = calcIndex(addr);
  
   for(j=0; j<assoc; j++)
	if(cache[i][j].isValid())
	        if(cache[i][j].getTag() == tag)
		{
		     pos = j; break; 
		}
   if(pos == assoc)
	return NULL;
   else
	return &(cache[i][pos]); 
}

/*upgrade LRU line to be MRU line*/
void Cache::updateLRU(cacheLine *line)
{
  line->setSeq(currentCycle);  
}

/*return an invalid line as LRU, if any, otherwise return LRU line*/
cacheLine * Cache::getLRU(ulong addr)
{
   ulong i, j, victim, min;

   victim = assoc;
   min    = currentCycle;
   i      = calcIndex(addr);
   
   for(j=0;j<assoc;j++)
   {
      if(cache[i][j].isValid() == 0) return &(cache[i][j]); // if the set has an empty spot, return it    
   }   
   for(j=0;j<assoc;j++) //if set is full, find LRU to replace
   {
	 if(cache[i][j].getSeq() <= min) { victim = j; min = cache[i][j].getSeq();}
   } 
   assert(victim != assoc);
   
   return &(cache[i][victim]);
}

/*find a victim, move it to MRU position*/
cacheLine *Cache::findLineToReplace(ulong addr)
{
   cacheLine * victim = getLRU(addr);
   updateLRU(victim);
  
   return (victim);
}

/*allocate a new line*/
cacheLine *Cache::fillLine(ulong addr)
{ 
   ulong tag;
  
   cacheLine *victim = findLineToReplace(addr);
   assert(victim != 0);
   if(victim->getFlags() == M || victim->getFlags() == Sm ) writeBack();
    	
   tag = calcTag(addr);   
   victim->setTag(tag);
   //victim->setFlags(VALID);    
   /**note that this cache line has been already 
      upgraded to MRU in the previous function (findLineToReplace)**/

   return victim;
}

void Cache::writehit(cacheLine *line)
{
	ulong state;
	state = line->getFlags();
	switch (protocol) {
		case 0:  // MSI
			if (state == S) { // S -> M
				line->setFlags(M);
				bus_request = BusRdX;
				num_BusRdX++;
				mem_trans++;
			}
			else bus_request = NOP;
			break;

		case 1: // MESI
		    break;
		case 2: // Dragon
			break;
		default:
			cout << "Protocol Error!" << endl;
			exit(0);
	}
}

void Cache::readhit(cacheLine *line)
{
	bus_request = NOP;
}

void Cache::writemiss(cacheLine *line)
{
	switch (protocol) {
		case 0:  // MSI
			line->setFlags(M); // I -> M
			bus_request = BusRdX;
			num_BusRdX++;
			mem_trans++;
			break;

		case 1: // MESI
		    break;
		case 2: // Dragon
			break;
		default:
			cout << "Protocol Error!" << endl;
			exit(0);
	}
}

void Cache::readmiss(cacheLine *line)
{
	switch (protocol) {
		case 0:  // MSI
			line->setFlags(S); // I -> S
			bus_request = BusRd;
			mem_trans++; // for MSI, all readmisses are satisfied by memory
			break;

		case 1: // MESI
		    break;
		case 2: // Dragon
			break;
		default:
			cout << "Protocol Error!" << endl;
			exit(0);
	}
}

request_t Cache::BusRequest()
{
	return bus_request;
}

void Cache::BusOp(ulong addr, request_t BusOp)
{
	cacheLine * line = findLine(addr);
	if (line == NULL) return; // no coherence issue
	else {
		switch (protocol) {
			case 0: MSI_BusOp(line, BusOp); break;
			case 1: MESI_BusOp(line, BusOp); break;
			case 2: Dragon_BusOp(line, BusOp); break;
			default:
				cout << "Protocol Error!" << endl;
				exit(0);
		}
	}
}

void Cache:: MSI_BusOp(cacheLine *line, request_t BusOp)
{
	ulong state;
	request_t bus_op = BusOp;
	state = line->getFlags();
	switch (state) {
		case S: 
			if (bus_op == BusRdX) {
				line->invalidate(); // S -> I
				invalidations++;
			}
			break;
		case M:
			if (bus_op == BusRdX) {
				line->invalidate(); // M -> I
				invalidations++;
				writeBacks++;
				flushes++;
				mem_trans++;
			}
			else if (bus_op == BusRd) {
				line->setFlags(S); // M -> S
				writeBacks++;
				interventions++;
				flushes++;
				mem_trans++;
			}
			break;
		case I: break; // nothing happens
		default: break;
	}
}

void Cache:: MESI_BusOp(cacheLine *line, request_t BusOp)
{
	return;
}

void Cache:: Dragon_BusOp(cacheLine *line, request_t BusOp)
{
	return;
}











void Cache::printStats(uint cache_id)
{ 
	cout << "============ Simulation results (Cache " << cache_id << ") ============" << endl;
    cout << "01. number of reads:				" << reads << endl;
    cout << "02. number of read misses:			" << readMisses << endl;
    cout << "03. number of writes:				" << writes << endl;
    cout << "04. number of write misses:			" << writeMisses << endl;
    cout << "05. total miss rate:				" << round((double)(readMisses + writeMisses)/(double)(reads + writes) * 10000)/100 << "%" << endl;
    cout << "06. number of writebacks:			" << writeBacks << endl;
    cout << "07. number of cache-to-cache transfers:		" << c2cs << endl;
    cout << "08. number of memory transactions:		" << mem_trans << endl;
    cout << "09. number of interventions:			" << interventions << endl;
    cout << "10. number of invalidations:			" << invalidations << endl;
    cout << "11. number of flushes:				" << flushes << endl;
    cout << "12. number of BusRdX:				" << num_BusRdX << endl;
}



int Cache::printCache(int idx, uchar op, ulong addr){
	int ret = 0;
	for(unsigned int i=0; i<sets; i++){
		for(unsigned int j=0; j<assoc; j++){
			if(cache[i][j].isValid() && cache[i][j].getTag() == calcTag(addr)){
				int tmp = cache[i][j].getFlags();
				string name;
				if(tmp == S){
					name = "S";
				}else if(tmp == E){
					name = "E";
				}else if(tmp == M){
					name = "M";
				}else if(tmp == Sm){
					name = "Sm";
				}else if(tmp == Sc){
					name = "Sc";
				}
				printf("(%d) %c addr: %08lx, %2s ", idx, op, cache[i][j].getTag(), name.c_str() );
				ret = 1;
			}
		}
	} 
	return ret;
}