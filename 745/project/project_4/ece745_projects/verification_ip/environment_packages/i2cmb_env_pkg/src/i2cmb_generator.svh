`timescale 1ns / 10ps
class i2cmb_generator extends ncsu_component#(.T(wb_transaction));


  sequence_base seq;
  ncsu_component #(T) wb_agent;
  ncsu_component #(i2c_transaction) i2c_agent;

  string seq_name;
  

  function new(string name = "", ncsu_component #(T)  parent = null); 
    super.new(name,parent);

   if ( !$value$plusargs("GEN_SEQ_TYPE=%s", seq_name)) begin
      $display("FATAL: +GEN_SEQ_TYPE plusarg not found on command line");
      $fatal;
    end
    $display("%m found +GEN_SEQ_TYPE=%s", seq_name); 
    $cast(seq,ncsu_object_factory::create(seq_name));
  endfunction


  virtual task run();

    seq.set_wb_agent(wb_agent);
    seq.set_i2c_agent(i2c_agent);


    seq.run();

  endtask

  function void set_wb_agent(ncsu_component #(T) agent);
    wb_agent = agent;
  endfunction

  function void set_i2c_agent(ncsu_component #(i2c_transaction) agent);
    i2c_agent = agent;
  endfunction

endclass
