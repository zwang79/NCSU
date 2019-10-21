class sequence_base extends ncsu_object;
  `ncsu_register_object(sequence_base)

  wb_transaction wb_trans = new;
  i2c_transaction i2c_trans = new;
 // string trans_name_wb;
  ncsu_component #(wb_transaction) wb_agent;
  ncsu_component #(i2c_transaction) i2c_agent;

  function new(string name=""); 
    super.new(name);
  endfunction

  virtual task run();
    bit [7:0] dat_r;
  //  wb_agent.build();
   // wb_agent = new;
   // i2c_agent = new;
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

      // write address
      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_data = 8'h44;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // write comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx001;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);


    for (int data_w = 0; data_w <= 8'd31; data_w++) begin // write 0~31
      // write data
      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_data = data_w;//data_w
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // write comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx001;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

    end 
      
      // stop comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx101;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

  //  #10000;


      // read 100~131
    // read value providing loop
    for (int assign_cnt = 'd100; assign_cnt <= 'd131; assign_cnt++) begin // provide read data 100~131
      i2c_trans.i2c_data_read = new [assign_cnt-'d99](i2c_trans.i2c_data_read);
      i2c_trans.i2c_data_read[assign_cnt - 'd100] = assign_cnt;
    end 

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

      // write address
      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_data = 8'h45;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // write comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx001;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

    // read loop
    for (int read_cnt = 'd0; read_cnt <= 'd31; read_cnt++) begin
      // read with ACK cmd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx010;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

      // read cmd
      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);
    end

      // stop comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx101;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

    #10000;
    // write and read back and forth      
    for (int alt_cnt = 0; alt_cnt <= 32'd127; alt_cnt ++) begin
      if (alt_cnt%2 == 0) begin // all the write operations
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
 
      // write address
      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_data = 8'h44;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // write comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx001;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

      // write data
      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_data = alt_cnt/2 + 'd64;// write 64~127 to DPR
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // write comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx001;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

      // stop comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx101;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);
      end
         
      else begin // all the read operations
         
      i2c_trans.i2c_data_read    = new [1];
      i2c_trans.i2c_data_read[0] = 'd63 - (alt_cnt-1)/2;

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
 
      // write address
      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_data = 8'h45;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // write comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx001;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

      // read with ACK cmd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx010;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);
         
      // read cmd read 63~0 from DPR
      wb_trans.wb_addr = 2'b01;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);

      // stop comd
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_data = 8'bxxxxx101;
      wb_trans.wb_op   = 2'b00;
      wb_agent.bl_put(wb_trans);

      // interupt
      wb_trans.wb_op   = 2'b10;
      wb_agent.bl_put(wb_trans);
      wb_trans.wb_addr = 2'b10;
      wb_trans.wb_op   = 2'b01;
      wb_agent.bl_put(wb_trans);
      end              
    end
    end 

    begin // i2c_thread
      forever begin
      i2c_agent.bl_put(i2c_trans);
      end
    end
    join_any  
 
    
  endtask

  function void set_wb_agent(ncsu_component #(wb_transaction) agent);
    wb_agent = agent;  
  endfunction 

  function void set_i2c_agent(ncsu_component #(i2c_transaction) agent);
    i2c_agent = agent;  
  endfunction 

endclass
