// Zhiping Wang 200265085
#include "cache.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
#include <vector>
#include <math.h>
#include <algorithm>
#include <cstring>
#include <stdio.h>
#include <string.h>

using namespace std;

#define UNDEFINED 0xFFFFFFFFFFFFFFFF //constant used for initialization

vector <vector <cache_entry_t> > cache_table;

cache::cache(unsigned size, 
      unsigned associativity,
      unsigned line_size,
      write_policy_t wr_hit_policy,
      write_policy_t wr_miss_policy,
      unsigned hit_time,
      unsigned miss_penalty,
      unsigned address_width
){
	cache_table.clear();
	size_cache = size;
	way = associativity;
	block_size = line_size;
	wr_hit = wr_hit_policy;
	wr_miss = wr_miss_policy;
	hittime = hit_time;
	misspenalty = miss_penalty;
	addr_width = address_width;
	set = (size/line_size)/associativity;
	blockoffset_bits = log2(line_size);
	index_bits = log2(set);
	tag_bits = address_width - index_bits - blockoffset_bits;
	num_read = 0;
    num_write = 0;
    num_read_miss = 0;
    num_write_miss = 0;
    num_eviction = 0;
    num_ins = 0;
    num_hit = 0;
    num_mem_write = 0;
    number_memory_accesses = 0;


  cache_table.resize(associativity);
  for(unsigned i = 0; i < associativity; i++) cache_table[i].resize(set); // shape cache

  for(unsigned i = 0; i < blockoffset_bits; i++){
    blockoffset_cv <<= 1;
    blockoffset_cv |= 1;
  }
  for(unsigned i = 0; i < index_bits; i++){
    index_cv <<= 1;
    index_cv |= 1;
  }
  for(unsigned i = 0; i < associativity; i++) {
  	for(unsigned j = 0; j < blockoffset_bits; j++){
  		cache_table[i][j].valid = 0;
  		cache_table[i][j].dirty = 0;
  		cache_table[i][j].tag = 0;
  		cache_table[i][j].index = 0;
  		cache_table[i][j].access_record = 0;
  	}
  }

 // cout <<"DEBUG cache: i = "<< cache_table.size()<< " j = "<< cache_table[0].size()<< endl;
}

void cache::print_configuration() {

  cout << "CACHE CONFIGURATION" <<endl;
  cout << "size = " << (size_cache/1024) << " KB" <<endl;
  cout << "associativity = " << way << "-way" <<endl;
  cout << "cache line size = " << block_size << " B" <<endl;
  cout << "write hit policy = ";
  if(wr_hit == WRITE_BACK) cout << "write-back" <<endl;
  else cout << "write-through" <<endl;
  cout << "write miss policy = ";
  if(wr_miss == WRITE_ALLOCATE) cout << "write-allocate" <<endl;
  else cout << "no-write-allocate" <<endl;
  cout << "cache hit time = " << hittime << " CLK" <<endl;
  cout << "cache miss penalty = " << misspenalty << " CLK" <<endl;
  cout << "memory address width = " << addr_width << " bits" <<endl;
}

cache::~cache(){
	/* edit here */
	num_read = 0;
    num_write = 0;
    num_read_miss = 0;
    num_write_miss = 0;
    num_eviction = 0;
    num_ins = 0;
    num_hit = 0;
    number_memory_accesses = 0;
    cache_table.clear();
}

void cache::load_trace(const char *filename){
   stream.open(filename);
}

void cache::run(unsigned num_entries){
	//cout<<"*********NUM of READ********"<< num_read<<endl;
//	cout <<"DEBUG cache: i = "<< cache_table.size()<< " j = "<< cache_table[0].size()<< endl;
   //cout <<"DEBUG cache valid "<< cache_table[0][0].valid <<endl;
   unsigned first_access = number_memory_accesses;
   string line;
   unsigned line_nr=0;
  //cout<<"*********HERE********"<< endl;
   while (getline(stream,line)){
//cout<<"*********HERE********"<< endl;
	line_nr++;
        char *str = const_cast<char*>(line.c_str());
	
        // tokenize the instruction
        char *op = strtok (str," ");
	char *addr = strtok (NULL, " ");
	address_t address = strtoul(addr, NULL, 16);
    
    //access_type_t read_op;
    //access_type_t write_op;
   // cout<<"*********HERE********"<< endl;
    if (strcmp(op, "r") == 0) {
    	num_read ++;
    	//cout<<"*********NUM of READ********"<< num_read<<endl;
    	//read_op = read(address);
    	if(read(address) == HIT) {
    		num_hit ++;
    	//	cout<<"*********READ HIT********"<< endl;
    	}
    	else {
    	//	cout<<"*********READ MISS********"<< endl;
    		num_read_miss ++;
    		cache_way = cache_allo(address);
    	}
    }
    else if (strcmp(op, "w") == 0) {
    	num_write ++;

    	//write_op = write(address);
    	if (write(address) == HIT) {
    		num_hit ++;
        //   cout<<"*********WRITE HIT********"<< endl;
    		if (wr_hit == WRITE_THROUGH) num_mem_write ++;
    	}
    	else {
    		num_write_miss ++;
        //	cout<<"*********WRITE MISS********"<< endl;
    		if (wr_miss == WRITE_ALLOCATE) {
    			//cout<<"*********************here********************"<<endl;
    			cache_way = cache_allo(address);
    			if (wr_hit == WRITE_THROUGH) num_mem_write ++;
    			else write_back(cache_way, address);
    		}
    		else num_mem_write ++;
    	}
    }

    num_ins ++;
	number_memory_accesses++;
	if (num_entries!=0 && (number_memory_accesses-first_access)==num_entries)
		break;
   }
}

unsigned cache::cache_allo(address_t address) {
	long long tag;
	long long index;
    long long j;
	tag = address >> (blockoffset_bits + index_bits);
	index = (address >> blockoffset_bits) & index_cv;
    j = index % set;
	for (unsigned i = 0; i < way; i++) {
		if (cache_table[i][j].valid == 0) {
			cache_table[i][j].valid = 1;
			//cout<<"*********************valid set********************"<<endl;
			cache_table[i][j].tag = tag;
			//cout<<"*********************index********************"<<hex<<cache_table[i][j].index<<"i ="<< i << "tag =" << cache_table[i][j].tag<< endl;
			cache_table[i][j].index = index;
			cache_table[i][j].access_record = num_ins;
			return i;
		}
	}
	num_eviction ++;
	unsigned evict_way = evict(j);
	if (cache_table[evict_way][j].dirty == 1) {
		num_mem_write ++;
		cache_table[evict_way][j].dirty = 0;
	}
	cache_table[evict_way][j].tag = tag;
	cache_table[evict_way][j].index = index;
	cache_table[evict_way][j].access_record = num_ins;
	return evict_way;
}

unsigned cache::evict(long long j) {
	unsigned record = num_ins;
	unsigned lru_way = 0;
	for (unsigned i = 0; i < way; i++) {
		if (cache_table[i][j].access_record <= record) {
			record = cache_table[i][j].access_record;
			lru_way = i;
		}
	}
    return lru_way;
}

void cache::write_back(unsigned i, address_t address) {
	long long index;
	long long j;
	index = (address >> blockoffset_bits) & index_cv;
	j = index % set;
	cache_table[i][j].dirty = 1;
	return;
}

void cache::print_statistics() {
    float miss_rate;
    float average_mem_access_time;

    miss_rate = (float(num_read_miss) + float(num_write_miss)) / (number_memory_accesses);
    average_mem_access_time = float(hittime + miss_rate * misspenalty);

	cout << "STATISTICS" <<endl;
    cout << "memory accesses = " << dec << number_memory_accesses <<endl;
    cout << "read = " << num_read <<endl;
    cout << "read misses = " << num_read_miss <<endl;
    cout << "write = " << num_write <<endl;
    cout << "write misses = " << num_write_miss <<endl;
    cout << "evictions = " << num_eviction <<endl;
    cout << "memory writes = " << dec << num_mem_write <<endl;
    cout << "average memory access time = " << average_mem_access_time <<endl;
}

void cache::print_miss_rate() {
    float miss_rate;
    miss_rate = (float(num_read_miss) + float(num_write_miss)) / (number_memory_accesses);

    cout << "miss rate = " << miss_rate <<endl;
}

access_type_t cache::read(address_t address){
	long long tag;
	long long index;
	long long j;
	tag = address >> (blockoffset_bits + index_bits);
	index = (address >> blockoffset_bits) & index_cv;
	j = index % set;
	for (unsigned i = 0; i < way; i++) {
		if (cache_table[i][j].tag == tag && cache_table[i][j].valid == 1) {
			cache_table[i][j].access_record = num_ins;
			return HIT;
		}
	}

	return MISS;
}

access_type_t cache::write(address_t address){
	long long tag;
	long long index;
	long long j;
	tag = address >> (blockoffset_bits + index_bits);
	index = (address >> blockoffset_bits) & index_cv;
	j = index % set;
    	    		//cout <<"***way = "<< dec << way<<endl;
	for (unsigned i = 0; i < way; i++) {
		if (cache_table[i][j].tag == tag && cache_table[i][j].valid == 1) {
			if(wr_hit == WRITE_BACK) cache_table[i][j].dirty = 1;
			cache_table[i][j].access_record = num_ins;
			return HIT;
		}
	}
    return MISS;
}

void cache::print_tag_array(){
	cout << "TAG ARRAY" << endl;
	for (unsigned i = 0; i < way; i++) {
		cout << "BLOCKS " << i << endl;
		if (wr_hit == WRITE_BACK) {
			cout << setfill(' ') << setw(7) << "index" << setw(6) << "dirty" << setw(4 + tag_bits/4) << "tag" <<endl;
			//cout<<"**********set***********"<<dec<<set<<endl;
		    for (unsigned k = 0; k < set; k++) {
			     if (cache_table[i][k].valid == 1) {
		    	// cout<<"**********HEY***********"<<endl;
				     cout << setfill(' ') << setw(7) << dec << cache_table[i][k].index << setw(6) << dec << cache_table[i][k].dirty << setw(4) << "0x" << hex << cache_table[i][k].tag <<endl;
			     }		    	
		    }

		}
		else {
			cout << setfill(' ') << setw(7) << "index" << setw(6) << setw(4 + tag_bits/4) << "tag" <<endl;
		     for (unsigned j = 0; j < set; j++) {
			      if (cache_table[i][j].valid == 1) {
			      	//cout<<"**********WHAT***********"<<endl;
				      cout << setfill(' ') << setw(7) << dec << cache_table[i][j].index << setw(4) << "0x" << hex << cache_table[i][j].tag <<endl;
			      }
		     }
		}

	}

}

