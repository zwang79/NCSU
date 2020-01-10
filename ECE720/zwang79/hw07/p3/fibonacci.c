
//------------------------------------------------------------------------------
// Fibonacci program.
//------------------------------------------------------------------------------

#include "util.h"
#include <stdio.h>

#define N 15

static int fib(int i) {
  return (i>1) ? fib(i-1)+fib(i-2) : i;
}

int main(void) {
  int i;
  printf("starting...\n");

  setStats(1);
  i=fib(N);
  setStats(0);

  printf("fib(%d) = %d\n", N, i);
  return 0;
}

/* The first 30 Fibonacci numbers are given below, to check for correctness:
fib(0) = 0
fib(1) = 1
fib(2) = 1
fib(3) = 2
fib(4) = 3
fib(5) = 5
fib(6) = 8
fib(7) = 13
fib(8) = 21
fib(9) = 34
fib(10) = 55
fib(11) = 89
fib(12) = 144
fib(13) = 233
fib(14) = 377
fib(15) = 610
fib(16) = 987
fib(17) = 1597
fib(18) = 2584
fib(19) = 4181
fib(20) = 6765
fib(21) = 10946
fib(22) = 17711
fib(23) = 28657
fib(24) = 46368
fib(25) = 75025
fib(26) = 121393
fib(27) = 196418
fib(28) = 317811
fib(29) = 514229
*/
