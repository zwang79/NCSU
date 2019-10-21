#include <string> 
#include <iostream> 

#include <map>

using namespace std;
int main()
{
	map<string,int> months; 
	months["March"]=3; 
	months["June"]=6; 
	//map<string,int>::iterator it; 
	for (map<string,int>::iterator it= months.begin(); it!= months.end(); it++) 
		cout<< it->first << ' ' << it->second << endl; 
}

