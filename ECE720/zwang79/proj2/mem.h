/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 11/25/2019 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/


#ifndef __MEM_H__ 
#define __MEM_H__

#include <list>
#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"

using namespace std;

class mem: public sc_core::sc_module
{
  public:  

  mem( sc_core::sc_module_name module_name,
       sc_dt::uint64  memory_size  // memory size (bytes)
      );

  ~mem();

  tlm_utils::simple_target_socket<mem>  slave;
 
  private:
	    
  sc_dt::uint64 m_memory_size;
  unsigned char *data;
  list<sc_dt::uint64> row_access_recorder; // monitors which rows are active

  void custom_b_transport( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay );

  sc_dt::uint64 get_row_bank( sc_dt::uint64 addr);

  bool row_active(sc_dt::uint64 row);

};


#endif /* __MEM_H__ */
