`timescale 1ns / 10ps
`include "../../../verification_ip/interface_packages/i2c_pkg/src/i2c_if.sv"


module top();

parameter int WB_ADDR_WIDTH = 2;
parameter int WB_DATA_WIDTH = 8;
parameter int I2C_ADDR_WIDTH = 7;
parameter int I2C_DATA_WIDTH = 8;
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
triand  [NUM_I2C_SLAVES-1:0] sda;

// internal signals
//bit [I2C_ADDR_WIDTH-1:0] addr_i2c;
//bit [I2C_DATA_WIDTH-1:0] data_i2c[];
//bit [1:0] op_i2c;
int alt_cnt;

// provide read data signals
bit [I2C_DATA_WIDTH-1:0] r_data [];
int assign_cnt;


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
    //$display("Address=%h\nData=%h\nwe=%b\n",addr_my,data_my,we_my);
    end
  end: wb_monitoring


// ****************************************************************************
// Define the flow of the simulation

// Write 0 to 31 to i2c_bus

initial
  begin: test_flow
   bit [WB_DATA_WIDTH-1:0] dat_r; // dut output data
   bit [WB_DATA_WIDTH-1:0] data_w; // data being written in the write-32-bits operation
   bit [5:0] read_cnt; // 
   bit [WB_DATA_WIDTH-1:0] data_r; // data being read by wb.read

   dat_r = 8'b0;
   #1100 

   wb_bus.master_write(.addr(2'b00), .data(8'b11xxxxxx));
   wb_bus.master_write(.addr(2'b01), .data(8'h01)); // write 0x01 to DPR, I2C bus
   wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx110)); // write xxxxx110 to CMDR, Set Bus
 
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         break;
       end

   end
   while ((dat_r[7]==1'b0));

 
   wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx100)); // write xxxxx100 to CMDR, Start
 
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         break;
        end

      end
   while ((dat_r[7]==1'b0));
   dat_r = 8'b0;
 
   wb_bus.master_write(.addr(2'b01), .data(8'h44)); // write 0x44 to DPR, address is 22, operation is writing
 
   #20 wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx001)); // write xxxxx001 to CMDR, write address and op
 
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r));
         break;
        end
      end
   while ((dat_r[7]==1'b0));
  // if (dat_r[6]==1'b1) $display("NACK here! time = %t", $time);
   dat_r = 8'b0;
   
  for (data_w = 0; data_w <= 8'd31; data_w++) begin
     wb_bus.master_write(.addr(2'b01), .data(data_w)); // write 0~31 to DPR
     wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx001)); // write xxxxx001 to CMDR, write data

   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r));
         break;
        end
      end
   while ((dat_r[7]==1'b0));
 //  if (dat_r[6]==1'b1) $display("NACK here! time = %t", $time);
   dat_r = 8'b0;
  end

   wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx101)); // write xxxxx101 to CMDR, Stop
 
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         break;
        end

      end
   while ((dat_r[7]==1'b0));
   #10000;

// Read 100 to 131 from i2c_bus
   for (assign_cnt = 'd100; assign_cnt <= 'd131; assign_cnt++) begin // provide read data 100~131
       r_data = new [assign_cnt-'d99](r_data);
       r_data[assign_cnt - 'd100] = assign_cnt;
   end


   wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx100)); // write xxxxx100 to CMDR, Start
   
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         break;
        end

      end
   while ((dat_r[7]==1'b0));
   dat_r = 8'b0;
 
   wb_bus.master_write(.addr(2'b01), .data(8'h45)); // write 0x44 to DPR, address is 22, operation is reading
 
   #20 wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx001)); // write xxxxx001 to CMDR, write address and op
 
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r));
         break;
        end
      end
   while ((dat_r[7]==1'b0));
   //if (dat_r[6]==1'b1) $display("NACK here! time = %t", $time);
   dat_r = 8'b0;
   


   for (read_cnt = 'd0; read_cnt <= 'd31; read_cnt++) begin
     wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx010)); // write xxxxx010 to CMDR, Read with Ack

         wait (irq == 1); 
           wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         
     wb_bus.master_read(.addr(2'b01), .data(data_r));


  end

   wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx101)); // write xxxxx101 to CMDR, Stop
 
   do begin 
       wait (irq == 1) begin
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         break;
        end

      end
   while ((dat_r[7]==1'b0));
  #10000;

// Alternate writes and reads


   
   for (alt_cnt = 0; alt_cnt <= 32'd127; alt_cnt ++) begin
       if (alt_cnt%2 == 0) begin // all the write operations
         wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx100)); // write xxxxx100 to CMDR, Start
 
         do begin 
             wait (irq == 1) begin
               wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
               break;
             end
         end
         while ((dat_r[7]==1'b0));
         dat_r = 8'b0;
 
         wb_bus.master_write(.addr(2'b01), .data(8'h44)); // write 0x44 to DPR, address is 22, operation is writing
 
         #20 wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx001)); // write xxxxx001 to CMDR, write address and op
 
         do begin 
             wait (irq == 1) begin
               wb_bus.master_read(.addr(2'b10), .data(dat_r));
               break;
             end
         end
         while ((dat_r[7]==1'b0));
         //if (dat_r[6]==1'b1) $display("NACK here! time = %t", $time);
         dat_r = 8'b0;

         wb_bus.master_write(.addr(2'b01), .data(alt_cnt/2 + 'd64)); // write 64~127 to DPR
         wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx001)); // write xxxxx001 to CMDR, write data

         do begin 
             wait (irq == 1) begin
               wb_bus.master_read(.addr(2'b10), .data(dat_r));
               break;
             end
         end
         while ((dat_r[7]==1'b0));
         //if (dat_r[6]==1'b1) $display("NACK here! time = %t", $time);
         dat_r = 8'b0;
         wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx101)); // write xxxxx101 to CMDR, Stop
 
         do begin 
             wait (irq == 1) begin
               wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
               break;
             end
         end
         while ((dat_r[7]==1'b0));
       end
         
       else begin // all the read operations
         
         r_data = new [1];
         r_data[0] = 'd63 - (alt_cnt-1)/2;


         wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx100)); // write xxxxx100 to CMDR, Start
 
         do begin 
             wait (irq == 1) begin
               wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
               break;
             end
         end
         while ((dat_r[7]==1'b0));
         dat_r = 8'b0;
 
         wb_bus.master_write(.addr(2'b01), .data(8'h45)); // write 0x44 to DPR, address is 22, operation is writing
 
         #20 wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx001)); // write xxxxx001 to CMDR, write address and op
 
         do begin 
             wait (irq == 1) begin
               wb_bus.master_read(.addr(2'b10), .data(dat_r));
               break;
             end
         end
         while ((dat_r[7]==1'b0));
         //if (dat_r[6]==1'b1) $display("NACK here! time = %t", $time);
         dat_r = 8'b0;
         wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx010)); // write xxxxx010 to CMDR, Read with Ack
   
         wait (irq == 1); 
         wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
         
         wb_bus.master_read(.addr(2'b01), .data(data_r)); // read 63~0 from DPR

         wb_bus.master_write(.addr(2'b10), .data(8'bxxxxx101)); // write xxxxx101 to CMDR, Stop
 
         do begin 
             wait (irq == 1) begin
               wb_bus.master_read(.addr(2'b10), .data(dat_r)); 
               break;
             end
         end
         while ((dat_r[7]==1'b0));
       end              
   end


       #10000 $finish;
  end: test_flow


// ****************************************************************************
// i2c_bus flow
// i2c_bus monitor
  bit [I2C_ADDR_WIDTH-1:0] addr_i2c_monitor;
  bit [I2C_DATA_WIDTH-1:0] data_i2c_monitor [];
  bit [1:0] op_i2c_monitor;
  initial
    begin: monitor_i2c_bus     
      forever begin
        i2c_bus.monitor(.addr(addr_i2c_monitor), .op(op_i2c_monitor), .data(data_i2c_monitor));
        if (op_i2c_monitor == 2'd1) $display("I2C_BUS READ Transfer:\naddress =%h\noperation is READ\ndata=%p\n\n",addr_i2c_monitor,data_i2c_monitor);
        else if (op_i2c_monitor == 2'd2) $display("I2C_BUS WRITE Transfer:\naddress =%h\noperation is WRITE\ndata =%p\n\n",addr_i2c_monitor,data_i2c_monitor);
      end
    end: monitor_i2c_bus

// i2c_bus wait_for_i2c_transfer
  bit [I2C_DATA_WIDTH-1:0] data_i2c_write[];
  bit [1:0] op_i2c_write;
  initial 
    begin: wait_for_i2c_transfer_i2c_bus
      forever begin
        i2c_bus.wait_for_i2c_transfer(.op(op_i2c_write), .write_data(data_i2c_write));
      end
    end: wait_for_i2c_transfer_i2c_bus
            

// i2c_bus read
  initial
    begin: provide_read_data_i2c_bus
      forever begin
        i2c_bus.provide_read_data (.read_data(r_data));
      end
    end: provide_read_data_i2c_bus
      
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

// Instantiate i2c_if module
i2c_if    #(
            .I2C_ADDR_WIDTH(I2C_ADDR_WIDTH),
            .I2C_DATA_WIDTH(I2C_DATA_WIDTH)
           )
i2c_bus    (
            .scl(scl),
            .sda(sda)
           );

endmodule
