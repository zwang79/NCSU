#include <omp.h>
#include <iostream>
#include <math.h>
using namespace std;


int main()
{
	int i;
	static long num_steps = 10000000;
    double step;
	double x, pi, sum = 0.0;
	step = 1.0/(double)num_steps;
    
    omp_set_num_threads(8);
    #pragma omp parallel for reduction (+:sum) private(x)
    
   // double x;
    
   // #pragma omp for reduction (+:sum)
    
	for (i=0;i<num_steps;i++) {
		x = (i+0.5)*step;
		sum += (4.0/(1.0+x*x));
	}
      
	pi = step *sum;
    cout << pi << endl;
}