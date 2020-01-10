/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 11/25/2019 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "dma.h"
#include <string>
#include <iostream>
#include <iomanip>

using namespace  std;

SC_HAS_PROCESS(dma);
dma::dma( sc_core::sc_module_name module_name )
  : sc_module (module_name)
{
  
  dma_target.register_b_transport(this, &dma::dma_b_transport);

}


void                                        
dma::dma_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  unsigned long    length    = gp.get_data_length();
  unsigned long    i;
  unsigned char    *dp       = gp.get_data_ptr();

  sc_core::sc_time dma_delay(10,sc_core::SC_NS);
  sc_core::sc_time burst(10,sc_core::SC_NS);


  wait(delay+dma_delay);
  wait(burst * (length >> 2)); // Burst latency

  cout << sc_core::sc_time_stamp() << " " << sc_object::name();

  switch (command) {
    case tlm::TLM_READ_COMMAND: { // Processor is reading from DMA
      cout << "  is being READ len:0x" << hex << length << " addr:0x" << address << " data:0x";
      switch (address & 0xF) {
        case 0x0: { // read source memory address
          for (i=length;i>0;i--) {
            cout << hex << setfill('0') << setw(2) << (unsigned int)src[(address & 0xF)+i-1];
            dp[i-1] = src[(address & 0xF)+i-1];
          }
          cout << endl;
          gp.set_response_status( tlm::TLM_OK_RESPONSE );
          break;
        }
        case 0x4: { // read destination accelerator address
          for (i=length;i>0;i--) {
            cout << hex << setfill('0') << setw(2) << (unsigned int)dest[(address & 0xF)-0x4+i-1];
            dp[i-1] = dest[(address & 0xF)-0x4+i-1];
          }
          cout << endl;
          gp.set_response_status( tlm::TLM_OK_RESPONSE );
          break;
        }
        case 0x8: {
          for (i=length;i>0;i--) {
            cout << hex << setfill('0') << setw(2) << (unsigned int)len[(address & 0xF)-0x8+i-1];
            dp[i-1] = len[(address & 0xF)-0x8+i-1];
          }
          cout << endl;
          gp.set_response_status( tlm::TLM_OK_RESPONSE );
          break;
        }
        default: {
          cout << " ERROR DMA Address " << address << " no such register" << endl;
          gp.set_response_status( tlm::TLM_COMMAND_ERROR_RESPONSE );
        }
      }
      break;
    }

    case tlm::TLM_WRITE_COMMAND: { // Processor is writing to DMA
      cout << "  is being WRITE len:0x" << hex << length << " addr:0x" << address << " data:0x"; 
      switch (address & 0xF) {
        case 0x0: { // write source memory address
          for (i=length;i>0;i--) {
            cout << hex << setfill('0') << setw(2) << (unsigned int)dp[i-1];
            src[(address & 0xF)+i-1] = dp[i-1];
          }
          cout << endl;
          gp.set_response_status( tlm::TLM_OK_RESPONSE );
          break;
        }
        case 0x4: { // write destination accelerator address
          for (i=length;i>0;i--) {
            cout << hex << setfill('0') << setw(2) << (unsigned int)dp[i-1];
            dest[(address & 0xF)-0x4+i-1] = dp[i-1];
          }
          cout << endl;
          gp.set_response_status( tlm::TLM_OK_RESPONSE );
          break;
        }
        case 0x8: { // write length - how many 4-byte words
          for (i=length;i>0;i--) {
            cout << hex << setfill('0') << setw(2) << (unsigned int)dp[i-1];
            len[(address & 0xF)-0x8+i-1] = dp[i-1];
          }
          cout << endl;
          gp.set_response_status( tlm::TLM_OK_RESPONSE );

          cout << "Writing to DMA Length Register triggers DMA initiator operations..." << endl;

          // read from memory after length reveived
          gp.set_address( (((unsigned int)src[3]) << 24) + (((unsigned int)src[2]) << 16) + (((unsigned int)src[1]) << 8) + ((unsigned int)src[0]) );
          gp.set_command(tlm::TLM_READ_COMMAND);
          gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE );
          gp.set_data_length( (((unsigned int)len[3]) << 26) + (((unsigned int)len[2]) << 18) + (((unsigned int)len[1]) << 10) + (((unsigned int)len[0]) << 2) );
          cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
               << "  is READING from Mem" << " len:0x" << hex << length << " addr:0x" << (((unsigned int)src[3]) << 24) + (((unsigned int)src[2]) << 16) + (((unsigned int)src[1]) << 8) + ((unsigned int)src[0])
               << endl;
          dma_initiator->b_transport(gp, delay); 

          // write to accelerator after data fetch
          if (gp.get_response_status() == tlm::TLM_OK_RESPONSE) {
            cout << sc_core::sc_time_stamp() << " " << sc_object::name()
                 << "  READ completed data:0x";
            for (unsigned long j=gp.get_data_length();j>0;j--) {
              cout << hex << setfill('0') << setw(2) << (unsigned int)dp[j-1];
            }
            cout << endl;    
            gp.set_address( (((unsigned int)dest[3]) << 24) + (((unsigned int)dest[2]) << 16) + (((unsigned int)dest[1]) << 8) + ((unsigned int)dest[0]) );
            gp.set_command(tlm::TLM_WRITE_COMMAND);
            gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE );
            gp.set_data_length( (((unsigned int)len[3]) << 26) + (((unsigned int)len[2]) << 18) + (((unsigned int)len[1]) << 10) + (((unsigned int)len[0]) << 2) );
            cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
               << "  is WRITING to Acce" << " len:0x" << hex << length << " addr:0x" << (((unsigned int)dest[3]) << 24) + (((unsigned int)dest[2]) << 16) + (((unsigned int)dest[1]) << 8) + ((unsigned int)dest[0])
               << " data:0x";
            for (unsigned long j=gp.get_data_length();j>0;j--) {
              cout << hex << setfill('0') << setw(2) << (unsigned int)dp[j-1];
            }
            cout << endl;
            dma_initiator->b_transport(gp, delay); 

            if (gp.get_response_status() == tlm::TLM_OK_RESPONSE) {
              cout << sc_core::sc_time_stamp() << " " << sc_object::name()
                   << "  WRITE completed" << endl;
            }
          }
          break;
        }
        default: {
          cout << " ERROR DMA Address " << address << " no such register" << endl;
          gp.set_response_status( tlm::TLM_COMMAND_ERROR_RESPONSE );
        }
      }
      break;
    }
    default: break;
  }

  return;
}












