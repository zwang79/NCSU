if { [namespace current] != {::5DA63D9D} } { error {This script [file tail [info script]] should not be sourced directly}; }
###################################################################

# Created by write_script -format dctcl for scenario                           \
[mode_norm.worst_low.RCmax] on Tue Oct 15 17:43:57 2019

###################################################################

# Set the current_design #
current_design MulDiv


set_tlu_plus_files -max_tluplus                                                \
/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/ece720/FreePDK15_star_rcxt/FreePDK15_RCmax.tluplus \
-tech2itf_map                                                                  \
/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/ece720/FreePDK15_star_rcxt/layer.map \

set_operating_conditions worst_low -library                                    \
NanGate_15nm_OCL_worst_low_conditional_ccs.db:NanGate_15nm_OCL
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports reset]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports io_req_valid]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_fn[3]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_fn[2]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_fn[1]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_fn[0]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports io_req_bits_dw]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[63]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[62]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[61]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[60]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[59]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[58]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[57]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[56]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[55]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[54]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[53]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[52]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[51]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[50]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[49]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[48]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[47]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[46]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[45]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[44]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[43]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[42]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[41]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[40]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[39]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[38]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[37]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[36]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[35]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[34]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[33]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[32]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[31]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[30]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[29]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[28]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[27]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[26]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[25]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[24]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[23]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[22]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[21]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[20]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[19]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[18]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[17]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[16]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[15]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[14]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[13]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[12]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[11]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[10]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[9]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[8]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[7]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[6]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[5]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[4]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[3]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[2]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[1]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in1[0]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[63]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[62]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[61]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[60]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[59]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[58]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[57]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[56]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[55]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[54]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[53]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[52]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[51]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[50]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[49]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[48]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[47]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[46]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[45]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[44]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[43]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[42]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[41]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[40]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[39]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[38]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[37]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[36]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[35]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[34]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[33]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[32]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[31]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[30]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[29]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[28]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[27]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[26]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[25]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[24]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[23]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[22]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[21]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[20]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[19]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[18]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[17]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[16]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[15]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[14]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[13]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[12]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[11]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[10]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[9]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[8]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[7]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[6]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[5]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[4]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[3]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[2]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[1]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_in2[0]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_tag[4]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_tag[3]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_tag[2]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_tag[1]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {io_req_bits_tag[0]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports io_kill]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports io_resp_ready]
set_load -pin_load 2.54564 [get_ports io_req_ready]
set_load -pin_load 2.54564 [get_ports io_resp_valid]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[63]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[62]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[61]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[60]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[59]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[58]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[57]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[56]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[55]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[54]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[53]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[52]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[51]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[50]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[49]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[48]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[47]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[46]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[45]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[44]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[43]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[42]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[41]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[40]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[39]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[38]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[37]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[36]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[35]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[34]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[33]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[32]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[31]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[30]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[29]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[28]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[27]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[26]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[25]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[24]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[23]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[22]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[21]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[20]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[19]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[18]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[17]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[16]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[15]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[14]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[13]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[12]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[11]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[10]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[9]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[8]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[7]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[6]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[5]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[4]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[3]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[2]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[1]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_data[0]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_tag[4]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_tag[3]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_tag[2]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_tag[1]}]
set_load -pin_load 2.54564 [get_ports {io_resp_bits_tag[0]}]
create_clock [get_ports clock]  -period 400  -waveform {0 200}
set_clock_uncertainty 20  [get_clocks clock]
group_path -name FEEDTHROUGH  -from [list [get_ports reset] [get_ports         \
io_req_valid] [get_ports {io_req_bits_fn[3]}] [get_ports {io_req_bits_fn[2]}]  \
[get_ports {io_req_bits_fn[1]}] [get_ports {io_req_bits_fn[0]}] [get_ports     \
io_req_bits_dw] [get_ports {io_req_bits_in1[63]}] [get_ports                   \
{io_req_bits_in1[62]}] [get_ports {io_req_bits_in1[61]}] [get_ports            \
{io_req_bits_in1[60]}] [get_ports {io_req_bits_in1[59]}] [get_ports            \
{io_req_bits_in1[58]}] [get_ports {io_req_bits_in1[57]}] [get_ports            \
{io_req_bits_in1[56]}] [get_ports {io_req_bits_in1[55]}] [get_ports            \
{io_req_bits_in1[54]}] [get_ports {io_req_bits_in1[53]}] [get_ports            \
{io_req_bits_in1[52]}] [get_ports {io_req_bits_in1[51]}] [get_ports            \
{io_req_bits_in1[50]}] [get_ports {io_req_bits_in1[49]}] [get_ports            \
{io_req_bits_in1[48]}] [get_ports {io_req_bits_in1[47]}] [get_ports            \
{io_req_bits_in1[46]}] [get_ports {io_req_bits_in1[45]}] [get_ports            \
{io_req_bits_in1[44]}] [get_ports {io_req_bits_in1[43]}] [get_ports            \
{io_req_bits_in1[42]}] [get_ports {io_req_bits_in1[41]}] [get_ports            \
{io_req_bits_in1[40]}] [get_ports {io_req_bits_in1[39]}] [get_ports            \
{io_req_bits_in1[38]}] [get_ports {io_req_bits_in1[37]}] [get_ports            \
{io_req_bits_in1[36]}] [get_ports {io_req_bits_in1[35]}] [get_ports            \
{io_req_bits_in1[34]}] [get_ports {io_req_bits_in1[33]}] [get_ports            \
{io_req_bits_in1[32]}] [get_ports {io_req_bits_in1[31]}] [get_ports            \
{io_req_bits_in1[30]}] [get_ports {io_req_bits_in1[29]}] [get_ports            \
{io_req_bits_in1[28]}] [get_ports {io_req_bits_in1[27]}] [get_ports            \
{io_req_bits_in1[26]}] [get_ports {io_req_bits_in1[25]}] [get_ports            \
{io_req_bits_in1[24]}] [get_ports {io_req_bits_in1[23]}] [get_ports            \
{io_req_bits_in1[22]}] [get_ports {io_req_bits_in1[21]}] [get_ports            \
{io_req_bits_in1[20]}] [get_ports {io_req_bits_in1[19]}] [get_ports            \
{io_req_bits_in1[18]}] [get_ports {io_req_bits_in1[17]}] [get_ports            \
{io_req_bits_in1[16]}] [get_ports {io_req_bits_in1[15]}] [get_ports            \
{io_req_bits_in1[14]}] [get_ports {io_req_bits_in1[13]}] [get_ports            \
{io_req_bits_in1[12]}] [get_ports {io_req_bits_in1[11]}] [get_ports            \
{io_req_bits_in1[10]}] [get_ports {io_req_bits_in1[9]}] [get_ports             \
{io_req_bits_in1[8]}] [get_ports {io_req_bits_in1[7]}] [get_ports              \
{io_req_bits_in1[6]}] [get_ports {io_req_bits_in1[5]}] [get_ports              \
{io_req_bits_in1[4]}] [get_ports {io_req_bits_in1[3]}] [get_ports              \
{io_req_bits_in1[2]}] [get_ports {io_req_bits_in1[1]}] [get_ports              \
{io_req_bits_in1[0]}] [get_ports {io_req_bits_in2[63]}] [get_ports             \
{io_req_bits_in2[62]}] [get_ports {io_req_bits_in2[61]}] [get_ports            \
{io_req_bits_in2[60]}] [get_ports {io_req_bits_in2[59]}] [get_ports            \
{io_req_bits_in2[58]}] [get_ports {io_req_bits_in2[57]}] [get_ports            \
{io_req_bits_in2[56]}] [get_ports {io_req_bits_in2[55]}] [get_ports            \
{io_req_bits_in2[54]}] [get_ports {io_req_bits_in2[53]}] [get_ports            \
{io_req_bits_in2[52]}] [get_ports {io_req_bits_in2[51]}] [get_ports            \
{io_req_bits_in2[50]}] [get_ports {io_req_bits_in2[49]}] [get_ports            \
{io_req_bits_in2[48]}] [get_ports {io_req_bits_in2[47]}] [get_ports            \
{io_req_bits_in2[46]}] [get_ports {io_req_bits_in2[45]}] [get_ports            \
{io_req_bits_in2[44]}] [get_ports {io_req_bits_in2[43]}] [get_ports            \
{io_req_bits_in2[42]}] [get_ports {io_req_bits_in2[41]}] [get_ports            \
{io_req_bits_in2[40]}] [get_ports {io_req_bits_in2[39]}] [get_ports            \
{io_req_bits_in2[38]}] [get_ports {io_req_bits_in2[37]}] [get_ports            \
{io_req_bits_in2[36]}] [get_ports {io_req_bits_in2[35]}] [get_ports            \
{io_req_bits_in2[34]}] [get_ports {io_req_bits_in2[33]}] [get_ports            \
{io_req_bits_in2[32]}] [get_ports {io_req_bits_in2[31]}] [get_ports            \
{io_req_bits_in2[30]}] [get_ports {io_req_bits_in2[29]}] [get_ports            \
{io_req_bits_in2[28]}] [get_ports {io_req_bits_in2[27]}] [get_ports            \
{io_req_bits_in2[26]}] [get_ports {io_req_bits_in2[25]}] [get_ports            \
{io_req_bits_in2[24]}] [get_ports {io_req_bits_in2[23]}] [get_ports            \
{io_req_bits_in2[22]}] [get_ports {io_req_bits_in2[21]}] [get_ports            \
{io_req_bits_in2[20]}] [get_ports {io_req_bits_in2[19]}] [get_ports            \
{io_req_bits_in2[18]}] [get_ports {io_req_bits_in2[17]}] [get_ports            \
{io_req_bits_in2[16]}] [get_ports {io_req_bits_in2[15]}] [get_ports            \
{io_req_bits_in2[14]}] [get_ports {io_req_bits_in2[13]}] [get_ports            \
{io_req_bits_in2[12]}] [get_ports {io_req_bits_in2[11]}] [get_ports            \
{io_req_bits_in2[10]}] [get_ports {io_req_bits_in2[9]}] [get_ports             \
{io_req_bits_in2[8]}] [get_ports {io_req_bits_in2[7]}] [get_ports              \
{io_req_bits_in2[6]}] [get_ports {io_req_bits_in2[5]}] [get_ports              \
{io_req_bits_in2[4]}] [get_ports {io_req_bits_in2[3]}] [get_ports              \
{io_req_bits_in2[2]}] [get_ports {io_req_bits_in2[1]}] [get_ports              \
{io_req_bits_in2[0]}] [get_ports {io_req_bits_tag[4]}] [get_ports              \
{io_req_bits_tag[3]}] [get_ports {io_req_bits_tag[2]}] [get_ports              \
{io_req_bits_tag[1]}] [get_ports {io_req_bits_tag[0]}] [get_ports io_kill]     \
[get_ports io_resp_ready]]  -to [list [get_ports io_req_ready] [get_ports      \
io_resp_valid] [get_ports {io_resp_bits_data[63]}] [get_ports                  \
{io_resp_bits_data[62]}] [get_ports {io_resp_bits_data[61]}] [get_ports        \
{io_resp_bits_data[60]}] [get_ports {io_resp_bits_data[59]}] [get_ports        \
{io_resp_bits_data[58]}] [get_ports {io_resp_bits_data[57]}] [get_ports        \
{io_resp_bits_data[56]}] [get_ports {io_resp_bits_data[55]}] [get_ports        \
{io_resp_bits_data[54]}] [get_ports {io_resp_bits_data[53]}] [get_ports        \
{io_resp_bits_data[52]}] [get_ports {io_resp_bits_data[51]}] [get_ports        \
{io_resp_bits_data[50]}] [get_ports {io_resp_bits_data[49]}] [get_ports        \
{io_resp_bits_data[48]}] [get_ports {io_resp_bits_data[47]}] [get_ports        \
{io_resp_bits_data[46]}] [get_ports {io_resp_bits_data[45]}] [get_ports        \
{io_resp_bits_data[44]}] [get_ports {io_resp_bits_data[43]}] [get_ports        \
{io_resp_bits_data[42]}] [get_ports {io_resp_bits_data[41]}] [get_ports        \
{io_resp_bits_data[40]}] [get_ports {io_resp_bits_data[39]}] [get_ports        \
{io_resp_bits_data[38]}] [get_ports {io_resp_bits_data[37]}] [get_ports        \
{io_resp_bits_data[36]}] [get_ports {io_resp_bits_data[35]}] [get_ports        \
{io_resp_bits_data[34]}] [get_ports {io_resp_bits_data[33]}] [get_ports        \
{io_resp_bits_data[32]}] [get_ports {io_resp_bits_data[31]}] [get_ports        \
{io_resp_bits_data[30]}] [get_ports {io_resp_bits_data[29]}] [get_ports        \
{io_resp_bits_data[28]}] [get_ports {io_resp_bits_data[27]}] [get_ports        \
{io_resp_bits_data[26]}] [get_ports {io_resp_bits_data[25]}] [get_ports        \
{io_resp_bits_data[24]}] [get_ports {io_resp_bits_data[23]}] [get_ports        \
{io_resp_bits_data[22]}] [get_ports {io_resp_bits_data[21]}] [get_ports        \
{io_resp_bits_data[20]}] [get_ports {io_resp_bits_data[19]}] [get_ports        \
{io_resp_bits_data[18]}] [get_ports {io_resp_bits_data[17]}] [get_ports        \
{io_resp_bits_data[16]}] [get_ports {io_resp_bits_data[15]}] [get_ports        \
{io_resp_bits_data[14]}] [get_ports {io_resp_bits_data[13]}] [get_ports        \
{io_resp_bits_data[12]}] [get_ports {io_resp_bits_data[11]}] [get_ports        \
{io_resp_bits_data[10]}] [get_ports {io_resp_bits_data[9]}] [get_ports         \
{io_resp_bits_data[8]}] [get_ports {io_resp_bits_data[7]}] [get_ports          \
{io_resp_bits_data[6]}] [get_ports {io_resp_bits_data[5]}] [get_ports          \
{io_resp_bits_data[4]}] [get_ports {io_resp_bits_data[3]}] [get_ports          \
{io_resp_bits_data[2]}] [get_ports {io_resp_bits_data[1]}] [get_ports          \
{io_resp_bits_data[0]}] [get_ports {io_resp_bits_tag[4]}] [get_ports           \
{io_resp_bits_tag[3]}] [get_ports {io_resp_bits_tag[2]}] [get_ports            \
{io_resp_bits_tag[1]}] [get_ports {io_resp_bits_tag[0]}]]
group_path -name REGIN  -from [list [get_ports reset] [get_ports io_req_valid] \
[get_ports {io_req_bits_fn[3]}] [get_ports {io_req_bits_fn[2]}] [get_ports     \
{io_req_bits_fn[1]}] [get_ports {io_req_bits_fn[0]}] [get_ports                \
io_req_bits_dw] [get_ports {io_req_bits_in1[63]}] [get_ports                   \
{io_req_bits_in1[62]}] [get_ports {io_req_bits_in1[61]}] [get_ports            \
{io_req_bits_in1[60]}] [get_ports {io_req_bits_in1[59]}] [get_ports            \
{io_req_bits_in1[58]}] [get_ports {io_req_bits_in1[57]}] [get_ports            \
{io_req_bits_in1[56]}] [get_ports {io_req_bits_in1[55]}] [get_ports            \
{io_req_bits_in1[54]}] [get_ports {io_req_bits_in1[53]}] [get_ports            \
{io_req_bits_in1[52]}] [get_ports {io_req_bits_in1[51]}] [get_ports            \
{io_req_bits_in1[50]}] [get_ports {io_req_bits_in1[49]}] [get_ports            \
{io_req_bits_in1[48]}] [get_ports {io_req_bits_in1[47]}] [get_ports            \
{io_req_bits_in1[46]}] [get_ports {io_req_bits_in1[45]}] [get_ports            \
{io_req_bits_in1[44]}] [get_ports {io_req_bits_in1[43]}] [get_ports            \
{io_req_bits_in1[42]}] [get_ports {io_req_bits_in1[41]}] [get_ports            \
{io_req_bits_in1[40]}] [get_ports {io_req_bits_in1[39]}] [get_ports            \
{io_req_bits_in1[38]}] [get_ports {io_req_bits_in1[37]}] [get_ports            \
{io_req_bits_in1[36]}] [get_ports {io_req_bits_in1[35]}] [get_ports            \
{io_req_bits_in1[34]}] [get_ports {io_req_bits_in1[33]}] [get_ports            \
{io_req_bits_in1[32]}] [get_ports {io_req_bits_in1[31]}] [get_ports            \
{io_req_bits_in1[30]}] [get_ports {io_req_bits_in1[29]}] [get_ports            \
{io_req_bits_in1[28]}] [get_ports {io_req_bits_in1[27]}] [get_ports            \
{io_req_bits_in1[26]}] [get_ports {io_req_bits_in1[25]}] [get_ports            \
{io_req_bits_in1[24]}] [get_ports {io_req_bits_in1[23]}] [get_ports            \
{io_req_bits_in1[22]}] [get_ports {io_req_bits_in1[21]}] [get_ports            \
{io_req_bits_in1[20]}] [get_ports {io_req_bits_in1[19]}] [get_ports            \
{io_req_bits_in1[18]}] [get_ports {io_req_bits_in1[17]}] [get_ports            \
{io_req_bits_in1[16]}] [get_ports {io_req_bits_in1[15]}] [get_ports            \
{io_req_bits_in1[14]}] [get_ports {io_req_bits_in1[13]}] [get_ports            \
{io_req_bits_in1[12]}] [get_ports {io_req_bits_in1[11]}] [get_ports            \
{io_req_bits_in1[10]}] [get_ports {io_req_bits_in1[9]}] [get_ports             \
{io_req_bits_in1[8]}] [get_ports {io_req_bits_in1[7]}] [get_ports              \
{io_req_bits_in1[6]}] [get_ports {io_req_bits_in1[5]}] [get_ports              \
{io_req_bits_in1[4]}] [get_ports {io_req_bits_in1[3]}] [get_ports              \
{io_req_bits_in1[2]}] [get_ports {io_req_bits_in1[1]}] [get_ports              \
{io_req_bits_in1[0]}] [get_ports {io_req_bits_in2[63]}] [get_ports             \
{io_req_bits_in2[62]}] [get_ports {io_req_bits_in2[61]}] [get_ports            \
{io_req_bits_in2[60]}] [get_ports {io_req_bits_in2[59]}] [get_ports            \
{io_req_bits_in2[58]}] [get_ports {io_req_bits_in2[57]}] [get_ports            \
{io_req_bits_in2[56]}] [get_ports {io_req_bits_in2[55]}] [get_ports            \
{io_req_bits_in2[54]}] [get_ports {io_req_bits_in2[53]}] [get_ports            \
{io_req_bits_in2[52]}] [get_ports {io_req_bits_in2[51]}] [get_ports            \
{io_req_bits_in2[50]}] [get_ports {io_req_bits_in2[49]}] [get_ports            \
{io_req_bits_in2[48]}] [get_ports {io_req_bits_in2[47]}] [get_ports            \
{io_req_bits_in2[46]}] [get_ports {io_req_bits_in2[45]}] [get_ports            \
{io_req_bits_in2[44]}] [get_ports {io_req_bits_in2[43]}] [get_ports            \
{io_req_bits_in2[42]}] [get_ports {io_req_bits_in2[41]}] [get_ports            \
{io_req_bits_in2[40]}] [get_ports {io_req_bits_in2[39]}] [get_ports            \
{io_req_bits_in2[38]}] [get_ports {io_req_bits_in2[37]}] [get_ports            \
{io_req_bits_in2[36]}] [get_ports {io_req_bits_in2[35]}] [get_ports            \
{io_req_bits_in2[34]}] [get_ports {io_req_bits_in2[33]}] [get_ports            \
{io_req_bits_in2[32]}] [get_ports {io_req_bits_in2[31]}] [get_ports            \
{io_req_bits_in2[30]}] [get_ports {io_req_bits_in2[29]}] [get_ports            \
{io_req_bits_in2[28]}] [get_ports {io_req_bits_in2[27]}] [get_ports            \
{io_req_bits_in2[26]}] [get_ports {io_req_bits_in2[25]}] [get_ports            \
{io_req_bits_in2[24]}] [get_ports {io_req_bits_in2[23]}] [get_ports            \
{io_req_bits_in2[22]}] [get_ports {io_req_bits_in2[21]}] [get_ports            \
{io_req_bits_in2[20]}] [get_ports {io_req_bits_in2[19]}] [get_ports            \
{io_req_bits_in2[18]}] [get_ports {io_req_bits_in2[17]}] [get_ports            \
{io_req_bits_in2[16]}] [get_ports {io_req_bits_in2[15]}] [get_ports            \
{io_req_bits_in2[14]}] [get_ports {io_req_bits_in2[13]}] [get_ports            \
{io_req_bits_in2[12]}] [get_ports {io_req_bits_in2[11]}] [get_ports            \
{io_req_bits_in2[10]}] [get_ports {io_req_bits_in2[9]}] [get_ports             \
{io_req_bits_in2[8]}] [get_ports {io_req_bits_in2[7]}] [get_ports              \
{io_req_bits_in2[6]}] [get_ports {io_req_bits_in2[5]}] [get_ports              \
{io_req_bits_in2[4]}] [get_ports {io_req_bits_in2[3]}] [get_ports              \
{io_req_bits_in2[2]}] [get_ports {io_req_bits_in2[1]}] [get_ports              \
{io_req_bits_in2[0]}] [get_ports {io_req_bits_tag[4]}] [get_ports              \
{io_req_bits_tag[3]}] [get_ports {io_req_bits_tag[2]}] [get_ports              \
{io_req_bits_tag[1]}] [get_ports {io_req_bits_tag[0]}] [get_ports io_kill]     \
[get_ports io_resp_ready]]
group_path -name REGOUT  -to [list [get_ports io_req_ready] [get_ports         \
io_resp_valid] [get_ports {io_resp_bits_data[63]}] [get_ports                  \
{io_resp_bits_data[62]}] [get_ports {io_resp_bits_data[61]}] [get_ports        \
{io_resp_bits_data[60]}] [get_ports {io_resp_bits_data[59]}] [get_ports        \
{io_resp_bits_data[58]}] [get_ports {io_resp_bits_data[57]}] [get_ports        \
{io_resp_bits_data[56]}] [get_ports {io_resp_bits_data[55]}] [get_ports        \
{io_resp_bits_data[54]}] [get_ports {io_resp_bits_data[53]}] [get_ports        \
{io_resp_bits_data[52]}] [get_ports {io_resp_bits_data[51]}] [get_ports        \
{io_resp_bits_data[50]}] [get_ports {io_resp_bits_data[49]}] [get_ports        \
{io_resp_bits_data[48]}] [get_ports {io_resp_bits_data[47]}] [get_ports        \
{io_resp_bits_data[46]}] [get_ports {io_resp_bits_data[45]}] [get_ports        \
{io_resp_bits_data[44]}] [get_ports {io_resp_bits_data[43]}] [get_ports        \
{io_resp_bits_data[42]}] [get_ports {io_resp_bits_data[41]}] [get_ports        \
{io_resp_bits_data[40]}] [get_ports {io_resp_bits_data[39]}] [get_ports        \
{io_resp_bits_data[38]}] [get_ports {io_resp_bits_data[37]}] [get_ports        \
{io_resp_bits_data[36]}] [get_ports {io_resp_bits_data[35]}] [get_ports        \
{io_resp_bits_data[34]}] [get_ports {io_resp_bits_data[33]}] [get_ports        \
{io_resp_bits_data[32]}] [get_ports {io_resp_bits_data[31]}] [get_ports        \
{io_resp_bits_data[30]}] [get_ports {io_resp_bits_data[29]}] [get_ports        \
{io_resp_bits_data[28]}] [get_ports {io_resp_bits_data[27]}] [get_ports        \
{io_resp_bits_data[26]}] [get_ports {io_resp_bits_data[25]}] [get_ports        \
{io_resp_bits_data[24]}] [get_ports {io_resp_bits_data[23]}] [get_ports        \
{io_resp_bits_data[22]}] [get_ports {io_resp_bits_data[21]}] [get_ports        \
{io_resp_bits_data[20]}] [get_ports {io_resp_bits_data[19]}] [get_ports        \
{io_resp_bits_data[18]}] [get_ports {io_resp_bits_data[17]}] [get_ports        \
{io_resp_bits_data[16]}] [get_ports {io_resp_bits_data[15]}] [get_ports        \
{io_resp_bits_data[14]}] [get_ports {io_resp_bits_data[13]}] [get_ports        \
{io_resp_bits_data[12]}] [get_ports {io_resp_bits_data[11]}] [get_ports        \
{io_resp_bits_data[10]}] [get_ports {io_resp_bits_data[9]}] [get_ports         \
{io_resp_bits_data[8]}] [get_ports {io_resp_bits_data[7]}] [get_ports          \
{io_resp_bits_data[6]}] [get_ports {io_resp_bits_data[5]}] [get_ports          \
{io_resp_bits_data[4]}] [get_ports {io_resp_bits_data[3]}] [get_ports          \
{io_resp_bits_data[2]}] [get_ports {io_resp_bits_data[1]}] [get_ports          \
{io_resp_bits_data[0]}] [get_ports {io_resp_bits_tag[4]}] [get_ports           \
{io_resp_bits_tag[3]}] [get_ports {io_resp_bits_tag[2]}] [get_ports            \
{io_resp_bits_tag[1]}] [get_ports {io_resp_bits_tag[0]}]]
set_input_delay -clock clock  120  [get_ports reset]
set_input_delay -clock clock  120  [get_ports io_req_valid]
set_input_delay -clock clock  120  [get_ports {io_req_bits_fn[3]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_fn[2]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_fn[1]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_fn[0]}]
set_input_delay -clock clock  120  [get_ports io_req_bits_dw]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[63]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[62]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[61]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[60]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[59]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[58]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[57]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[56]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[55]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[54]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[53]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[52]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[51]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[50]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[49]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[48]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[47]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[46]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[45]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[44]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[43]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[42]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[41]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[40]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[39]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[38]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[37]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[36]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[35]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[34]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[33]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[32]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[31]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[30]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[29]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[28]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[27]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[26]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[25]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[24]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[23]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[22]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[21]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[20]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[19]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[18]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[17]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[16]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[15]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[14]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[13]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[12]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[11]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[10]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[9]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[8]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[7]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[6]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[5]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[4]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[3]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[2]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[1]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in1[0]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[63]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[62]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[61]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[60]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[59]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[58]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[57]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[56]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[55]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[54]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[53]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[52]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[51]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[50]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[49]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[48]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[47]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[46]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[45]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[44]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[43]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[42]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[41]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[40]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[39]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[38]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[37]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[36]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[35]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[34]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[33]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[32]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[31]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[30]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[29]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[28]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[27]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[26]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[25]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[24]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[23]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[22]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[21]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[20]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[19]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[18]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[17]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[16]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[15]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[14]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[13]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[12]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[11]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[10]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[9]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[8]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[7]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[6]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[5]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[4]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[3]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[2]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[1]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_in2[0]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_tag[4]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_tag[3]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_tag[2]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_tag[1]}]
set_input_delay -clock clock  120  [get_ports {io_req_bits_tag[0]}]
set_input_delay -clock clock  120  [get_ports io_kill]
set_input_delay -clock clock  120  [get_ports io_resp_ready]
set_output_delay -clock clock  120  [get_ports io_req_ready]
set_output_delay -clock clock  120  [get_ports io_resp_valid]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[63]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[62]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[61]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[60]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[59]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[58]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[57]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[56]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[55]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[54]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[53]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[52]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[51]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[50]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[49]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[48]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[47]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[46]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[45]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[44]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[43]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[42]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[41]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[40]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[39]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[38]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[37]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[36]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[35]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[34]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[33]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[32]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[31]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[30]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[29]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[28]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[27]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[26]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[25]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[24]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[23]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[22]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[21]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[20]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[19]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[18]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[17]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[16]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[15]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[14]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[13]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[12]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[11]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[10]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[9]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[8]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[7]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[6]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[5]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[4]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[3]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[2]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[1]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_data[0]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_tag[4]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_tag[3]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_tag[2]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_tag[1]}]
set_output_delay -clock clock  120  [get_ports {io_resp_bits_tag[0]}]
set compile_inbound_cell_optimization false
set compile_inbound_max_cell_percentage 10.0