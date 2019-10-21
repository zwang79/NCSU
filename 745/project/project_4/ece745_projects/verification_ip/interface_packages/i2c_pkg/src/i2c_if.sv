`timescale 1ns / 10ps
//typedef enum bit [1:0] {UNKNOWN, READ, WRITE} i2c_op_t;

interface i2c_if  #(int I2C_ADDR_WIDTH = 7,
                    int I2C_DATA_WIDTH = 8
                   )
                   (// I2CMB signals
                    input wire scl,
                    inout wire sda
                   );

  import emu_type_pkg::*;

  parameter ADDRESS = 7'h22;


  // i2c_if internal signal
  // data arrays 
  bit [I2C_ADDR_WIDTH-1:0] addr_i;
  bit [I2C_DATA_WIDTH-1:0] data_i [];


  // transmition signal
  bit start;
  bit stop;
  bit flag;
 
  // enumerated type for operation indication
  i2c_op_t opt;

  // inout internal signal
  wire sda_i;
  bit  sda_o = 1;
  bit  ack;
  bit  [3:0] cnt1;
  int  cnt2;
  bit [3:0] i;
  int j;


  
  assign sda_i = sda;
  assign sda   = sda_o?'bz:'b0;



// ********************************************************************************
// task for transfer
  task wait_for_i2c_transfer (output i2c_op_t op, 
                              output bit [I2C_DATA_WIDTH-1:0] write_data[]
                             );   
     //forever begin
     assign op = opt;
     @(posedge scl);
     @(sda or negedge scl);
               if (!scl) begin
                 if (cnt2 < 'b1) begin
                   if (cnt1 <= 4'd6) begin
                     addr_i[cnt1] = sda_i;
                     cnt1 = cnt1 + 4'b1;
                   end
                   else if (cnt1 == 4'd7) begin
                          opt = sda_i?READ:WRITE;
                          ack = (addr_i == ADDRESS)?1'b1:1'b0;
                          sda_o = ~ack;
                          if (!ack) return; 
                          cnt1 = cnt1 + 4'b1;

                        end
                        else if (cnt1 == 4'd8) begin
                               ack = 1'b0;
                               if (opt == WRITE) sda_o = 1'b1;   
                               cnt1 = 4'd0;
                               cnt2 = cnt2 + 1'b1;
                    
                             end 
                 end
                 else begin                 
                   if (opt == WRITE) begin
                     if (cnt1 == 4'b0) begin
                       data_i = new[cnt2](data_i);
                       data_i[cnt2-1][4'd7-cnt1] = sda_i;
                       cnt1 = cnt1 + 4'b1;
                     end
                     else 
                          if (cnt1 <= 4'd7) begin
                            data_i[cnt2-1][4'd7-cnt1] = sda_i;
                            cnt1 = cnt1 + 4'b1;
                          end
                          else begin
                          ack = 1'b0;
                          cnt1 = 4'b0;
                          cnt2 = cnt2 + 1'b1;
                          end
                   end
                   else if (opt == READ) return;
                 end
               end
               else if (!sda) begin
                      cnt1 = 4'b0;
                      cnt2 = 0;
                      addr_i = 'b0;
                      ack  = 1'b0;
                      opt = UNKNOWN;
                      start = 1'b1;
                      #50 start = 1'b0;
                    end
                    else if (sda) begin
                           cnt1 = 4'b0;
                           cnt2 = 0;
                           if (opt == WRITE) write_data = new[data_i.size()](data_i);
                           stop = 1'b1;
                           #50 stop = 1'b0;
                           return;
                         end
 // end
  
  endtask


// task for read operation
  task provide_read_data (input bit [I2C_DATA_WIDTH-1:0] read_data []);

    // forever begin
     @(posedge scl);
     @(sda or negedge scl);
               if (!scl) begin
                 if (j < 'b1) begin
                   if (i <= 4'd6) begin
                     addr_i[i] = sda_i;
                     i = i + 4'b1;
                   end
                   else if (i == 4'd7) begin
                          opt = sda_i?READ:WRITE;
                          ack = (addr_i == ADDRESS)?1'b1:1'b0;
                          sda_o = ~ack;
                          if (!ack) return; 
                          i = i + 4'b1;

                        end
                        else if (i == 4'd8) begin
                               ack = 1'b0;
                               if (opt == WRITE) sda_o = 1'b1;   
                               if (opt != READ) return;
                               else begin
                                 data_i = new[read_data.size()](read_data);
                                 sda_o = data_i[j][4'd7];
                                 i = 1'b1;
                               end
                               j = cnt2/*+ 1'b1*/;
                             end 
                 end
                 else if (j <= data_i.size()) begin
                       if (i == 4'b0) begin
                        if ((j > 'b1) && sda) j = j - 4'b1;
                        sda_o = data_i[j - 4'b1][4'd7-i];
                        i = i + 1'b1;
                      end
                      else if (i <= 4'd7) begin
                             sda_o = data_i[j - 4'b1][4'd7-i];
                             i = i + 4'b1;
                             end
                           else begin
                             i = 4'b0;
                             j = j + 1'b1;
                             sda_o = 1'b1;
                             end
                      end
                      else sda_o = 1'b1;
               end
               else if (!sda) begin
                      i = 4'b0;
                      j = 0;
                      addr_i = 'b0;
                      ack  = 1'b0;
                      opt = UNKNOWN;
                      start = 1'b1;
                      #50 start = 1'b0;
                    end
                    else if (sda) begin
                           i = 4'b0;
                           j = 0;
                           stop = 1'b1;
                           #50 stop = 1'b0;
                           return;
                         end
         //end
       
  endtask

// task for monitor
  task monitor (output bit [I2C_ADDR_WIDTH-1:0] addr, output i2c_op_t op, output bit [I2C_DATA_WIDTH-1:0] data []);
       data=new[32];
       @(posedge stop);
       addr = addr_i;
       data = data_i;
       op = opt;
  //   if (op== 2'd1) $display("I2C_BUS READ Transfer:\naddress =%h\noperation is READ\ndata=%p\n\n",addr,data);
   //  else if (op== 2'd2) $display("I2C_BUS WRITE Transfer:\naddress =%h\noperation is WRITE\ndata =%p\n\n",addr,data);
  endtask

endinterface
       
 









