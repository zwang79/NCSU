
//------------------------------------------------------------------------------
// Gregory-Leibniz program.
//------------------------------------------------------------------------------

#include "util.h"
#include <stdio.h>

#define ITERATIONS 100

int main(void) {
  int i;
  double sum,denominator;
  printf("starting...\n");

  setStats(1);
  sum=4.0;
  denominator=3.0;
  for(i=0; i<ITERATIONS; i++) {
    sum=sum-(4.0/denominator)+(4.0/(denominator+2.0));
    denominator=denominator+4.0;
  }
  setStats(0);

  printf("pi(%d)*1000 = %d\n",ITERATIONS,(int)(sum*1000));

  return 0;
}


/* Expected output for various numbers of ITERATIONS:
pi(1)*1000 = 3466
pi(10)*1000 = 3189
pi(100)*1000 = 3146
pi(1000)*1000 = 3142
pi(10000)*1000 = 3141
for all values of ITERATIONS > 1000, should give 3141
*/
