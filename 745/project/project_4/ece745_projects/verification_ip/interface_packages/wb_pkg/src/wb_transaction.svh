class wb_transaction extends ncsu_transaction;
  `ncsu_register_object(wb_transaction)

      // bit [63:0] header, payload [8], trailer;
  rand bit [5:0]  delay;
       rand bit [7:0] wb_data;
       rand bit [1:0]  wb_addr;
       rand bit [1:0]  wb_op;
       bit [7:0] wb_data_monitor;
       bit [1:0]  wb_addr_monitor;
       bit wb_we_monitor;

  function new(string name=""); 
    super.new(name);
  endfunction

  constraint addr_c {wb_addr inside {CSR, DPR, CMDR, FSMR};}
  constraint op_c {wb_op inside {WT, RD};}
 // constraint data_c {wb_data inside {ZEROS, ONES, ZEROONE, ONEZERO};}

  virtual function string convert2string();
//     return {super.convert2string(),$sformatf("header:0x%x payload:0x%p trailer:0x%x delay:%d", header, payload, trailer, delay)};
     return {super.convert2string(),$sformatf("wb_data:0x%h wb_addr:%b wb_op:%b", wb_data, wb_addr, wb_op)};
  endfunction

 /* function bit compare(wb_transaction rhs);
    return ((this.header  == rhs.header ) && 
            (this.payload == rhs.payload) &&
            (this.trailer == rhs.trailer) );
  endfunction */
endclass
