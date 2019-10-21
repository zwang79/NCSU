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
//#include <iomanip.h>


//#define KB 1024

using namespace std;

int main(){
	int N = 10;
	int address_1 = 0xA0000000;
	int address_2;
	int address_3;
	int address_4;

	address_2 = address_1 + N * N * 4;
	address_3 = address_2 + N * N * 4;
	address_4 = address_3 + N * N * 4;


	for (int i = 0; i < N; i++){
		for (int j = 0; j < N; j++) {
			for (int k = 0; k < N; k++) {
				cout << "r" << setfill(' ') << setw(3) << "0x" << setiosflags(ios::uppercase) << hex << address_1 + 4 * (i * N + k) << endl;
				cout << "r" << setfill(' ') << setw(3) << "0x" << setiosflags(ios::uppercase) << hex << address_2 + 4 * (k * N + j) << endl;
				cout << "r" << setfill(' ') << setw(3) << "0x" << setiosflags(ios::uppercase) << hex << address_4 + 4 * (i * N + j) << endl;
				cout << "w" << setfill(' ') << setw(3) << "0x" << setiosflags(ios::uppercase) << hex << address_4 + 4 * (i * N + j) << endl;
			}
			cout << "w" << setfill(' ') << setw(3) << "0x" << setiosflags(ios::uppercase) << hex << address_3 + 4 * (i * N + j) << endl;
		}

	}
}


