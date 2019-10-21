`timescale 1ns / 10ps
`include "../../../verification_ip/interface_packages/wb_pkg/src/wb_if.sv"
`include "../../../verification_ip/interface_packages/i2c_pkg/src/i2c_if.sv"


module top();

parameter int WB_ADDR_WIDTH = 2;
parameter int WB_DATA_WIDTH = 8;
parameter int I2C_ADDR_WIDTH = 7;
parameter int I2C_DATA_WIDTH = 8;
parameter int NUM_I2C_SLAVES = 1;

  import ncsu_pkg::*;
  import wb_pkg::*;
  import i2c_pkg::*;
  import i2cmb_env_pkg::*;

bit  clk;
bit  rst = 1'b1;
wire cyc;
wire stb;
wire we;
tri1 ack;
wire [WB_ADDR_WIDTH-1:0] adr;
wire [WB_DATA_WIDTH-1:0] dat_wr_o;
wire [WB_DATA_WIDTH-1:0] dat_rd_i;
wire irq;
tri  [NUM_I2C_SLAVES-1:0] scl;
triand  [NUM_I2C_SLAVES-1:0] sda;

// internal signals
//bit [I2C_ADDR_WIDTH-1:0] addr_i2c;
//bit [I2C_DATA_WIDTH-1:0] data_i2c[];
//bit [1:0] op_i2c;
int alt_cnt;

// provide read data signals
bit [I2C_DATA_WIDTH-1:0] r_data [];
int assign_cnt;


i2cmb_test tst;

// Instantiate the Wishbone master Bus Functional Model
wb_if       #(
      .ADDR_WIDTH(WB_ADDR_WIDTH),
      .DATA_WIDTH(WB_DATA_WIDTH)
      )
wb_bus (
  // System sigals
  .clk_i(clk),
  .rst_i(rst),
  .irq_i(irq),
  // Master signals
  .cyc_o(cyc),
  .stb_o(stb),
  .ack_i(ack),
  .adr_o(adr),
  .we_o(we),
  // Slave signals
  .cyc_i(),
  .stb_i(),
  .ack_o(),
  .adr_i(),
  .we_i(),
  // Shred signals
  .dat_o(dat_wr_o),
  .dat_i(dat_rd_i)
  );

// ****************************************************************************
// Instantiate the DUT - I2C Multi-Bus Controller
\work.iicmb_m_wb(str) #(.g_bus_num(NUM_I2C_SLAVES)) DUT
  (
    // ------------------------------------
    // -- Wishbone signals:
    .clk_i(clk),         // in    std_logic;                            -- Clock
    .rst_i(rst),         // in    std_logic;                            -- Synchronous reset (active high)
    // -------------
    .cyc_i(cyc),         // in    std_logic;                            -- Valid bus cycle indication
    .stb_i(stb),         // in    std_logic;                            -- Slave selection
    .ack_o(ack),         //   out std_logic;                            -- Acknowledge output
    .adr_i(adr),         // in    std_logic_vector(1 downto 0);         -- Low bits of Wishbone address
    .we_i(we),           // in    std_logic;                            -- Write enable
    .dat_i(dat_wr_o),    // in    std_logic_vector(7 downto 0);         -- Data input
    .dat_o(dat_rd_i),    //   out std_logic_vector(7 downto 0);         -- Data output
    // ------------------------------------
    // ------------------------------------
    // -- Interrupt request:
    .irq(irq),           //   out std_logic;                            -- Interrupt request
    // ------------------------------------
    // ------------------------------------
    // -- I2C interfaces:
    .scl_i(scl),         // in    std_logic_vector(0 to g_bus_num - 1); -- I2C Clock inputs
    .sda_i(sda),         // in    std_logic_vector(0 to g_bus_num - 1); -- I2C Data inputs
    .scl_o(scl),         //   out std_logic_vector(0 to g_bus_num - 1); -- I2C Clock outputs
    .sda_o(sda)          //   out std_logic_vector(0 to g_bus_num - 1)  -- I2C Data outputs
    // ------------------------------------
  );

// Instantiate i2c_if module
i2c_if    #(
            .I2C_ADDR_WIDTH(I2C_ADDR_WIDTH),
            .I2C_DATA_WIDTH(I2C_DATA_WIDTH)
           )
i2c_bus    (
            .scl(scl),
            .sda(sda)
           );


// ****************************************************************************
// Clock generator

initial
  begin: clk_gen
    clk = 1'b0;
    forever #5 clk = ~clk;
  end: clk_gen

// ****************************************************************************
// Reset generator

initial
  begin: rst_gen
    #113 rst = 1'b0;
  end: rst_gen
  
// ****************************************************************************
// Define the flow of the simulation

initial
  begin: test_flow

    ncsu_config_db#(virtual wb_if)::set("tst.env.wb_agent", wb_bus);
    ncsu_config_db#(virtual i2c_if)::set("tst.env.i2c_agent", i2c_bus);
    tst = new("tst",null);
    tst.run();
    #10000 $finish;
  end: test_flow

     
// **************************************************************************** */

endmodule
