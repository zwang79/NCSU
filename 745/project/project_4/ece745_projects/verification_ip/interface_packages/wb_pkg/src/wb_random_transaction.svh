class wb_random_transaction extends wb_transaction;
  `ncsu_register_object(wb_random_transaction)

  rand bit[1:0]     addr_type;
  rand bit[1:0]       op_type;
  rand bit[7:0]       data;

  function new(string name=""); 
    super.new(name);
  endfunction

  constraint addr_c {addr_type inside {CSR, DPR, CMDR, FSMR};}
  constraint op_c {op_type inside {WT, RD, INT};}
  constraint data_c {data inside {ZEROS, ONES, ZEROONE, ONEZERO};}

/*  constraint op_c { 
             header_sub_type == CONTROL -> trailer_type inside {SYNC,PARITY};
             header_sub_type == DATA    -> trailer_type inside {PARITY,ECC,CRC};
             header_sub_type == RESET   -> trailer_type inside {ZEROS,ONES,SYNC};
             }  */

  function void post_randomize();
    wb_addr = addr_type;
    wb_op   = op_type;
    wb_data = data;
    $display("************************************HEY*********************************");
  endfunction             


endclass

