/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 11/25/2019 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/


//#ifndef __MEM_H__ 
//#define __MEM_H__

#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"

class accelerator: public sc_core::sc_module
{
  public:  

  accelerator( sc_core::sc_module_name module_name );

  ~accelerator();

  tlm_utils::simple_target_socket<accelerator>  slave;
 
  private:
	    
  unsigned char  accum[4];
  unsigned char *weight;
  unsigned char *mult;

  typedef union {
    float fdata;
    unsigned long ldata;
  }FloatLongType;


  void custom_b_transport
  ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay );

  void Float_to_Byte (float, unsigned char byte[]);
  void Byte_to_Float (float *, unsigned char byte[]);
};


//#endif /* __MEM_H__ */
