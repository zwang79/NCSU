// the function of M is to receive msg data and process [511:0] M while M_read is high.
module M #(parameter MAX_MESSAGE_LENGTH  = 55 )
           (input  wire                                  clk,
            input  wire                                  reset, 
            input  wire  [ $clog2(MAX_MESSAGE_LENGTH):0] xxx__dut__msg_length,
            input  wire  [7:0]                           msg__dut__data ,
            input  wire                                  dut__msg__enable,
            input  wire                                  dut__xxx__finish,
            output reg   [511:0]                         M
            );

reg [2:0] counter;

always @(posedge clk or posedge reset) begin
	if (reset) counter <= 3'b000;
	else if (!dut__msg__enable || counter==(xxx__dut__msg_length-1)) counter <= 3'b000;
	else counter <= counter + 3'b001;
end

always @(posedge clk or posedge reset) begin
    if (reset) M <= 512'b0;
    else if (dut__xxx__finish) M <= 512'b0;
    else if (dut__msg__enable) begin
      M [511-8*counter-:8] <= msg__dut__data;
      M [511-8*xxx__dut__msg_length] <= 1'b1;
      M [$clog2(MAX_MESSAGE_LENGTH)+3:3] <= {xxx__dut__msg_length};
    end
end

endmodule
