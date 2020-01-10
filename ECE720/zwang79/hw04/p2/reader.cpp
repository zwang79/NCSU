
#include "reader.h"
#include <iostream>
#include <string>
#include <fstream>

using namespace std;


reader::reader(const char* n) {
	
	pos = 0;
	last_pos = 0;
	ifstream ifs(n);
	while (ifs.good()) {
		getline(ifs, line);
		eol = line.length();
		while (1) {
			if (pos != 0 && (line.substr(pos, 1) == " "||pos == eol) && pos != last_pos) // make sure words are not miss-extracted when there are multiple blanks in a row
			{
				word = line.substr(last_pos, pos - last_pos);
				if (word != " ") 
				{
					words.push_back(word); // if the word is qualified, store it into vector
				}
				last_pos = pos + 1;
			}
			if (pos != eol) pos++;
			else break; // break at the end of a line		
		}
		pos = 0;
		last_pos = 0;
	}
	ifs.close();
}

void reader::reversePrint() {
	vector<string>::iterator it;
	for (it = words.end() - 1; it >= words.begin(); it--)
          cout << *it << endl;
}
