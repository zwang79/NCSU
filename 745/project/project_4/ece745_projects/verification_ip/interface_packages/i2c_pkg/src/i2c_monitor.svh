class i2c_monitor extends ncsu_component#(.T(i2c_transaction));

  i2c_configuration  configuration;
  virtual i2c_if bus;

  T monitored_trans;
  ncsu_component #(T) agent;

  function new(string name = "", ncsu_component_base  parent = null); 
    super.new(name,parent);
  endfunction

  function void set_configuration(i2c_configuration cfg);
    configuration = cfg;
  endfunction

  function void set_agent(ncsu_component#(T) agent);
    this.agent = agent;
  endfunction
  
  virtual task run ();
   // bus.wait_for_reset();
      forever begin
        monitored_trans = new("monitored_trans");
        bus.monitor(monitored_trans.i2c_addr_monitor,
                    monitored_trans.i2c_op_monitor,
                    monitored_trans.i2c_data_monitor
                    );
       if (monitored_trans.i2c_op_monitor == READ) $display("I2C_BUS READ Transfer:\naddress =%h\noperation is READ\ndata=%p\n\n",monitored_trans.i2c_addr_monitor,monitored_trans.i2c_data_monitor);
       else if (monitored_trans.i2c_op_monitor == WRITE) $display("I2C_BUS WRITE Transfer:\naddress =%h\noperation is WRITE\ndata =%p\n\n",monitored_trans.i2c_addr_monitor,monitored_trans.i2c_data_monitor);
       /* $display("%s i2c_monitor::run() header 0x%x payload 0x%p trailer 0x%x delay 0x%x",
                 get_full_name(),
                 monitored_trans.header, 
                 monitored_trans.payload, 
                 monitored_trans.trailer, 
                 monitored_trans.delay
                 ); */
        agent.nb_put(monitored_trans);
    end 
  endtask

endclass
