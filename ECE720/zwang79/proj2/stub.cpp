/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 11/25/2019 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "stub.h"
#include <string>
#include <iostream>
#include <iomanip>


using namespace std;

stub::stub (sc_core::sc_module_name name, const char *xactfile)
  : sc_module(name), filename(xactfile)
 { 
    master(*this);
    SC_THREAD(main);
 }


unsigned int atoi(unsigned char c0, unsigned char c1)
{ 
  unsigned int i=0;

  if (c0 >= 48 && c0 <= 57)
    i=c0-48;
  else if (c0 >=65 && c0 <= 70)
    i=c0-55;
  else if (c0 >=97 && c0 <= 102)
    i=c0-87;
  else
    cout << "ERROR: Could not convert " << c0 << " to a hexadecimal value\n";

  if (c1 >= 48 && c1 <= 57)
    i+=(c1-48)*16;
  else if (c1 >=65 && c1 <= 70)
    i+=(c1-55)*16;
  else if (c1 >=97 && c1 <= 102)
    i+=(c1-87)*16;
  else
    cout << "ERROR: Could not convert " << c1 << " to a hexadecimal value\n";

  //cout << "returning " << i << endl;
  return i;
} 

void stub::main(void)
{
  sc_core::sc_time delay=sc_core::SC_ZERO_TIME; // Transaction delay
  tlm::tlm_generic_payload  gp;                 // Payload
  gp.set_streaming_width  ( 4 );                // Assume 4-byte bus width
  unsigned long length;                         // Transaction length (bytes)
  sc_dt::uint64 addr;                           // Transaction address
  unsigned char data[64]; // the reason why this is 64 array: to support burst 16: 16 * 4 = 64 bytes                      // Transaction data
  unsigned char compare_data[64];               // Comparison data
  unsigned long i;                              // Loop iterator variable
  int pos;                                      // position for reading data
  unsigned char c0,c1;                          // Characters for reading data
  bool b_different;                             // Data comparison flag

  // Variables for reading transaction file
  ifstream f(filename,ios::in);
  char time_mode;
  double time_val;
  string time_unit;
  sc_core::sc_time start_time;
  string cmd;
  string data_buf;

  gp.set_data_ptr(data);

  // Skip the first line, assume it is a comment
  if (f.good())
    getline(f,cmd);
  while (f.good()) {
    f >> time_mode >> time_val >> time_unit >> cmd >> hex >> length >> addr >> data_buf;
    if (!f.good())
      continue;

    if (cmd=="WRITE")
      gp.set_command(tlm::TLM_WRITE_COMMAND);
    else if (cmd=="READ")
      gp.set_command(tlm::TLM_READ_COMMAND);
    else {
      cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
	   << " Unrecognized command: " << cmd << endl;
      continue;
    }
    gp.set_address( addr );
    gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE );
    gp.set_data_length( length );

    // Copy data into transaction payload data buffer
    // Assume first two characters are "0x"
    if (data_buf!="none") {
      for (i=0;i<length;i++) {
        pos=data_buf.length()-2*(i+1);
        if (pos==1) {
          //cout << "pos " << dec << pos << " " << data_buf.substr(2,1) << endl;
          c0=data_buf[2];  c1='0';
        }
        else if (pos < 1) {
          //cout << "pos " << dec << pos << " 0" << endl;
          c0='0'; c1='0';
        }
        else {
          //cout << "pos " << dec << pos << " " << data_buf.substr(pos,2) << endl;
          c0 = data_buf[pos+1]; c1 = data_buf[pos];
        }
        if (cmd=="WRITE")
          data[i] = atoi(c0,c1);
        else
          compare_data[i] = atoi(c0,c1);
        //cout << "atoi(" << c0 << "," << c1 << ")=" << hex << atoi(c0,c1)
        //     << ", data[" << i << "]=" << (unsigned int)data[i] << endl;
      }
    }

    //if (cmd == "WRITE") gp.set_data_ptr(data); // if "write", load the data on gp

    // Parse the time from the transaction file, store in start_time
    if (time_unit=="fs")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_FS);  }
    else if (time_unit=="ps")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_PS);  }
    else if (time_unit=="ns")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_NS);  }
    else if (time_unit=="us")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_US);  }
    else if (time_unit=="ms")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_MS);  }
    else
      { start_time=sc_core::sc_time(time_val,sc_core::SC_SEC); }

    // If time_mode is '+', increment start_time by current time
    if (time_mode=='+')
      { start_time+=sc_core::sc_time_stamp(); }

    // Wait until the transaction start-time is reached
    if (sc_core::sc_time_stamp() < start_time)
      wait( start_time-sc_core::sc_time_stamp() );

    // Perform the transaction
    cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
         << " " << cmd << " len:0x" << hex << length << " addr:0x" << addr;
    if (data_buf!="none" && cmd=="WRITE") {
      cout << " data:0x";
      for (i=length;i>0;i--) {
        cout << hex << setfill('0') << setw(2) << (unsigned int)data[i-1];
      }
      cout << endl;
    }
    else
      cout << endl;
    master->b_transport(gp, delay);
    if (gp.get_response_status() == tlm::TLM_OK_RESPONSE) {
      if (cmd=="READ") {
        b_different = false;
        cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
             << " READ completed data:0x";
        for (i=length;i>0;i--) {
          cout << hex << setfill('0') << setw(2) << (unsigned int)data[i-1];
          if (data[i-1] != compare_data[i-1])
            b_different=true;
        }
        cout << endl;
        if (data_buf!="none" && b_different)
          cout << "WARNING: READ data differs from expected data\n";
      }
    }
    else
      cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
           << " ERROR Response Status " << gp.get_response_status() << endl;
  }
   
  cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
       << " Completed" << endl;
} // end main


tlm::tlm_sync_enum  stub::nb_transport_bw( tlm::tlm_generic_payload &gp,
                           tlm::tlm_phase &phase, sc_core::sc_time &delay)
{
  tlm::tlm_sync_enum status;
  status = tlm::TLM_ACCEPTED;
  return status;
} // end nb_transport_bw


void stub::invalidate_direct_mem_ptr					
  (sc_dt::uint64 start_range, sc_dt::uint64 end_range)
{  
    return;
} // end invalidate_direct_mem_ptr
