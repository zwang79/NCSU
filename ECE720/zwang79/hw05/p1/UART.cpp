#include <systemc.h>
#include <list>
#include "read_master_if.h"
#include "CPU.h"
using namespace std;

class UART : public sc_module, read_master_if<char>

{

public:

  sc_export<read_master_if<char> > slave;

  list<char> fifo;

  SC_HAS_PROCESS(UART);



  UART(sc_module_name name) : sc_module(name)  {

    SC_THREAD(main);

    slave.bind(*this);

  }



  void read(int addr, char &c) { 

    if (addr == 0) {

    	if (fifo.size() == 0) c = 0;

    	else c = 1;

    }
    else {

    	c = fifo.front();

    	fifo.pop_front();

    }

  }


  void main() {

   // char c;
		const char *str = "Hello, World!\n";

    	const char *p = str;


    while (true) {

  //  	cout << *p << endl;

	cout << sc_time_stamp().to_string() << " UART write " << *p << " to fifo\n";

    	fifo.push_back(*p++);


    	if (!*p) p=str;

        wait(100, SC_NS);

    }

  }

};



class top : public sc_module

{

public:

  CPU cpu_inst;

  UART uart_inst;



  top(sc_module_name name) :

    sc_module(name),

    cpu_inst("CPU"),

    uart_inst("UART")

  {

    cpu_inst.master(uart_inst.slave);

  }

};



int sc_main (int argc, char *argv[])

{

  top top1("Top1");

  sc_start(2800, SC_NS);

  cout << endl <<endl;

  return 0;

}



