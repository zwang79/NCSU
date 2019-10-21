class i2cmb_environment extends ncsu_component#(.T(wb_transaction));

  i2cmb_env_configuration configuration;
  wb_agent         wb_agent;
  i2c_agent        i2c_agent;
  i2cmb_predictor         pred;
  i2cmb_scoreboard        scbd;
  i2cmb_coverage          coverage;

  function new(string name = "", ncsu_component_base  parent = null); 
    super.new(name,parent);
  endfunction 

  function void set_configuration(i2cmb_env_configuration cfg);
    configuration = cfg;
  endfunction

  virtual function void build();
    wb_agent = new("wb_agent",this);
    wb_agent.set_configuration(configuration.wb_agent_config);
    wb_agent.build();
    i2c_agent = new("i2c_agent",this);
    i2c_agent.set_configuration(configuration.i2c_agent_config);
    i2c_agent.build();
    pred  = new("pred", this);
    pred.set_configuration(configuration);
    pred.build();
    scbd  = new("scbd", this);
    scbd.build();
    coverage = new("coverage", this);
    coverage.set_configuration(configuration);
    coverage.build();
    wb_agent.connect_subscriber_wb(coverage);
    wb_agent.connect_subscriber_wb(pred);
    pred.set_scoreboard(scbd);
    i2c_agent.connect_subscriber_i2c(scbd);
  endfunction

  function ncsu_component#(T) get_wb_agent();
    return wb_agent;
  endfunction

  function ncsu_component#(i2c_transaction) get_i2c_agent();
    return i2c_agent;
  endfunction

  virtual task run();
    fork 
     wb_agent.run();
     i2c_agent.run();
    join
  endtask

endclass
