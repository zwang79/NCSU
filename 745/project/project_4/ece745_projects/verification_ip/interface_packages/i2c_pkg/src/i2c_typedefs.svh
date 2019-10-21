  //   header [63:60] header type
  //   Routing table:  4'h1
  //   Statistics:     4'h2
  //   Payload:        4'h4 
  //   Secure payload: 4'h8
  typedef enum bit [1:0] { CSR = 2'b00, DPR = 2'b01, CMDR = 2'b10, FSMR = 2'b11 } addr_type_t;
  // header [59:56] header sub-type
  //   Control: 4'h1
  //   Data:    4'h2
  //   Reset:   4'h4
  typedef enum bit [1:0] { WT = 2'b00, RD = 2'b01, INT = 2'b10 } op_type_t;
  // header [55:52] payload size
  // header [51:48] payload index
  // header [47:40] source address high
  // header [39:32] source address low
  // header [31:24] destination address high
  // header [23:16] destination address low
  // header [15:12] QOS
  // header [11: 8] priority
  // header [ 7: 0] trailer type
  //   Zeros:   8'h1
  //   Ones:    8'h2
  //   Sync:    8'h4
  //   Parity:  8'h8
  //   ECC:     8'h16
  //   CRC:     8'h32
  typedef enum bit [7:0] { ZEROS=8'h00, ONES=8'hff, ZEROONE=8'h0f, ONEZERO=8'hf0 } data_type_t;

