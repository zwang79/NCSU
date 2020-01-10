set _DCG_ICC2_DIR_ [file dirname [file normalize [info script]]]



##################################################################
# Read Design
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/CORTEXM0DS.v]} {
read_verilog ${_DCG_ICC2_DIR_}/CORTEXM0DS.v -top CORTEXM0DS
}



##################################################################
# Read settings
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/CORTEXM0DS.settings.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/CORTEXM0DS.settings.tcl 
}



##################################################################
# Read SDC
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/CORTEXM0DS.MCMM/top.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/CORTEXM0DS.MCMM/top.tcl 
}



##################################################################
# Read Floorplan
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/CORTEXM0DS.floorplan/floorplan.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/CORTEXM0DS.floorplan/floorplan.tcl 
}



##################################################################
# Read scan DEF
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/CORTEXM0DS.scan.def]} {
read_def ${_DCG_ICC2_DIR_}/CORTEXM0DS.scan.def 
}



##################################################################
# Read cell expansion data
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/CORTEXM0DS.cell.exp]} {
read_cell_expansion -input ${_DCG_ICC2_DIR_}/CORTEXM0DS.cell.exp 
}



