/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "top.h"

using namespace  std;


top::top(sc_core::sc_module_name name)
  : sc_core::sc_module(name)
  , bus("bus")
  , mem0("mem0", 4*1024)
  , mem1("mem1", 4*1024)
  , stub0("stub0","xact0.txt")
  , stub1("stub1","xact1.txt")
  , stub2("stub2","xact2.txt")

{
  stub0.master(bus.target_socket[0]);
  stub1.master(bus.target_socket[1]);
  stub2.master(bus.target_socket[2]);
  bus.initiator_socket[0](mem0.slave);
  bus.initiator_socket[1](mem1.slave);

}
