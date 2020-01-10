/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "top.h"
#include <tlm.h>

int sc_main (int argc,char  *argv[])
{
  top top("top");
  top.mem0.accu_length = 0;
  top.mem1.accu_length = 0;
  sc_core::sc_start();
  cout << "###################################################" << endl;
  cout << "Average number of bytes for memory0 is "<< top.mem0.ave << endl;
  cout << endl;
  cout << "Average number of bytes for memory1 is "<< top.mem1.ave << endl;
  cout << "###################################################" << endl;
  return 0;
}
