/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 11/25/2019 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/


//#ifndef __MEM_H__ 
//#define __MEM_H__

#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"
#include "tlm_utils/simple_initiator_socket.h"

class dma: public sc_core::sc_module
{
  public:  

  SC_HAS_PROCESS(dma);  

  dma( sc_core::sc_module_name module_name );

  tlm_utils::simple_initiator_socket<dma> dma_initiator;
  tlm_utils::simple_target_socket<dma>  dma_target;
 
  private:
	    
  unsigned char src[4];
  unsigned char dest[4];
  unsigned char len[4];

  void dma_b_transport
  ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay );

};


//#endif /* __MEM_H__ */
