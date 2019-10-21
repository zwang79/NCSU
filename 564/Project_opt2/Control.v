module Control #(parameter OUTPUT_LENGTH       = 8,
                 parameter MAX_MESSAGE_LENGTH  = 55,
                 parameter NUMBER_OF_Ks        = 64,
                 parameter NUMBER_OF_Hs        = 8 )

               (input  wire        clk,
                input  wire        reset,
                input  wire        xxx__dut__go,
                input  wire [ $clog2(MAX_MESSAGE_LENGTH):0]     xxx__dut__msg_length,         
               
                output reg  [ $clog2(MAX_MESSAGE_LENGTH)-1:0]   dut__msg__address, 
                output reg                                      dut__msg__enable,
                output reg                                      dut__msg__write,

                output reg  [ $clog2(NUMBER_OF_Ks)-1:0]         dut__kmem__address,
                output reg                                      dut__kmem__enable,
                output reg                                      dut__kmem__write,
  
                output reg  [ $clog2(NUMBER_OF_Hs)-1:0]         dut__hmem__address,
                output reg                                      dut__hmem__enable,
                output reg                                      dut__hmem__write,

                output reg  [ $clog2(OUTPUT_LENGTH)-1:0]        dut__dom__address,
                output reg                                      dut__dom__enable,
                output reg                                      dut__dom__write,
 
                output reg                                      dut__xxx__finish,
                output reg                                      W_start,
                output reg                                      H_read,
                output reg                                      H_iterate
                );

parameter [1:0] 
          S0 = 3'b01, 
          S1 = 3'b10;

reg [7:0] counter;
reg [1:0] current_state, next_state;

always @(posedge clk or posedge reset) begin
	if (reset) current_state <= S0;
	else current_state <= next_state;
end

always @(*) begin
        if (current_state == S0) next_state <= xxx__dut__go ? S1 : S0;
        else if (counter < xxx__dut__msg_length + 8'd85) next_state <= S1;
      //else if (counter < xxx__dut__msg_length + 8'd84) next_state <= S1;
	     else next_state <= S0;
end

// enable & write signals
always @(*) begin
	case (current_state)

	  S0: begin
	  	dut__msg__enable   = 0;
	  	dut__msg__write    = 0;

	  	dut__kmem__enable  = 0;
	  	dut__kmem__write   = 0;

	  	dut__hmem__enable  = 0;
	  	dut__hmem__write   = 0;

	  	dut__dom__enable   = 0;
	  	dut__dom__write    = 0;

	  	dut__xxx__finish   = 0;
	  	W_start   = 0;
	  	H_read    = 0;
	  	H_iterate = 0;
	  end

	  S1: begin
    	        dut__msg__enable   = ((current_state == S1) && (counter <= xxx__dut__msg_length - 1)) ? 1 : 0;
                dut__msg__write    = 0;

    	        dut__hmem__enable  = (((counter >= 8'd1) && (counter <= 8'd8)) || ((counter >= xxx__dut__msg_length + 8'd73) && (counter <= xxx__dut__msg_length + 8'd80)))? 1 : 0;
                dut__hmem__write   = 0;
         

                dut__kmem__enable  = ((counter >= xxx__dut__msg_length + 8'd9) && (counter <= xxx__dut__msg_length + 8'd72)) ? 1 : 0;
                //dut__kmem__enable  = ((counter >= xxx__dut__msg_length + 8'd10) && (counter <= xxx__dut__msg_length + 8'd73)) ? 1 : 0;
                dut__kmem__write   = 0;

                dut__dom__enable   = ((counter >= xxx__dut__msg_length + 8'd74)) && ((counter <= xxx__dut__msg_length + 8'd81)) ? 1 : 0;
                //dut__dom__enable   = ((counter >= xxx__dut__msg_length + 8'd76)) && ((counter <= xxx__dut__msg_length + 8'd83)) ? 1 : 0;
                dut__dom__write    = ((counter >= xxx__dut__msg_length + 8'd74)) && ((counter <= xxx__dut__msg_length + 8'd81)) ? 1 : 0;
                //dut__dom__write    = ((counter >= xxx__dut__msg_length + 8'd76)) && ((counter <= xxx__dut__msg_length + 8'd83)) ? 1 : 0;

    	        W_start            = ((counter >= xxx__dut__msg_length + 8'd6) && (counter <= xxx__dut__msg_length + 8'd70)) ? 1 : 0;
        	H_read             = (((current_state == S1) && (counter <= 7)) || ((counter >= xxx__dut__msg_length + 8'd72) && (counter <= xxx__dut__msg_length + 8'd79))) ? 1 : 0;
                H_iterate          = ((counter >= xxx__dut__msg_length + 8'd8) && (counter <= xxx__dut__msg_length + 8'd71)) ? 1 : 0;
              //H_iterate          = ((counter >= xxx__dut__msg_length + 8'd9) && (counter <= xxx__dut__msg_length + 8'd72)) ? 1 : 0;
                dut__xxx__finish   = (counter == xxx__dut__msg_length + 8'd82) ? 1 : 0;
              //dut__xxx__finish   = (counter == xxx__dut__msg_length + 8'd84) ? 1 : 0;
	  end
          default: begin
	  	dut__msg__enable   = 0;
	  	dut__msg__write    = 0;

	  	dut__kmem__enable  = 0;
	  	dut__kmem__write   = 0;

	  	dut__hmem__enable  = 0;
	  	dut__hmem__write   = 0;

	  	dut__dom__enable   = 0;
	  	dut__dom__write    = 0;

	  	dut__xxx__finish   = 0;
	  	W_start   = 0;
	  	H_read    = 0;
	  	H_iterate = 0;
	  end
        endcase
end

// counter signal
always @(posedge clk) begin
	if (current_state == S1) counter <= counter + 8'd1;
	else counter <= 0;
end

// address signals
always @(posedge clk) begin
	if (current_state == S0) dut__msg__address <= 0;
        else if (dut__msg__enable)  dut__msg__address  <= dut__msg__address  + 1;
	else dut__msg__address <= 0; 
end

always @(posedge clk) begin
        if (current_state == S0) dut__hmem__address <= 0;
	else if (dut__hmem__enable) dut__hmem__address <= dut__hmem__address + 1;
	else dut__hmem__address <= 0;
end

always @(posedge clk) begin
        if (current_state == S0) dut__kmem__address <= 0;
	else if (dut__kmem__enable) dut__kmem__address <= dut__kmem__address + 1;
	else dut__kmem__address <= 0;
end

always @(posedge clk) begin
        if (current_state == S0) dut__dom__address <= 0;
	else if (dut__dom__enable) dut__dom__address <= dut__dom__address + 1;
	else dut__dom__address <= 0;
end


/*always @(*) begin
    	dut__msg__enable   = ((current_state == S1) && (counter <= xxx__dut__msg_length-1)) ? 1 : 0;
    	//dut__msg__write    = 0;

    	dut__hmem__enable  = ((counter >= 8'd1) && (counter <= 8'd8)) ? 1 : 0;
    	//dut__hmem__write   = 0;

        dut__kmem__enable  = ((counter >= xxx__dut__msg_length + 8'd10) && (counter <= xxx__dut__msg_length + 8'd73)) ? 1 : 0;
        //dut__kmem__write   = 0;

        dut__dom__enable   = ((counter >= xxx__dut__msg_length + 8'd76)) && ((counter <= xxx__dut__msg_length + 8'd83)) ? 1 : 0;
        dut__dom__write    = ((counter >= xxx__dut__msg_length + 8'd76)) && ((counter <= xxx__dut__msg_length + 8'd83)) ? 1 : 0;

    	W_start            = ((counter >= xxx__dut__msg_length + 8'd8) && (counter <= xxx__dut__msg_length + 8'd72)) ? 1 : 0;
    	H_read             = ((current_state == S1) && (counter <= 7)) ? 1 : 0;
        H_iterate          = ((counter >= xxx__dut__msg_length + 8'd9) && (counter <= xxx__dut__msg_length + 8'd72)) ? 1 : 0;
        dut__xxx__finish   = (counter == xxx__dut__msg_length + 8'd84) ? 1 : 0;
end*/

endmodule
