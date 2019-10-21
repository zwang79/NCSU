import emu_type_pkg::*;

class i2c_transaction extends ncsu_transaction;
  `ncsu_register_object(i2c_transaction)

       bit [63:0] header, payload [8], trailer;
  rand bit [5:0]  delay;
       bit [7:0]  i2c_data_write [];
       bit [7:0]  i2c_data_read [];
       i2c_op_t i2c_op;
       //bit [1:0]  i2c_op;
       bit [6:0]  i2c_addr_monitor;
       bit [7:0]  i2c_data_monitor [];
       i2c_op_t i2c_op_monitor;
       //bit [1:0]  i2c_op_monitor;

  function new(string name=""); 
    super.new(name);
  endfunction

  virtual function string convert2string();
     return {super.convert2string(),$sformatf("i2c_data_write:0x%p i2c_data_read:0x%p", i2c_data_write, i2c_data_read, )};
  endfunction

  function bit compare(i2c_transaction rhs);
    return ((this.i2c_addr_monitor  == rhs.i2c_addr_monitor) && 
            (this.i2c_op_monitor == rhs.i2c_op_monitor) &&
            (this.i2c_data_monitor == rhs.i2c_data_monitor) );
  endfunction
endclass
