/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#ifndef __TOP_H__
#define __TOP_H__

#include <tlm.h>
#include "mem.h"
#include "stub.h"
#include "dma.h"
#include "accelerator.h"
#include "SimpleBusLT.h"

class top : public sc_core::sc_module
{
public:
	
  top (sc_core::sc_module_name name); 

  private:
  	
  SimpleBusLT<2, 3> bus; // AHB bus
  mem mem0; // Memory
  dma dma0; // DMA
  accelerator accelerator0; // Accelerator
  stub stub0; // Processor
};

#endif /* __TOP_H__ */
