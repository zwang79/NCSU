##################################################################
##  Created by: Design Compiler
##  Version: P-2019.03-SP1
##  Design: CORTEXM0DS
##  Date: Thu Sep 26 23:25:05 2019
##  Command: write_floorplan
##################################################################
set _dirName__0 [file dirname [file normalize [info script]]]


################################################################################
# Read DEF
################################################################################


read_def -allow_cell_creation ${_dirName__0}/floorplan.def


################################################################################
# Bounds
################################################################################




################################################################################
# Route guides
################################################################################




################################################################################
# Blockages
################################################################################




################################################################################
# Voltage areas
################################################################################




################################################################################
# RP groups
################################################################################


if {[file exists ${_dirName__0}/rp.tcl]} {
source ${_dirName__0}/rp.tcl
}


################################################################################
# User Shapes
################################################################################




################################################################################
# Routing directions
################################################################################


set_ignored_layers -rc_congestion_ignored_layers {MSMG1 MSMG2 MSMG3 MSMG4 MSMG5 MG1 MG2 } -min_routing_layer {M1} -max_routing_layer {MINT5} -verbose
set_attribute [get_layer M1] routing_direction vertical
set_attribute [get_layer MINT1] routing_direction horizontal
set_attribute [get_layer MINT2] routing_direction vertical
set_attribute [get_layer MINT3] routing_direction horizontal
set_attribute [get_layer MINT4] routing_direction vertical
set_attribute [get_layer MINT5] routing_direction horizontal
set_attribute [get_layer MSMG1] routing_direction vertical
set_attribute [get_layer MSMG2] routing_direction horizontal
set_attribute [get_layer MSMG3] routing_direction vertical
set_attribute [get_layer MSMG4] routing_direction horizontal
set_attribute [get_layer MSMG5] routing_direction vertical
set_attribute [get_layer MG1] routing_direction horizontal
set_attribute [get_layer MG2] routing_direction vertical


################################################################################
# Routing Rules
################################################################################


# option added by compile_layer_aware_optimization edit if necessary
source ${_dirName__0}/routing_rule.lao.tcl
source ${_dirName__0}/routing_rule.tcl
source ${_dirName__0}/routing_rule.net.tcl
source ${_dirName__0}/routing_rule.layer.tcl
