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

	readmiss_flag = false;
	writemiss_flag = false;
	writehit_flag = false;
	busupr_flag = false;
	bus_request = NOP;
        	
	if(op == 'w') writes++;
	else          reads++;
	
	cacheLine * line = findLine(addr);
	if(line == NULL)/*miss*/
	{
		cacheLine *newline = fillLine(addr);
		if(op == 'w') { // write miss
			writeMisses++;
			writemiss_flag = true;
			writemiss(newline);
		}
		else { // read miss
			//cacheLine * findline = findLine(addr);
			//if (findline == NULL) cout << "Line is not filled" << endl;
			//else cout << "Line is filled" << endl;
			readMisses++;
			readmiss_flag = true;
			readmiss(newline);
		}
	}
	else
	{   /**since it's a hit, update LRU**/
		updateLRU(line);
		if(op == 'w') {
			writehit_flag = true;
			writehit(line);
		}
		else readhit(line);
	}
	return;
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
   if(victim->getFlags() == M || victim->getFlags() == Sm ) writeBack(); // if state is E, no need for writeback
    	
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
			break;

		case 1: // MESI
			if (state == S) {
				line->setFlags(M); //  S -> M
				bus_request = BusUpgr;
				busupr_flag = true;
			}
			if (state == E) line->setFlags(M);
		    break;
		case 2: // Dragon
			if (state == E) line->setFlags(M); // E -> M
			if (state == Sc) bus_request = BusUpd; // pending for copy detection
			if (state == Sm) bus_request = BusUpd; // pending for copy detection
			break;
		default:
			cout << "Protocol Error!" << endl;
			exit(0);
	}
	return;
}

void Cache::readhit(cacheLine *line)
{
	bus_request = NOP;
	return;
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
			line->setFlags(M); // I -> M
			bus_request = BusRdX;
			num_BusRdX++;
		    break;
		case 2: // Dragon
			bus_request = BusRd;
			line->setFlags(Pending); 
			mem_trans++; // Just following TA's advise...
			break;
		default:
			cout << "Protocol Error!" << endl;
			exit(0);
	}
	return;
}

void Cache::readmiss(cacheLine *line)
{
	switch (protocol) {
		case 0:  // MSI
			line->setFlags(S); // I -> S
			bus_request = BusRd;
			mem_trans++; // for MSI, all readmisses are satisfied by memory
			break;

		case 1: // MESI whether I -> S or I -> E depends on copy_exist (uncertain right now)
			line->setFlags(Pending); // This shouldn't be here! But I have to assign something or invalid
			bus_request = BusRd;
			//cout << "Read miss here" << endl;
		    break;
		case 2: // Dragon
			bus_request = BusRd;
			line->setFlags(Pending);
			mem_trans++; // Just following TA's advise...
			break;
		default:
			cout << "Protocol Error!" << endl;
			exit(0);
	}
	return;
}

request_t Cache::BusRequest()
{
	return bus_request;
}

bool Cache::BusOp(ulong addr, request_t BusOp)
{
	cacheLine * line = findLine(addr);
	//if (bus_request == NOP) return false; // no coherence issue
	if (line == NULL) return false; // no copy, no coherence issue
	else {
		switch (protocol) {
			case 0: return MSI_BusOp(line, BusOp);
			case 1: return MESI_BusOp(line, BusOp);
			case 2: return Dragon_BusOp(line, BusOp);
			default:
				cout << "Protocol Error!" << endl;
				exit(0);
		}
	}
	return false;
}

bool Cache::MSI_BusOp(cacheLine *line, request_t BusOp)
{
	ulong state;
	state = line->getFlags();
	switch (state) {
		case S: 
			if (BusOp == BusRdX) {
				line->invalidate(); // S -> I
				invalidations++;
			}
			break;
		case M:
			if (BusOp == BusRdX) {
				line->invalidate(); // M -> I
				invalidations++;
				writeBacks++;
				flushes++;
				mem_trans++;
			}
			else if (BusOp == BusRd) {
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
	return false;
}

bool Cache::MESI_BusOp(cacheLine *line, request_t BusOp)
{
	ulong state;
	state = line->getFlags();
	bool copyexist = false;
	switch (state) {
		case M:
			if (BusOp == BusRd) {
				//cout << "M -> S" << endl;
				line->setFlags(S); // M -> S, Flush
				writeBacks++;
				interventions++;
				flushes++;
				mem_trans++;
			}
			if (BusOp == BusRdX) {
				line->invalidate(); // M -> I, Flush
				writeBacks++;
				invalidations++;
				flushes++;
				mem_trans++;
			}
			copyexist = true;
			break;
		case E:
			if (BusOp == BusRd) {
				line->setFlags(S); // E -> S, FlushOpt
				//writeBacks++;
				interventions++;
				//flushes++;
				//mem_trans++
			}
			if (BusOp == BusRdX) {
				line->invalidate(); // E -> I, FlushOpt
				//writeBacks++;
				invalidations++;
				//flushes++;
				//mem_trans++;
			}
			copyexist = true;
			break;
		case S:
			if (BusOp == BusRdX) {
				line->invalidate(); // S -> I, FlushOpt
				//writeBacks++;
				invalidations++;
				//flushes++;
				//mem_trans++;
			}
			if (BusOp == BusUpgr) {
				line->invalidate(); // S -> I
				//writeBacks++;
				invalidations++;
				//flushes++;
				//mem_trans++;
			}
			copyexist = true;
			break;
		default:
			copyexist = false;
			break;
	}
	return copyexist;
}

bool Cache::Dragon_BusOp(cacheLine *line, request_t BusOp)
{
	ulong state;
	state = line->getFlags();
	bool copyexist = false;
	switch (state) {
		case M:
			if (BusOp == BusRd) {
				line->setFlags(Sm); // M -> Sm, Flush
				//writeBacks++;
				interventions++;
				flushes++;
				//mem_trans++;
			}
			copyexist = true;
			break;
		case E:
			if (BusOp == BusRd) {
				line->setFlags(Sc); // E -> Sc
				//writeBacks++;
				interventions++;
				//flushes++;
				//mem_trans++
			}
			copyexist = true;
			break;
		case Sc: // not bus request affects this state
			copyexist = true;
			break;
		case Sm: 
			if (BusOp == BusRd) {
				//writeBacks++;
				//interventions++;
				flushes++;
				//mem_trans++
			}
			if (BusOp == BusUpd) {
				line->setFlags(Sc); // Sm -> Sc
				//writeBacks++;
				//interventions++;
				//flushes++;
				//mem_trans++
			}
			copyexist = true;
			break;
		default:
			copyexist = false;
			break;
	}
	return copyexist;
}

void Cache::CopyResponse(bool copy_exist, ulong addr)
{
	cacheLine *line =findLine(addr);
	//cout << "here!!!" << endl;
	if (bus_request == NOP) return; 
	if (line == NULL) return;

	switch (protocol) {
		case 0:	return;
		case 1: 
		    //cout << "readmiss_flag = " << (readmiss_flag? 1 : 0) << endl;
			if (readmiss_flag) { // on a read miss
				if (copy_exist) line->setFlags(S); // copy exists then I -> S
				else {
					line->setFlags(E); // copy doesn't exist then I -> E plus mem tran
					mem_trans++;
				}
			}
			if (writemiss_flag && (!copy_exist)) mem_trans++; // on a wirte miss, if copy doesn't exist, then mem tran
			if ((copy_exist) && (!busupr_flag)) c2cs++;
			return;
		case 2:
			bus_request = NOP; // prepare for the second bus request
			if (readmiss_flag) line->setFlags(copy_exist? Sc : E); // I -> Sc or E
			if (writemiss_flag) {
				if (copy_exist) {
					line->setFlags(Sm); // I -> Sm
					bus_request = BusUpd; //  second bus request here
				}
				else line->setFlags(M); // I -> N
			}
			if (writehit_flag) {
				ulong state;
				state = line->getFlags();
				if (state == Sc) line->setFlags(copy_exist? Sm : M); // Sc -> Sm or M
				if (state == Sm) line->setFlags(copy_exist? Sm : M); // Sm -> Sm or M
			}
			return;
		default: 
			cout << "Protocol Error!" << endl;
			exit(0);
	}
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


