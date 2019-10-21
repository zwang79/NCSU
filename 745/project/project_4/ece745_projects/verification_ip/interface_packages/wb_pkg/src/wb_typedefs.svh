  typedef enum bit [1:0] { CSR = 2'b00, DPR = 2'b01, CMDR = 2'b10, FSMR = 2'b11 } addr_type_t;

  typedef enum bit [1:0] { WT = 2'b00, RD = 2'b01, INT = 2'b10 } op_type_t;

  typedef enum bit [7:0] { ZEROS=8'h00, ONES=8'hff, ZEROONE=8'h0f, ONEZERO=8'hf0 } data_type_t;

