#include <systemc.h>
#include <list>
//#include "read_master_if.h"
#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"
#include "SimpleBusLT.h"
#include "CPU.h"
using namespace std;

class UART : public sc_module/*, read_master_if<char>*/

{

public:

  //sc_export<read_master_if<char> > slave;
  tlm_utils::simple_target_socket<UART>  slave;

  list<char> fifo;

  SC_HAS_PROCESS(UART);

  const char *str;

  const char *p;

  UART(sc_module_name name) : sc_module(name)  {

    //SC_THREAD(main);

    //slave.bind(*this);
    slave.register_b_transport(this, &UART::custom_b_transport);
    str = "Hello, World!\n";
    p = str;

  }


void custom_b_transport( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  //tlm::tlm_command command   = gp.get_command();
  //sc_core::sc_time UART_delay(100,sc_core::SC_NS);
  //sc_core::sc_time time_val(100,sc_core::SC_NS);


  unsigned char c;

  unsigned char *cp;

  if (sc_time_stamp().value()%100000 == 0){ // every 100ns
    cout << sc_time_stamp().to_string() << " UART write " << *p << " to fifo (This happens every 100ns)\n"; 
    fifo.push_back(*p++);

    if (!*p) p=str;

  }



  if (address==0) { // fifo check

    if (fifo.size() == 0) gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE );
    else gp.set_response_status( tlm::TLM_OK_RESPONSE );

  }
  else // fifo pop
  {

    c = fifo.front();
    fifo.pop_front();
    cp = &c;
    //cout << sc_core::sc_time_stamp() << " " << sc_object::name() << " is reading address 0x" << address << " " << endl;
    //cout << "########" << *cp << "########" << fifo.size() << "########" << endl;
    gp.set_data_ptr(cp);
    gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE );
    
  }  
  return;     
}



};



class top : public sc_module

{

public:

  CPU cpu_inst;

  UART uart_inst;

  SimpleBusLT<1, 1> bus;


  top(sc_module_name name) :

    sc_module(name),

    cpu_inst("CPU"),

    uart_inst("UART"),

    bus("bus")

  {

    cpu_inst.master(bus.target_socket[0]);
    bus.initiator_socket[0](uart_inst.slave);

  }

};



int sc_main (int argc, char *argv[])

{

  top top1("Top1");

  sc_start(2800, SC_NS);

  cout << endl <<endl;

  return 0;

}



