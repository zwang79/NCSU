/*******************************************************
                          cache.h
********************************************************/

#ifndef CACHE_H
#define CACHE_H

#include <cmath>
#include <iostream>

typedef unsigned long ulong;
typedef unsigned char uchar;
typedef unsigned int uint;

/****states, based on the protocol****/
typedef enum {I, S, M, E, Sm, Sc, Pending} state_t; // Pending state is just for coding convenience

/****requests, based on the protocol****/
typedef enum {NOP, BusRd, BusRdX, BusUpgr, BusUpd, Flush, FlushOpt} request_t;

/****protocols****/
typedef enum {MSI = 0, MESI, Dragon} protocol_t;

class cacheLine 
{
protected:
   ulong tag;
   ulong Flags;   // 0:I, 1:S, 2:M, 3:E, 4:Sm, 5:Sc 
   ulong seq; 
 
public:
   cacheLine()            { tag = 0; Flags = 0; }
   ulong getTag()         { return tag; }
   ulong getFlags()			{ return Flags;}
   ulong getSeq()         { return seq; }
   void setSeq(ulong Seq)			{ seq = Seq;}
   void setFlags(ulong flags)			{  Flags = flags;}
   void setTag(ulong a)   { tag = a; }
   void invalidate()      { tag = 0; Flags = I; }//useful function
   bool isValid()         { return ((Flags) != I); }
};

class Cache
{
protected:
   ulong size, lineSize, assoc, sets, log2Sets, log2Blk, tagMask, numLines;
   ulong reads, readMisses, writes, writeMisses, writeBacks;

   request_t bus_request; 

   bool readmiss_flag;
   bool writemiss_flag;
   bool writehit_flag;
   bool busupr_flag;

   //******///
   //add coherence counters here///
   ulong c2cs, mem_trans, interventions, invalidations, flushes, num_BusRdX;
   //******///

   cacheLine **cache;
   ulong calcTag(ulong addr)     { return (addr >> (log2Blk) );}
   ulong calcIndex(ulong addr)  { return ((addr >> log2Blk) & tagMask);}
   ulong calcAddr4Tag(ulong tag)   { return (tag << (log2Blk));}
   
public:
    ulong currentCycle;  

    int protocol;
     
    Cache(int,int,int);
   ~Cache() { delete cache;}
   
   cacheLine *findLineToReplace(ulong addr);
   cacheLine *fillLine(ulong addr);
   cacheLine * findLine(ulong addr);
   cacheLine * getLRU(ulong);
   
   ulong getRM(){return readMisses;} ulong getWM(){return writeMisses;} 
   ulong getReads(){return reads;}ulong getWrites(){return writes;}
   ulong getWB(){return writeBacks;}
   
   void writeBack()   {writeBacks++;mem_trans++;}
   void Access(ulong,uchar);
   void printStats(uint);
   void updateLRU(cacheLine *);

   void writehit(cacheLine *);
   void readhit(cacheLine *);
   void writemiss(cacheLine *);
   void readmiss(cacheLine *);

   int printCache(int, uchar, ulong);



   //******///
   //add other functions to handle bus transactions///
   request_t BusRequest(); // this function passed bus request to main()
   bool BusOp(ulong, request_t); // this function excute bus request on peer caches and returns if copy exists
   bool MSI_BusOp(cacheLine *, request_t);
   bool MESI_BusOp(cacheLine *, request_t);
   bool Dragon_BusOp(cacheLine *, request_t);
   void CopyResponse(bool, ulong); // this function feeds copy status back to the cache that is being accessed
   //******///

};

#endif
