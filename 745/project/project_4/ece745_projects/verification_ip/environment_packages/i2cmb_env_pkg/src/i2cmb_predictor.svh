import emu_type_pkg::*;
class i2cmb_predictor extends ncsu_component#(.T(wb_transaction));

  ncsu_component#(i2c_transaction) scoreboard;
  i2c_transaction convert_trans = new;
  i2c_transaction transport_trans = new;
  i2cmb_env_configuration configuration;
  int cnt = 0;

  

  function new(string name = "", ncsu_component_base  parent = null); 
    super.new(name,parent);
  endfunction

  function void set_configuration(i2cmb_env_configuration cfg);
    configuration = cfg;
  endfunction

  virtual function void set_scoreboard(ncsu_component #(i2c_transaction) scoreboard);
      this.scoreboard = scoreboard;
  endfunction

  virtual function void nb_put(T trans);
    if ((trans.wb_addr_monitor == 2) && (trans.wb_data_monitor == 4) && (trans.wb_we_monitor == 1)) begin
      cnt = 1; // start
      $display("Predictor detects START\n\n");
      return;
    end
    if ((trans.wb_addr_monitor == 2) && (trans.wb_data_monitor == 5) && (trans.wb_we_monitor == 1)) begin
      cnt = 0; // stop
      $display("Predictor detects STOP\n\n");
      if (convert_trans.i2c_op_monitor == READ) $display("*************************************************************************\nWB_BUS Transfer COMPLETED:\naddress =%h\noperation is READ\ndata=%p\n\n",convert_trans.i2c_addr_monitor,convert_trans.i2c_data_monitor);
      else if (convert_trans.i2c_op_monitor == WRITE) $display("*************************************************************************\nWB_BUS Transfer COMPLETED:\naddress =%h\noperation is WRITE\ndata =%p\n\n",convert_trans.i2c_addr_monitor,convert_trans.i2c_data_monitor);
      scoreboard.nb_transport(convert_trans, transport_trans);
      return;
    end
    if (cnt > 0) begin
      if (cnt == 1) begin
      if (trans.wb_addr_monitor == 1) begin
      convert_trans.i2c_addr_monitor = trans.wb_data_monitor[7:1]; // assign i2c_addr, discard last bit
      if (convert_trans.i2c_op_monitor == READ) $display("WB_BUS ADDR CHANGE CAPTURED:\naddress = NULL\noperation is READ\ndata=%p\n\n",convert_trans.i2c_addr_monitor);
      else if (convert_trans.i2c_op_monitor == WRITE) $display("WB_BUS ADDR CHANGE CAPTURED:\naddress = NULL\noperation is WRITE\ndata =%p\n\n",convert_trans.i2c_addr_monitor);
      cnt++;
      end
      end
      else begin
        if (trans.wb_addr_monitor == 1) begin
          convert_trans.i2c_data_monitor = new[cnt-1](convert_trans.i2c_data_monitor);
          convert_trans.i2c_data_monitor[cnt-2] = trans.wb_data_monitor;
          convert_trans.i2c_op_monitor = (trans.wb_we_monitor == 1)?WRITE:READ;
          if (convert_trans.i2c_op_monitor == READ) $display("WB_BUS DATA CHANGE CAPTURED:\naddress =%h\noperation is READ\ndata=%p\n\n",convert_trans.i2c_addr_monitor,convert_trans.i2c_data_monitor);
          else if (convert_trans.i2c_op_monitor == WRITE) $display("WB_BUS DATA CHANGE CAPTURED:\naddress =%h\noperation is WRITE\ndata =%p\n\n",convert_trans.i2c_addr_monitor,convert_trans.i2c_data_monitor);
          cnt ++;
        end 
      end
    end
          
      
  

    //$display({get_full_name()," ",trans.convert2string()});
    //scoreboard.nb_transport(convert_trans, transport_trans);
  endfunction

endclass
