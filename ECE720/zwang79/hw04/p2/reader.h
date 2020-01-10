#pragma once
#include <vector>
#include <string>
#include <systemc.h>

using namespace std;

class reader {
public:
    	vector<string> words;
    	size_t eol;
	size_t pos;
	size_t last_pos;
	string line, word;
   	reader (const char* n);
   	void reversePrint();
};
