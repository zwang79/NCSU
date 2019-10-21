class wb_driver extends ncsu_component#(.T(wb_transaction));

  function new(string name = "", ncsu_component_base  parent = null); 
    super.new(name,parent);
  endfunction

  virtual wb_if bus;
  wb_configuration configuration;
  wb_transaction wb_trans;

  function void set_configuration(wb_configuration cfg);
    configuration = cfg;
  endfunction

  virtual task bl_put(T trans);
    //$display({get_full_name()," ",trans.convert2string()});
    /*if (wb_trans.wb_wr) bus.master_write(wb_trans.wb_addr,
                                         wb_trans.wb_data);
    else                bus.master_read (wb_trans.wb_addr,
                                         wb_trans.wb_data);*/

    case (trans.wb_op)
      2'b00: bus.master_write(trans.wb_addr,
                              trans.wb_data);
      2'b01: bus.master_read (trans.wb_addr,
                              trans.wb_data);
      2'b10: bus.wait_for_interrupt();
    endcase // wb_trans.wb_op

/*bus.drive(trans.wb_data, 
              trans.wb_addr, 
              trans.wb_wr
              );*/
  endtask

endclass
