/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 11/25/2019 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "mem.h"
#include <string>
#include <iostream>
#include <iomanip>

using namespace  std;

SC_HAS_PROCESS(mem);
mem::mem( sc_core::sc_module_name module_name, sc_dt::uint64 memory_size )
  : sc_module (module_name)
  , m_memory_size (memory_size)
{
  
  slave.register_b_transport(this, &mem::custom_b_transport);
  data=new unsigned char[m_memory_size];

}

mem::~mem()
{
  delete data;
  row_access_recorder.clear();
}

void                                        
mem::custom_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  unsigned long    length    = gp.get_data_length();
  unsigned long    i;
  unsigned char    *dp       = gp.get_data_ptr();
  
  // since memory size is limited to 4KB, these are the only latency values we need
  sc_core::sc_time burst(10,sc_core::SC_NS);
  sc_core::sc_time CAS(20,sc_core::SC_NS);
  sc_core::sc_time RCD(20,sc_core::SC_NS);


  wait(delay);
  
  if (address < m_memory_size) {

    // check if the row is already active
    if (row_active(get_row_bank(address))) {
      cout << sc_core::sc_time_stamp() << " " << sc_object::name();
      cout << "  is accessing an ACTIVE row (latency = Burst *" << dec << (length >> 2) << " + CAS)" << endl;
    }
    else {
      cout << sc_core::sc_time_stamp() << " " << sc_object::name();
      cout << "  is accessing a NEW row (latency = Burst *" << dec << (length >> 2) << " + CAS + RCD)" << endl;
      wait(RCD);
      row_access_recorder.push_back(get_row_bank(address));
    }

    wait(CAS); // CAS latency

    wait(burst * (length >> 2)); // Burst latency

    switch (command) {
      case tlm::TLM_WRITE_COMMAND:
      {
        cout << sc_core::sc_time_stamp() << " " << sc_object::name();
        cout << "  WRITE len:0x" << hex << length << " addr:0x" << address; 
        if (dp) {
          cout << " data:0x";
          for (i=length;i>0;i--) {
            cout << hex << setfill('0') << setw(2) << (unsigned int)dp[i-1];
            data[address+i-1]=dp[i-1];
	  }
          cout << endl;
	}
        else
          cout << endl;

        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      case tlm::TLM_READ_COMMAND:
      {
        cout << sc_core::sc_time_stamp() << " " << sc_object::name();
        cout << "  READ len:0x" << hex << length << " addr:0x" << address; 
        if (dp) {
          cout << " data:0x";
          for (i=length;i>0;i--) {
            cout << hex << setfill('0') << setw(2) << (unsigned int)data[address+i-1];
            dp[i-1]=data[address+i-1];
	  }
          cout << endl;
	}
        else
          cout << endl;


        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      default:
      {
        cout << "  ERROR Command " << command << " not recognized" << endl;
        gp.set_response_status( tlm::TLM_COMMAND_ERROR_RESPONSE );
      } 
    }
  }
  else {
    cout << " ERROR Address 0x" << hex << address << " out of range" << endl;
    gp.set_response_status( tlm::TLM_ADDRESS_ERROR_RESPONSE );
  }  

  return;     
}



sc_dt::uint64 mem::get_row_bank(sc_dt::uint64 addr) 
{
  return ((addr >> 15) & 0x1FFF);
}

bool mem::row_active(sc_dt::uint64 row)
{ 

  return (find(row_access_recorder.begin(), row_access_recorder.end(), row) != row_access_recorder.end());

}




