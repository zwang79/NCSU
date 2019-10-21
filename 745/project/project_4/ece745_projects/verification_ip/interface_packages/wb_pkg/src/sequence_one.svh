class sequence_one extends sequence_base;
  `ncsu_register_object(sequence_one)

 wb_transaction wb_trans_rand[10000];

  function new(string name=""); 
    super.new(name);
  endfunction

  virtual task run();
    wb_trans = new("wb_trans");
    fork
    begin // wb_thread


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
