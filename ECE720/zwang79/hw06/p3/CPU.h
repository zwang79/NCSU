// CPU.h
// simple model of a CPU polling a UART for new data 
// through the read_master_if interface

#pragma once

#include <systemc.h>
//#include "read_master_if.h"
#include <tlm.h>

class CPU : public sc_core::sc_module, virtual public tlm::tlm_bw_transport_if<>
{
public:
  
  tlm::tlm_initiator_socket<> master;

  SC_HAS_PROCESS(CPU);

  CPU(sc_module_name name) : sc_module(name) {
    master(*this);
    SC_THREAD(main);
  }

  void main (void) {

    sc_core::sc_time delay=sc_core::SC_ZERO_TIME; // Transaction delay
    tlm::tlm_generic_payload  gp;                 // Payload
    gp.set_streaming_width  ( 4 );                // Assume 4-byte bus width
    //unsigned long length;                         // Transaction length (bytes)
    //sc_dt::uint64 addr;                           // Transaction address
    unsigned char *op;

    gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE ); // for the 1st read when fifo's empty


    while (true) {
      gp.set_command(tlm::TLM_READ_COMMAND);
      gp.set_address( 0 );
      //master->b_transport(gp, delay); // master->read(0,c);

      int fifo_check = 0;
      fifo_check = ( gp.get_response_status() == tlm::TLM_INCOMPLETE_RESPONSE )? 0 : 1;
	    //cout << "********** " << fifo_check << " **********\n";
	    std::cout << sc_time_stamp().to_string() << " CPU read " << fifo_check << " from address 0\n";

      master->b_transport(gp, delay); // master->read(0,c);

	    wait(20, SC_NS);

	    if (fifo_check) {
        gp.set_address( 1 ); 
	      master->b_transport(gp, delay); // master->read(1,c);
        op = gp.get_data_ptr();
	      std::cout << sc_time_stamp().to_string() << " CPU read " << *op << " from address 1\n";
	      wait(20, SC_NS);
	    }
      }
    }

private:
  tlm::tlm_sync_enum  nb_transport_bw( tlm::tlm_generic_payload &gp,
                           tlm::tlm_phase &phase, sc_core::sc_time &delay)
  {
    tlm::tlm_sync_enum status;
    status = tlm::TLM_ACCEPTED;
    return status;
  } // end nb_transport_bw


  void invalidate_direct_mem_ptr          
    (sc_dt::uint64 start_range, sc_dt::uint64 end_range)
  {  
      return;
  } // end invalidate_direct_mem_ptr
};


