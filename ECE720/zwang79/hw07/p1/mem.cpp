/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "mem.h"
#include <bitset>

using namespace  std;

SC_HAS_PROCESS(mem);
mem::mem( sc_core::sc_module_name module_name, sc_dt::uint64 memory_size )
  : sc_module (module_name)
  , m_memory_size (memory_size)
{
  
  slave.register_b_transport(this, &mem::custom_b_transport);
  last_addr = UNDEFINED;

}

void                                        
mem::custom_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  //sc_dt::uint64	   row       = find_row(address);
  //sc_dt::uint64	   bank      = find_bank(address);
  //sc_dt::uint64	   chip      = find_chip(address);
  tlm::tlm_command command   = gp.get_command();
  //sc_core::sc_time mem_delay(10,sc_core::SC_NS);
  sc_core::sc_time CAS(20,sc_core::SC_NS);
  sc_core::sc_time RCD(20,sc_core::SC_NS);
  sc_core::sc_time RP(30,sc_core::SC_NS);

 // if ((address >> 28 == last_addr >> 28)) cout << "AAAAAA" << endl;
 // if ((((address >> 13) << 30) == ((last_addr >> 13) << 30))) cout << "BBBBBBBB" << endl;
  cout << "last_addr = " << hex << last_addr << endl;
  cout << "address = " << hex << address << endl;

  wait(delay + CAS); // I add the CAS delay here for all kinds of transactions
  if (last_addr == UNDEFINED) {
  	wait(RCD); // first transaction needs ACTIVE
  	cout << "First accessing." << endl;
  }
  else {
  	if (address >> 13 == last_addr >> 13) { // same chip, same bank, same row
  		cout << "Accessing the SAME row in the same bank and chip." << endl;//do nothing
  	}
  	else {
      if ((address >> 28 == last_addr >> 28) && (((address >> 13) & 3) == ((last_addr >> 3) & 3))) {// same chip, same bank, different row
            wait(RCD + RP); // PRECHARGE and ACTIVE
            cout << "Accessing a DIFFERENT row in the same bank and chip." << endl;
        }
        else { // different bank or chip
          wait(RCD); // since my 4th transaction is accessing a new row, so I need a ACTIVE here
          cout << "Accessing a row in different bank or chip." << endl;
        }
    } 
        
  }

  last_addr = address;
  

  //wait(delay+mem_delay);
  cout << sc_core::sc_time_stamp() << " " << sc_object::name();
  if (address < m_memory_size) {
    switch (command) {
      case tlm::TLM_WRITE_COMMAND:
      {
        cout << " WRITE 0x" << hex << address << endl; 
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      case tlm::TLM_READ_COMMAND:
      {
        cout << " READ 0x" << hex << address << endl; 
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      default:
      {
        cout << " ERROR Command " << command << " not recognized" << endl;
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







