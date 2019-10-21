class sequence_two extends sequence_base;
  `ncsu_register_object(sequence_two)

  wb_transaction wb_trans_rand[10000];
  //wb_transaction wb_trans;
  //ncsu_component #(wb_transaction) wb_agent;
  //string trans_name_wb;
  //ncsu_component #(wb_transaction) agent;

  function new(string name=""); 
    super.new(name);
  endfunction

  virtual task run();
    wb_trans = new("wb_trans");
    fork
    begin // wb_thread
    // set bus
      wb_trans.wb_addr = 2'b00;
      wb_trans.wb_data = 8'b11xxxxxx;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_data = 8'b01;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx110;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);
      
      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);
      
      // start cmd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx100;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

    foreach (wb_trans_rand[i]) begin  
      wb_trans_rand[i] = new("wb_trans_rand");
      assert (wb_trans_rand[i].randomize());
      wb_agent.bl_put(wb_trans_rand[i]);
      end
    end

    begin // i2c_thread
      forever begin
      i2c_agent.bl_put(i2c_trans);
      end
    end
    join_any  

  endtask


endclass
