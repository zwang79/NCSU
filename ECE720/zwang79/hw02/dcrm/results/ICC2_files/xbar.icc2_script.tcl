set _DCG_ICC2_DIR_ [file dirname [file normalize [info script]]]



##################################################################
# Read Design
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/xbar.v]} {
read_verilog ${_DCG_ICC2_DIR_}/xbar.v -top xbar
}



##################################################################
# Read settings
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/xbar.settings.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/xbar.settings.tcl 
}



##################################################################
# Read SDC
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/xbar.MCMM/top.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/xbar.MCMM/top.tcl 
}



##################################################################
# Read Floorplan
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/xbar.floorplan/floorplan.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/xbar.floorplan/floorplan.tcl 
}



##################################################################
# Read scan DEF
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/xbar.scan.def]} {
read_def ${_DCG_ICC2_DIR_}/xbar.scan.def 
}



##################################################################
# Read cell expansion data
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/xbar.cell.exp]} {
read_cell_expansion -input ${_DCG_ICC2_DIR_}/xbar.cell.exp 
}



