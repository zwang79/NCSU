class i2c_driver extends ncsu_component#(.T(i2c_transaction));

  function new(string name = "", ncsu_component_base  parent = null); 
    super.new(name,parent);
  endfunction

  virtual i2c_if bus;
  i2c_configuration configuration;
  i2c_transaction i2c_trans;

  function void set_configuration(i2c_configuration cfg);
    configuration = cfg;
  endfunction

  virtual task bl_put(T trans);
    //$display({get_full_name()," ",trans.convert2string()});
    fork
    bus.wait_for_i2c_transfer(.op(trans.i2c_op), .write_data(trans.i2c_data_write));
    bus.provide_read_data (.read_data(trans.i2c_data_read));
    join
    /*bus.drive(trans.header, 
              trans.payload, 
              trans.trailer, 
              trans.delay
              );*/
  endtask

endclass
