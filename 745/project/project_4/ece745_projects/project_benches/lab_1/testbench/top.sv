`timescale 1ns / 10ps

module top();

parameter int WB_ADDR_WIDTH = 2;
parameter int WB_DATA_WIDTH = 8;
parameter int NUM_I2C_SLAVES = 1;

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
tri  [NUM_I2C_SLAVES-1:0] sda;


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
// Monitor Wishbone bus and display transfers in the transcript

initial
  begin: wb_monitoring
    bit [WB_ADDR_WIDTH-1:0] addr_my;
    bit [WB_DATA_WIDTH-1:0] data_my;
    bit we_my;
    #1000
    forever begin
    wb_bus.master_monitor(.addr(addr_my), .data(data_my), .we(we_my));
    $display("Address=%h\nData=%h\nwe=%b\n",addr_my,data_my,we_my);
    end
  end: wb_monitoring

    /*bit [WB_ADDR_WIDTH-1:0] addr_my;
    bit [WB_DATA_WIDTH-1:0] data_my;
    bit we_my;
always @(posedge clk)
    wb_bus.master_monitor(.addr(addr_my), .data(data_my), .we(we_my));

always @(addr_my or data_my or we_my)
    $display("Address=0x%h\nData=0x%h\nwe=%b\n",addr_my,data_my,we_my);*/

// ****************************************************************************
// Define the flow of the simulation

initial
  begin: test_flow
   bit [WB_DATA_WIDTH-1:0] dat_r;
   //irq = 1'b0;
   dat_r = 8'b0;
/* 6.1 example 1 */
   #1100 wb_bus.master_write(.addr(2'b00), .data(8'b11xxxxxx));
/* 6.3 example 3 */
/* 1 */
   wb_bus.master_write(.addr(2'b01), .data(8'h05));
/* 2 */
   wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx110));
/* 3 */
   //while(irq==1) @(posedge clk);
   //while((dat_r[7]==1'b0)) @(posedge clk);
   //wb_bus.master_read(.addr(2'b10), .data(dat_r));
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         $display("1st CMDR value is %h",dat_rd_i);
         break;
        end

      end
   while ((dat_r[7]==1'b0));

/* 4 */
   wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx100));
/* 5 */
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         $display("2nd CMDR value is %h",dat_rd_i);
         break;
        end

      end
   while ((dat_r[7]==1'b0));
   //do wb_bus.master_read(.addr(2'b10), .data(dat_r));
   //while ((irq == 1'b0)&&(dat_r[7]==1'b0));
   //irq = 1'b0;
   dat_r = 8'b0;
/* 6 */
   wb_bus.master_write(.addr(2'b01), .data(8'h44));
/* 7 */
   #20 wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx001));
/* 8 */
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r));
         $display("3rd CMDR value is %h",dat_rd_i);
         break;
        end
      end
   while ((dat_r[7]==1'b0));
   if (dat_rd_i[6]==1'b1) $display("NACK here!");
   //do wb_bus.master_read(.addr(2'b10), .data(dat_r));
   //while(dat_r[6]==1'b1);
   //irq = 1'b0;
   dat_r = 8'b0;
/* 9 */
   wb_bus.master_write(.addr(2'b01), .data(8'h78)); 
/* 10 */  
   #20 wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx001));
/* 11 */ 
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         $display("4th CMDR value is %h",dat_rd_i);
         break;
        end

      end
   while ((dat_r[7]==1'b0));
   //irq = 1'b0;
   dat_r = 8'b0;
/* 12 */ 
   wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx101));
/* 13 */ 
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         $display("5th CMDR value is %h",dat_rd_i);
         break;
        end

      end
   while ((dat_r[7]==1'b0));
   //irq = 1'b0;
  end: test_flow


// ****************************************************************************
// Instantiate the Wishbone master Bus Functional Model
wb_if       #(
      .ADDR_WIDTH(WB_ADDR_WIDTH),
      .DATA_WIDTH(WB_DATA_WIDTH)
      )
wb_bus (
  // System sigals
  .clk_i(clk),
  .rst_i(rst),
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


endmodule
