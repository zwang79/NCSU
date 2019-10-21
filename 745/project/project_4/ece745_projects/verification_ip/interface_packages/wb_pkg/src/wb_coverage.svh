class wb_coverage extends ncsu_component#(.T(wb_transaction));

    wb_configuration configuration;
  	addr_type_t     addr_type;
  	op_type_t       op_type;
  	data_type_t     data_type;

  covergroup wb_transaction_cg;
  	option.per_instance = 1;
    option.name = get_full_name();

  	addr_type:     coverpoint addr_type
  	{
  	bins CSR = {CSR};
  	bins DPR = {DPR};
  	bins CMDR = {CMDR};
  	bins FSMR = {FSMR};
  	}

  	op_type: coverpoint op_type
  	{
  	bins WT = {WT};
  	bins RD = {RD};
  	bins INT = {INT};
  	}

  	data_type:    coverpoint data_type
  	{
  	bins ZEROS = {ZEROS};
  	bins ONES = {ONES};
  	bins ZEROONE = {ZEROONE};
  	bins ONEZERO = {ONEZERO};	
  	} 


  endgroup

  function new(string name = "", ncsu_component #(T) parent = null); 
    super.new(name,parent);
    wb_transaction_cg = new;
  endfunction

  function void set_configuration(wb_configuration cfg);
    configuration = cfg;
  endfunction

  virtual function void nb_put(T trans);
    $display("wb_coverage::nb_put() %s called",get_full_name());
    addr_type     = addr_type_t'(trans.wb_addr);
  	op_type   = op_type_t'(trans.wb_op);
  	data_type = data_type_t'(trans.wb_data[7:0]); 
    wb_transaction_cg.sample();
  endfunction

endclass
