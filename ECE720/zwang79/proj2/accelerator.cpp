/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 11/25/2019 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "accelerator.h"
#include <string>
#include <iostream>
#include <iomanip>

using namespace  std;

SC_HAS_PROCESS(accelerator);
accelerator::accelerator( sc_core::sc_module_name module_name )
  : sc_module (module_name)
  //, m_memory_size (memory_size)
{
  
  slave.register_b_transport(this, &accelerator::custom_b_transport);
  weight=new unsigned char[32];
  mult  =new unsigned char[32];
  
}

accelerator::~accelerator()
{
  delete weight; 
  delete mult;
}

void                                        
accelerator::custom_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  unsigned long    length    = gp.get_data_length();
  unsigned long    i;
  unsigned char    *dp       = gp.get_data_ptr();
  sc_dt::uint64    address_mask;
  unsigned char  w_byte[4];
  unsigned char  m_byte[4];
  float          w_f;
  float          m_f;
  float          accum_f;

  sc_core::sc_time accelerator_delay(10,sc_core::SC_NS);
  sc_core::sc_time burst(10,sc_core::SC_NS);
  sc_core::sc_time accum_block_delay(5,sc_core::SC_NS); 

  wait(delay+accelerator_delay);

  switch (command) {
    case tlm::TLM_READ_COMMAND: {
      wait(burst * (length >> 2)); // Burst latency
      cout << sc_core::sc_time_stamp() << " " << sc_object::name();
      cout << " READ len:0x" << hex << length << " addr:0x" << address; 
      cout << " data:0x";
      address_mask = address & 0xFF;

      if (address_mask == 0x00) { // reading from accumulator
        for (i = length; i > 0; i--) {
          cout << hex << setfill('0') << setw(2) << (unsigned int)accum[i-1];
          dp[i-1] = accum[i-1];
        }
      }

      if (address_mask >= 0x10 && address_mask <= 0x2f) { // reading from WEIGHT registers
        for (i=length;i>0;i--) {
          cout << hex << setfill('0') << setw(2) << (unsigned int)weight[address_mask - 0x10 + i - 1];
          dp[i-1] = weight[address_mask - 0x10 + i - 1];
        }
      }

      if (address_mask >= 0x30 && address_mask <= 0x3f) { // reading from MULT registers
        for (i=length;i>0;i--) {
          cout << hex << setfill('0') << setw(2) << (unsigned int)mult[address_mask - 0x30 + i - 1];
          dp[i-1] = mult[address_mask - 0x30 + i - 1];
        }
      }

      cout << endl;
      gp.set_response_status( tlm::TLM_OK_RESPONSE );
      break;
    }
    

    case tlm::TLM_WRITE_COMMAND: {

      address_mask = address & 0xFF;

      
      if (address_mask == 0x00) { //  writing to accumulator
        wait(burst * (length >> 2)); // Burst latency
        cout << sc_core::sc_time_stamp() << " " << sc_object::name();
        cout << " WRITE len:0x" << hex << length << " addr:0x" << address;
        cout << " data:0x";
        for (i = length; i > 0; i--) {
          cout << hex << setfill('0') << setw(2) << (unsigned int)dp[i-1];
          accum[i-1] = dp[i-1];
        }
      }

      if (address_mask >= 0x10 && address_mask <= 0x2f) { // writing to WEIGHT registers
        wait(burst * (length >> 2)); // Burst latency
        cout << sc_core::sc_time_stamp() << " " << sc_object::name();
        cout << " WRITE len:0x" << hex << length << " addr:0x" << address;
        cout << " data:0x";
        for (i = length; i > 0; i--) {
          cout << hex << setfill('0') << setw(2) << (unsigned int)dp[i-1];
          weight[address_mask - 0x10 + i - 1] = dp[i-1];
        }
      }

      if (address_mask >= 0x30 && address_mask <= 0x4f) { // writing to MULT registers

        cout << sc_core::sc_time_stamp() << " " << sc_object::name();
        cout << " WRITE len:0x" << hex << length << " addr:0x" << address;

        Byte_to_Float(&accum_f, accum); // convert accum[4] to floating point number, ready to be changed
        cout << endl << "DMA Writing to MULT triggers accumulation..." << endl;
        for (i = length; i > 0; i--) {
          mult[address_mask - 0x30 + i - 1] = dp[i-1];
          if ((length - i)%4 == 3) { //  ACCUM = ACCUM + WEIGHT# * MULT#
            w_f = 0;
            m_f = 0;

            wait(burst); 

            cout << sc_core::sc_time_stamp() << " " << sc_object::name();
            cout << " Write MULT[" << (address_mask - 0x30 + i - 1)/4 << "] = 0x";
            for (int k = 3; k >= 0; k--) {
              cout << hex << setfill('0') << setw(2) << (unsigned int)mult[address_mask - 0x30 + i - 1 + k];
              }
            cout << " Accunmulating WEIGHT[" << (address_mask - 0x30 + i - 1)/4 << "] * MULT[" << (address_mask - 0x30 + i - 1)/4 << "]..." << endl;


            for (int j = 3; j >= 0; j--) {
              w_byte[j] = weight[address_mask - 0x30 + i - 1 + j];
              m_byte[j] = mult[address_mask - 0x30 + i - 1 + j];
            }
            // cout << endl;
            // cout << "m = " << hex << m << endl;
            // cout << "w = " << hex << w << endl;
            // memcpy((void *)&w_f, (void *)&w, sizeof(w_f)); // convert int to floating point
            // memcpy((void *)&m_f, (void *)&m, sizeof(m_f)); 
            Byte_to_Float(&w_f, w_byte);
            Byte_to_Float(&m_f, m_byte);
            //cout << endl << "w * m = " << hex << (w_f * m_f) << endl;
            accum_f +=w_f * m_f;
            //cout << "accum_f = " << accum_f << endl;
            Float_to_Byte(accum_f, accum); // convert floating point result back to accum[4] in order to be stored in register
             // cout << "accum = 0x" ;
             // for (int k = 4; k > 0; k--) {
             //   cout << hex << setfill('0') << setw(2) << (unsigned int)accum[k-1];
             // }
             // cout << endl;
          }
        }
        wait(accum_block_delay); // wait for this delay once because other accumulations are parallel with burst MULT write
        cout << sc_core::sc_time_stamp() << " Multiplier writing finished, accumulation done.";
      }
      cout << endl;
      gp.set_response_status( tlm::TLM_OK_RESPONSE );
      break;
    }
   
    default:
      {
        cout << " ERROR Command " << command << " not recognized" << endl;
        gp.set_response_status( tlm::TLM_COMMAND_ERROR_RESPONSE );
      }
  }
  
  return;     
}

void accelerator::Float_to_Byte(float f, unsigned char byte[]) {
  FloatLongType fl;
  fl.fdata = f;
  byte[0] = (unsigned char)fl.ldata;
  byte[1] = (unsigned char)(fl.ldata >> 8);
  byte[2] = (unsigned char)(fl.ldata >> 16);
  byte[3] = (unsigned char)(fl.ldata >> 24);
}

void accelerator::Byte_to_Float(float *f, unsigned char byte[]) {
  FloatLongType fl;
  fl.ldata = 0;
  fl.ldata = byte[3];
  fl.ldata=(fl.ldata << 8) | byte[2];
  fl.ldata=(fl.ldata << 8) | byte[1];
  fl.ldata=(fl.ldata << 8) | byte[0];
  *f=fl.fdata;
}







