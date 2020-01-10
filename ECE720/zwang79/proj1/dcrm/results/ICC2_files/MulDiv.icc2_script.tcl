set _DCG_ICC2_DIR_ [file dirname [file normalize [info script]]]



##################################################################
# Read Design
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/MulDiv.v]} {
read_verilog ${_DCG_ICC2_DIR_}/MulDiv.v -top MulDiv
}



##################################################################
# Read settings
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/MulDiv.settings.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/MulDiv.settings.tcl 
}



##################################################################
# Read SDC
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/MulDiv.MCMM/top.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/MulDiv.MCMM/top.tcl 
}



##################################################################
# Read Floorplan
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/MulDiv.floorplan/floorplan.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/MulDiv.floorplan/floorplan.tcl 
}



##################################################################
# Read scan DEF
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/MulDiv.scan.def]} {
read_def ${_DCG_ICC2_DIR_}/MulDiv.scan.def 
}



##################################################################
# Read cell expansion data
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/MulDiv.cell.exp]} {
read_cell_expansion -input ${_DCG_ICC2_DIR_}/MulDiv.cell.exp 
}



