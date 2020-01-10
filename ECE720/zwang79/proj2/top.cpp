/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "top.h"
top::top(sc_core::sc_module_name name)
  : sc_core::sc_module(name)
  , bus("bus")
  , mem0("Mem", 4*1024)
  , dma0("DMA")
  , accelerator0("Acce")
  , stub0("Proc","xact2.txt")
  //, stub1("stub1","xact1.txt")

{
  stub0.master(bus.target_socket[0]);
  dma0.dma_initiator(bus.target_socket[1]);
  bus.initiator_socket[0](mem0.slave);
  bus.initiator_socket[1](dma0.dma_target);
  bus.initiator_socket[2](accelerator0.slave);
}
