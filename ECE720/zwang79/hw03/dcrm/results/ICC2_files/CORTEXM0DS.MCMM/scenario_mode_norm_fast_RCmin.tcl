if { [namespace current] != {::5D8D8111} } { error {This script [file tail [info script]] should not be sourced directly}; }
###################################################################

# Created by write_script -format dctcl for scenario [mode_norm.fast.RCmin] on \
Thu Sep 26 23:25:05 2019

###################################################################

# Set the current_design #
current_design CORTEXM0DS


set_tlu_plus_files -max_tluplus                                                \
/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/ece720/FreePDK15_star_rcxt/FreePDK15_RCmin.tluplus \
-tech2itf_map                                                                  \
/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/ece720/FreePDK15_star_rcxt/layer.map \

set_operating_conditions fast -library                                         \
NanGate_15nm_OCL_fast_conditional_ccs.db:NanGate_15nm_OCL
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports HRESETn]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[31]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[30]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[29]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[28]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[27]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[26]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[25]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[24]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[23]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[22]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[21]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[20]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[19]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[18]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[17]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[16]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[15]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[14]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[13]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[12]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[11]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[10]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[9]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[8]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[7]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[6]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[5]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[4]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[3]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[2]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[1]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {HRDATA[0]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports HREADY]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports HRESP]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports NMI]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[15]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[14]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[13]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[12]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[11]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[10]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[9]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[8]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[7]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[6]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[5]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[4]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[3]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[2]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[1]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports {IRQ[0]}]
set_driving_cell -lib_cell DFFRNQ_X1 -pin Q [get_ports RXEV]
set_load -pin_load 2.54564 [get_ports {HADDR[31]}]
set_load -pin_load 2.54564 [get_ports {HADDR[30]}]
set_load -pin_load 2.54564 [get_ports {HADDR[29]}]
set_load -pin_load 2.54564 [get_ports {HADDR[28]}]
set_load -pin_load 2.54564 [get_ports {HADDR[27]}]
set_load -pin_load 2.54564 [get_ports {HADDR[26]}]
set_load -pin_load 2.54564 [get_ports {HADDR[25]}]
set_load -pin_load 2.54564 [get_ports {HADDR[24]}]
set_load -pin_load 2.54564 [get_ports {HADDR[23]}]
set_load -pin_load 2.54564 [get_ports {HADDR[22]}]
set_load -pin_load 2.54564 [get_ports {HADDR[21]}]
set_load -pin_load 2.54564 [get_ports {HADDR[20]}]
set_load -pin_load 2.54564 [get_ports {HADDR[19]}]
set_load -pin_load 2.54564 [get_ports {HADDR[18]}]
set_load -pin_load 2.54564 [get_ports {HADDR[17]}]
set_load -pin_load 2.54564 [get_ports {HADDR[16]}]
set_load -pin_load 2.54564 [get_ports {HADDR[15]}]
set_load -pin_load 2.54564 [get_ports {HADDR[14]}]
set_load -pin_load 2.54564 [get_ports {HADDR[13]}]
set_load -pin_load 2.54564 [get_ports {HADDR[12]}]
set_load -pin_load 2.54564 [get_ports {HADDR[11]}]
set_load -pin_load 2.54564 [get_ports {HADDR[10]}]
set_load -pin_load 2.54564 [get_ports {HADDR[9]}]
set_load -pin_load 2.54564 [get_ports {HADDR[8]}]
set_load -pin_load 2.54564 [get_ports {HADDR[7]}]
set_load -pin_load 2.54564 [get_ports {HADDR[6]}]
set_load -pin_load 2.54564 [get_ports {HADDR[5]}]
set_load -pin_load 2.54564 [get_ports {HADDR[4]}]
set_load -pin_load 2.54564 [get_ports {HADDR[3]}]
set_load -pin_load 2.54564 [get_ports {HADDR[2]}]
set_load -pin_load 2.54564 [get_ports {HADDR[1]}]
set_load -pin_load 2.54564 [get_ports {HADDR[0]}]
set_load -pin_load 2.54564 [get_ports {HBURST[2]}]
set_load -pin_load 2.54564 [get_ports {HBURST[1]}]
set_load -pin_load 2.54564 [get_ports {HBURST[0]}]
set_load -pin_load 2.54564 [get_ports HMASTLOCK]
set_load -pin_load 2.54564 [get_ports {HPROT[3]}]
set_load -pin_load 2.54564 [get_ports {HPROT[2]}]
set_load -pin_load 2.54564 [get_ports {HPROT[1]}]
set_load -pin_load 2.54564 [get_ports {HPROT[0]}]
set_load -pin_load 2.54564 [get_ports {HSIZE[2]}]
set_load -pin_load 2.54564 [get_ports {HSIZE[1]}]
set_load -pin_load 2.54564 [get_ports {HSIZE[0]}]
set_load -pin_load 2.54564 [get_ports {HTRANS[1]}]
set_load -pin_load 2.54564 [get_ports {HTRANS[0]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[31]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[30]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[29]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[28]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[27]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[26]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[25]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[24]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[23]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[22]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[21]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[20]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[19]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[18]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[17]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[16]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[15]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[14]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[13]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[12]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[11]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[10]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[9]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[8]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[7]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[6]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[5]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[4]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[3]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[2]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[1]}]
set_load -pin_load 2.54564 [get_ports {HWDATA[0]}]
set_load -pin_load 2.54564 [get_ports HWRITE]
set_load -pin_load 2.54564 [get_ports TXEV]
set_load -pin_load 2.54564 [get_ports LOCKUP]
set_load -pin_load 2.54564 [get_ports SYSRESETREQ]
set_load -pin_load 2.54564 [get_ports SLEEPING]
create_clock [get_ports HCLK]  -period 500  -waveform {0 250}
set_clock_uncertainty 0.05  [get_clocks HCLK]
group_path -name FEEDTHROUGH  -from [list [get_ports HRESETn] [get_ports       \
{HRDATA[31]}] [get_ports {HRDATA[30]}] [get_ports {HRDATA[29]}] [get_ports     \
{HRDATA[28]}] [get_ports {HRDATA[27]}] [get_ports {HRDATA[26]}] [get_ports     \
{HRDATA[25]}] [get_ports {HRDATA[24]}] [get_ports {HRDATA[23]}] [get_ports     \
{HRDATA[22]}] [get_ports {HRDATA[21]}] [get_ports {HRDATA[20]}] [get_ports     \
{HRDATA[19]}] [get_ports {HRDATA[18]}] [get_ports {HRDATA[17]}] [get_ports     \
{HRDATA[16]}] [get_ports {HRDATA[15]}] [get_ports {HRDATA[14]}] [get_ports     \
{HRDATA[13]}] [get_ports {HRDATA[12]}] [get_ports {HRDATA[11]}] [get_ports     \
{HRDATA[10]}] [get_ports {HRDATA[9]}] [get_ports {HRDATA[8]}] [get_ports       \
{HRDATA[7]}] [get_ports {HRDATA[6]}] [get_ports {HRDATA[5]}] [get_ports        \
{HRDATA[4]}] [get_ports {HRDATA[3]}] [get_ports {HRDATA[2]}] [get_ports        \
{HRDATA[1]}] [get_ports {HRDATA[0]}] [get_ports HREADY] [get_ports HRESP]      \
[get_ports NMI] [get_ports {IRQ[15]}] [get_ports {IRQ[14]}] [get_ports         \
{IRQ[13]}] [get_ports {IRQ[12]}] [get_ports {IRQ[11]}] [get_ports {IRQ[10]}]   \
[get_ports {IRQ[9]}] [get_ports {IRQ[8]}] [get_ports {IRQ[7]}] [get_ports      \
{IRQ[6]}] [get_ports {IRQ[5]}] [get_ports {IRQ[4]}] [get_ports {IRQ[3]}]       \
[get_ports {IRQ[2]}] [get_ports {IRQ[1]}] [get_ports {IRQ[0]}] [get_ports      \
RXEV]]  -to [list [get_ports {HADDR[31]}] [get_ports {HADDR[30]}] [get_ports   \
{HADDR[29]}] [get_ports {HADDR[28]}] [get_ports {HADDR[27]}] [get_ports        \
{HADDR[26]}] [get_ports {HADDR[25]}] [get_ports {HADDR[24]}] [get_ports        \
{HADDR[23]}] [get_ports {HADDR[22]}] [get_ports {HADDR[21]}] [get_ports        \
{HADDR[20]}] [get_ports {HADDR[19]}] [get_ports {HADDR[18]}] [get_ports        \
{HADDR[17]}] [get_ports {HADDR[16]}] [get_ports {HADDR[15]}] [get_ports        \
{HADDR[14]}] [get_ports {HADDR[13]}] [get_ports {HADDR[12]}] [get_ports        \
{HADDR[11]}] [get_ports {HADDR[10]}] [get_ports {HADDR[9]}] [get_ports         \
{HADDR[8]}] [get_ports {HADDR[7]}] [get_ports {HADDR[6]}] [get_ports           \
{HADDR[5]}] [get_ports {HADDR[4]}] [get_ports {HADDR[3]}] [get_ports           \
{HADDR[2]}] [get_ports {HADDR[1]}] [get_ports {HADDR[0]}] [get_ports           \
{HBURST[2]}] [get_ports {HBURST[1]}] [get_ports {HBURST[0]}] [get_ports        \
HMASTLOCK] [get_ports {HPROT[3]}] [get_ports {HPROT[2]}] [get_ports            \
{HPROT[1]}] [get_ports {HPROT[0]}] [get_ports {HSIZE[2]}] [get_ports           \
{HSIZE[1]}] [get_ports {HSIZE[0]}] [get_ports {HTRANS[1]}] [get_ports          \
{HTRANS[0]}] [get_ports {HWDATA[31]}] [get_ports {HWDATA[30]}] [get_ports      \
{HWDATA[29]}] [get_ports {HWDATA[28]}] [get_ports {HWDATA[27]}] [get_ports     \
{HWDATA[26]}] [get_ports {HWDATA[25]}] [get_ports {HWDATA[24]}] [get_ports     \
{HWDATA[23]}] [get_ports {HWDATA[22]}] [get_ports {HWDATA[21]}] [get_ports     \
{HWDATA[20]}] [get_ports {HWDATA[19]}] [get_ports {HWDATA[18]}] [get_ports     \
{HWDATA[17]}] [get_ports {HWDATA[16]}] [get_ports {HWDATA[15]}] [get_ports     \
{HWDATA[14]}] [get_ports {HWDATA[13]}] [get_ports {HWDATA[12]}] [get_ports     \
{HWDATA[11]}] [get_ports {HWDATA[10]}] [get_ports {HWDATA[9]}] [get_ports      \
{HWDATA[8]}] [get_ports {HWDATA[7]}] [get_ports {HWDATA[6]}] [get_ports        \
{HWDATA[5]}] [get_ports {HWDATA[4]}] [get_ports {HWDATA[3]}] [get_ports        \
{HWDATA[2]}] [get_ports {HWDATA[1]}] [get_ports {HWDATA[0]}] [get_ports        \
HWRITE] [get_ports TXEV] [get_ports LOCKUP] [get_ports SYSRESETREQ] [get_ports \
SLEEPING]]
group_path -name REGIN  -from [list [get_ports HRESETn] [get_ports             \
{HRDATA[31]}] [get_ports {HRDATA[30]}] [get_ports {HRDATA[29]}] [get_ports     \
{HRDATA[28]}] [get_ports {HRDATA[27]}] [get_ports {HRDATA[26]}] [get_ports     \
{HRDATA[25]}] [get_ports {HRDATA[24]}] [get_ports {HRDATA[23]}] [get_ports     \
{HRDATA[22]}] [get_ports {HRDATA[21]}] [get_ports {HRDATA[20]}] [get_ports     \
{HRDATA[19]}] [get_ports {HRDATA[18]}] [get_ports {HRDATA[17]}] [get_ports     \
{HRDATA[16]}] [get_ports {HRDATA[15]}] [get_ports {HRDATA[14]}] [get_ports     \
{HRDATA[13]}] [get_ports {HRDATA[12]}] [get_ports {HRDATA[11]}] [get_ports     \
{HRDATA[10]}] [get_ports {HRDATA[9]}] [get_ports {HRDATA[8]}] [get_ports       \
{HRDATA[7]}] [get_ports {HRDATA[6]}] [get_ports {HRDATA[5]}] [get_ports        \
{HRDATA[4]}] [get_ports {HRDATA[3]}] [get_ports {HRDATA[2]}] [get_ports        \
{HRDATA[1]}] [get_ports {HRDATA[0]}] [get_ports HREADY] [get_ports HRESP]      \
[get_ports NMI] [get_ports {IRQ[15]}] [get_ports {IRQ[14]}] [get_ports         \
{IRQ[13]}] [get_ports {IRQ[12]}] [get_ports {IRQ[11]}] [get_ports {IRQ[10]}]   \
[get_ports {IRQ[9]}] [get_ports {IRQ[8]}] [get_ports {IRQ[7]}] [get_ports      \
{IRQ[6]}] [get_ports {IRQ[5]}] [get_ports {IRQ[4]}] [get_ports {IRQ[3]}]       \
[get_ports {IRQ[2]}] [get_ports {IRQ[1]}] [get_ports {IRQ[0]}] [get_ports      \
RXEV]]
group_path -name REGOUT  -to [list [get_ports {HADDR[31]}] [get_ports          \
{HADDR[30]}] [get_ports {HADDR[29]}] [get_ports {HADDR[28]}] [get_ports        \
{HADDR[27]}] [get_ports {HADDR[26]}] [get_ports {HADDR[25]}] [get_ports        \
{HADDR[24]}] [get_ports {HADDR[23]}] [get_ports {HADDR[22]}] [get_ports        \
{HADDR[21]}] [get_ports {HADDR[20]}] [get_ports {HADDR[19]}] [get_ports        \
{HADDR[18]}] [get_ports {HADDR[17]}] [get_ports {HADDR[16]}] [get_ports        \
{HADDR[15]}] [get_ports {HADDR[14]}] [get_ports {HADDR[13]}] [get_ports        \
{HADDR[12]}] [get_ports {HADDR[11]}] [get_ports {HADDR[10]}] [get_ports        \
{HADDR[9]}] [get_ports {HADDR[8]}] [get_ports {HADDR[7]}] [get_ports           \
{HADDR[6]}] [get_ports {HADDR[5]}] [get_ports {HADDR[4]}] [get_ports           \
{HADDR[3]}] [get_ports {HADDR[2]}] [get_ports {HADDR[1]}] [get_ports           \
{HADDR[0]}] [get_ports {HBURST[2]}] [get_ports {HBURST[1]}] [get_ports         \
{HBURST[0]}] [get_ports HMASTLOCK] [get_ports {HPROT[3]}] [get_ports           \
{HPROT[2]}] [get_ports {HPROT[1]}] [get_ports {HPROT[0]}] [get_ports           \
{HSIZE[2]}] [get_ports {HSIZE[1]}] [get_ports {HSIZE[0]}] [get_ports           \
{HTRANS[1]}] [get_ports {HTRANS[0]}] [get_ports {HWDATA[31]}] [get_ports       \
{HWDATA[30]}] [get_ports {HWDATA[29]}] [get_ports {HWDATA[28]}] [get_ports     \
{HWDATA[27]}] [get_ports {HWDATA[26]}] [get_ports {HWDATA[25]}] [get_ports     \
{HWDATA[24]}] [get_ports {HWDATA[23]}] [get_ports {HWDATA[22]}] [get_ports     \
{HWDATA[21]}] [get_ports {HWDATA[20]}] [get_ports {HWDATA[19]}] [get_ports     \
{HWDATA[18]}] [get_ports {HWDATA[17]}] [get_ports {HWDATA[16]}] [get_ports     \
{HWDATA[15]}] [get_ports {HWDATA[14]}] [get_ports {HWDATA[13]}] [get_ports     \
{HWDATA[12]}] [get_ports {HWDATA[11]}] [get_ports {HWDATA[10]}] [get_ports     \
{HWDATA[9]}] [get_ports {HWDATA[8]}] [get_ports {HWDATA[7]}] [get_ports        \
{HWDATA[6]}] [get_ports {HWDATA[5]}] [get_ports {HWDATA[4]}] [get_ports        \
{HWDATA[3]}] [get_ports {HWDATA[2]}] [get_ports {HWDATA[1]}] [get_ports        \
{HWDATA[0]}] [get_ports HWRITE] [get_ports TXEV] [get_ports LOCKUP] [get_ports \
SYSRESETREQ] [get_ports SLEEPING]]
set_input_delay -clock HCLK  120  [get_ports HRESETn]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[31]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[30]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[29]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[28]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[27]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[26]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[25]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[24]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[23]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[22]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[21]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[20]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[19]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[18]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[17]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[16]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[15]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[14]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[13]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[12]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[11]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[10]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[9]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[8]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[7]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[6]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[5]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[4]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[3]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[2]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[1]}]
set_input_delay -clock HCLK  120  [get_ports {HRDATA[0]}]
set_input_delay -clock HCLK  120  [get_ports HREADY]
set_input_delay -clock HCLK  120  [get_ports HRESP]
set_input_delay -clock HCLK  120  [get_ports NMI]
set_input_delay -clock HCLK  120  [get_ports {IRQ[15]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[14]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[13]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[12]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[11]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[10]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[9]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[8]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[7]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[6]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[5]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[4]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[3]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[2]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[1]}]
set_input_delay -clock HCLK  120  [get_ports {IRQ[0]}]
set_input_delay -clock HCLK  120  [get_ports RXEV]
set_output_delay -clock HCLK  120  [get_ports {HADDR[31]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[30]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[29]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[28]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[27]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[26]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[25]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[24]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[23]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[22]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[21]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[20]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[19]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[18]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[17]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[16]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[15]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[14]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[13]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[12]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[11]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[10]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[9]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[8]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[7]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[6]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[5]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[4]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[3]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[2]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[1]}]
set_output_delay -clock HCLK  120  [get_ports {HADDR[0]}]
set_output_delay -clock HCLK  120  [get_ports {HBURST[2]}]
set_output_delay -clock HCLK  120  [get_ports {HBURST[1]}]
set_output_delay -clock HCLK  120  [get_ports {HBURST[0]}]
set_output_delay -clock HCLK  120  [get_ports HMASTLOCK]
set_output_delay -clock HCLK  120  [get_ports {HPROT[3]}]
set_output_delay -clock HCLK  120  [get_ports {HPROT[2]}]
set_output_delay -clock HCLK  120  [get_ports {HPROT[1]}]
set_output_delay -clock HCLK  120  [get_ports {HPROT[0]}]
set_output_delay -clock HCLK  120  [get_ports {HSIZE[2]}]
set_output_delay -clock HCLK  120  [get_ports {HSIZE[1]}]
set_output_delay -clock HCLK  120  [get_ports {HSIZE[0]}]
set_output_delay -clock HCLK  120  [get_ports {HTRANS[1]}]
set_output_delay -clock HCLK  120  [get_ports {HTRANS[0]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[31]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[30]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[29]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[28]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[27]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[26]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[25]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[24]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[23]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[22]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[21]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[20]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[19]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[18]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[17]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[16]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[15]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[14]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[13]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[12]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[11]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[10]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[9]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[8]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[7]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[6]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[5]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[4]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[3]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[2]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[1]}]
set_output_delay -clock HCLK  120  [get_ports {HWDATA[0]}]
set_output_delay -clock HCLK  120  [get_ports HWRITE]
set_output_delay -clock HCLK  120  [get_ports TXEV]
set_output_delay -clock HCLK  120  [get_ports LOCKUP]
set_output_delay -clock HCLK  120  [get_ports SYSRESETREQ]
set_output_delay -clock HCLK  120  [get_ports SLEEPING]
set compile_inbound_cell_optimization false
set compile_inbound_max_cell_percentage 10.0
