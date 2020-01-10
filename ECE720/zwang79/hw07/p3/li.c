
#include "util.h"
#include <stdio.h>

int main( int argc, char* argv[] )
{
  setStats(1);
  int i=7;
  setStats(0);
  printf("Loaded %d\n",i);
}
