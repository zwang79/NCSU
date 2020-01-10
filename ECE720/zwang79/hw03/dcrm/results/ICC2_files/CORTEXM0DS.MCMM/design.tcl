if { [namespace current] != {::5D8D8111} } { error {This script [file tail [info script]] should not be sourced directly}; }
###################################################################

# Created by write_script -format dctcl for global constraints on Thu Sep 26   \
23:25:06 2019

###################################################################

# Set the current_design #
current_design CORTEXM0DS

set_units -time ps -resistance kOhm -capacitance fF -voltage V -current uA
set_flatten -effort 0 -design [current_design]
set_flatten -minimize 0 -design [current_design]
set_dft_insertion_configuration -map_effort Medium -synthesis_optimization     \
None -route_scan_enable True -route_scan_clock True -route_scan_serial True    \
-preserve_design_name True -unscan False
set_structure false
set_max_area 0
set_fix_multiple_port_nets -all -buffer_constants
set_attribute -type boolean [current_design] pwr_cg_design_has_clock_gating    \
true
set_local_link_library                                                         \
{/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/nangate/NanGate_15nm_OCL_v0.1_2014_06.A/front_end/timing_power_noise/CCS/NanGate_15nm_OCL_fast_conditional_ccs.db,/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/nangate/NanGate_15nm_OCL_v0.1_2014_06.A/front_end/timing_power_noise/CCS/NanGate_15nm_OCL_low_temp_conditional_ccs.db,/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/nangate/NanGate_15nm_OCL_v0.1_2014_06.A/front_end/timing_power_noise/CCS/NanGate_15nm_OCL_slow_conditional_ccs.db,/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/nangate/NanGate_15nm_OCL_v0.1_2014_06.A/front_end/timing_power_noise/CCS/NanGate_15nm_OCL_worst_low_conditional_ccs.db}
set_register_merging [current_design] 17
set_attribute -type integer [current_design] pwr_cg_gating_group_count 32
set_attribute -type boolean [get_cells clk_gate_u_logic_R1w2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells clk_gate_u_logic_H9i2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells clk_gate_u_logic_V1l2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells clk_gate_u_logic_Omk2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_J6i2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Rni2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Fpi2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Uqi2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Xti2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Kyi2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_X2j2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Glj2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Koj2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_D7k2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Svk2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Z4l2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Fzl2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_L8m2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Bdm2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_O0o2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Vgs2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Tqs2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_R0t2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Cgt2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Lpu2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Ehz2z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Yd03z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Sa13z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Bk23z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Kt33z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_T253z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Cc63z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Ll73z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_T7d3z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_B1a3z4_reg]            \
clock_gating_logic true
set_attribute -type boolean [get_cells u_logic_clk_gate_Ydw2z4_reg]            \
clock_gating_logic true
set_compile_directives [get_pins clk_gate_u_logic_R1w2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_R1w2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_R1w2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_H9i2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_H9i2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_H9i2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_V1l2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_V1l2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_V1l2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_Omk2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_Omk2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_u_logic_Omk2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_J6i2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_J6i2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_J6i2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Rni2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Rni2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Rni2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Fpi2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Fpi2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Fpi2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Uqi2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Uqi2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Uqi2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Xti2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Xti2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Xti2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Kyi2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Kyi2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Kyi2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_X2j2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_X2j2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_X2j2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Glj2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Glj2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Glj2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Koj2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Koj2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Koj2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_D7k2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_D7k2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_D7k2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Svk2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Svk2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Svk2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Z4l2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Z4l2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Z4l2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Fzl2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Fzl2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Fzl2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_L8m2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_L8m2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_L8m2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Bdm2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Bdm2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Bdm2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_O0o2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_O0o2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_O0o2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Vgs2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Vgs2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Vgs2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Tqs2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Tqs2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Tqs2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_R0t2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_R0t2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_R0t2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Cgt2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Cgt2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Cgt2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Lpu2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Lpu2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Lpu2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ehz2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ehz2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ehz2z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Yd03z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Yd03z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Yd03z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Sa13z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Sa13z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Sa13z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Bk23z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Bk23z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Bk23z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Kt33z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Kt33z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Kt33z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_T253z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_T253z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_T253z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Cc63z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Cc63z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Cc63z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ll73z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ll73z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ll73z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_T7d3z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_T7d3z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_T7d3z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_B1a3z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_B1a3z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_B1a3z4_reg/TE]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ydw2z4_reg/CLK]              \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ydw2z4_reg/EN]               \
-constant_propagation false 
set_compile_directives [get_pins u_logic_clk_gate_Ydw2z4_reg/TE]               \
-constant_propagation false 
set_attribute -type boolean [get_cells clk_gate_u_logic_R1w2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells clk_gate_u_logic_H9i2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells clk_gate_u_logic_V1l2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells clk_gate_u_logic_Omk2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_J6i2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Rni2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Fpi2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Uqi2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Xti2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Kyi2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_X2j2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Glj2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Koj2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_D7k2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Svk2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Z4l2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Fzl2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_L8m2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Bdm2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_O0o2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Vgs2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Tqs2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_R0t2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Cgt2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Lpu2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Ehz2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Yd03z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Sa13z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Bk23z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Kt33z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_T253z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Cc63z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Ll73z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_T7d3z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_B1a3z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells u_logic_clk_gate_Ydw2z4_reg]            \
hpower_inv_cg_cell false
set_attribute -type integer [get_cells u_logic_S5b3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tna3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_P2a3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B1a3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y6t2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_S4w2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jcw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_V1l2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rbi3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rhi2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Omk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J0l2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ohh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jux2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ogo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ieh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ddi3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cma3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hak2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_S3i3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B2i3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xyn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Od83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F473z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wu53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nl43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ec33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_V223z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ey03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K103z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ohv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F8u2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ixn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Arn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Psn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tvn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fi93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Eun2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jpa3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_L8m2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z2h3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I1h3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tzg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_L7p2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_W5p2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H4p2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bnx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zva3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_C9a3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rkd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gmd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rsa3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U5a3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ara3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_D4a3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ym93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y8q2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J7q2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hi83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y873z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pz53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gq43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xg33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_O723z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X213z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_D603z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hmv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ycu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U5q2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mzp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B1q2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F4q2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_No93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Q2q2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rix2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K7g3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T5g3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M5f3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_W3f3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aze3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kxe3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_She3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bge3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dhb3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nfb3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z8b3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J7b3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qxa3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mka3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_W0b3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wia3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M2b3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gha3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_C4b3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qfa3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F2o2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aea3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uei3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jca3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gza3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Taa3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Iua3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_L7a3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Slr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wj83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Na73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_E163z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vr43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mi33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_D923z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kzf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vxf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wnv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Neu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_O2g3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hnr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wor2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z0g3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cq93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lqr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tme3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zjq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dkx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Plx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Foe3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B9g3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dq73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ug63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_L753z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cy33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_To23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kf13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qi03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wlz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Duu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ukt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fwj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dtj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Txj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ruj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T583z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kw63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bn53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sd43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J433z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Av13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nt03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Twz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T9v2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K0u2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I7r2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_E1r2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_S2r2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U5r2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ka93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G4r2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F483z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wu63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nl53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ec43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_V233z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mt13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zr03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fvz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F8v2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wyt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wmp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sgp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gip2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ilp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_W893z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ujp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dq83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ug73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_L763z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cy43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_To33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kf23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fre3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rpe3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Duv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uku2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hue3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U2s2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I4s2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tse3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cxc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_W5s2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G1s2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Szr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I793z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U593z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Efp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ovc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xx93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jw93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U4z2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Iwp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dkr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uup2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zcn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fzl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nag3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wbf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Snd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_E0d3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qyc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vu93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gt93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rr93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jl93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uj93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qg93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bf93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Md93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yb93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G493z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_R293z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_C193z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nz83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yx83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jw83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uu83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Unm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Grl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zkk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xti2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dng3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xmf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I0e3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fxv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rvv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Psv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Arv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lpv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Skv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Djv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zfv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kev2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vcv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hbv2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_R6v2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_C5v2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_N3v2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y1v2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J0v2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uyu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fxu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rvu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Psu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aru2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lpu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ccg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hpd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K7s2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Asr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gcr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Anq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gfq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Naq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_A9p2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kwo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rro2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fio2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J5o2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yfn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J0n2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ipm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gmm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T0m2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Spl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pbl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kjk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_V0k2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Orj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zpj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Koj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sog3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mof3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X1e3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z8s2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Otr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vdr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Poq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vgq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ccq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pap2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zxo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gto2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ujo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y6o2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mhn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y1n2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wqm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ejm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H2m2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qml2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Edl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ggk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K2k2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vmj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Glj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kig3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Eif3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pvd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_E153z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qz43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ow43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zu43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kt43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ro43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cn43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yj43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ji43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ug43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gf43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qa43z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B943z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M743z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X543z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I443z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T243z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_E143z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qz33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ow33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zu33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kt33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Joi3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cai3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M0i3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Euh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wnh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tch3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Eyg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uuf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ibe3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pfz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aez2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mcz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rds2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Eyr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Oir2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_S2p2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Noo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rbo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cmn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_R6n2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mvm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X6m2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xhl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_D7k2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Umi3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_N8i3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xyh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Psh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hmh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ebh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pwg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U9e3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dcs2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qwr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zgr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_D1p2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ymo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cao2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Okn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_C5n2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ytm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J5m2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cll2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Igl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rek2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_O5k2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M4j2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X2j2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vgg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pgf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aud3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Na63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z863z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X563z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I463z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T263z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ay53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lw53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ht53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sr53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dq53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Po53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zj53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ki53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vg53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gf53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rd53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cc53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Na53z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z853z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X553z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I453z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T253z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qji3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J5i3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tvh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lph3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Djh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_A8h3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ltg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qrf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Q6e3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kc03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wa03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H903z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_S703z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_O403z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z203z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vzz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hyz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rtz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Csz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nqz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yoz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Knz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ikz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tiz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ehz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gfg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aff3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lsd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wj73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ii73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gf73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rd73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cc73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J773z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U573z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Q273z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B173z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mz63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yx63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_It63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tr63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Eq63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Po63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_An63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ll63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wj63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ii63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gf63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rd63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cc63z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hqg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bqf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M3e3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wnu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Imu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gju2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rhu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cgu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jbu2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U9u2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Q6u2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B5u2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M3u2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y1u2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ixt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tvt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Eut2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pst2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Art2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lpt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wnt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Imt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gjt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rht2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cgt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wrg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B5e3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Oas2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cvr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kfr2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Eqq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kiq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rdq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ecp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ozo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vuo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jlo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_N8o2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ajn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_N3n2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ksm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Skm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_V3m2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Eol2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tel2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vhk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z3k2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F9j2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Isi2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fpi2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zjg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tjf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Exd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vr33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hq33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fn33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ql33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bk33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_If33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Td33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pa33z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_A933z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_L733z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X533z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H133z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sz23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dy23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ow23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zu23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kt23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vr23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hq23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fn23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ql23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bk23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Olg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ilf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tyd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mi23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yg23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wd23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hc23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sa23z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z523z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K423z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G123z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rz13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cy13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ow13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yr13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jq13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uo13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fn13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ql13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bk13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mi13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yg13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wd13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hc13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sa13z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fli3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y6i3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ixh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Arh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Skh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_P9h3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Avg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ftf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F8e3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_E913z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Q713z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B613z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M413z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I113z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tz03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pw03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bv03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lq03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wo03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hn03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sl03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ek03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ch03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nf03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yd03z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H3d3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T1d3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yaz2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Svk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Auk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K1z2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_C3z2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wzy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fgm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sjj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rni2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wai2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_W7z2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ufy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H9i2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fey2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hyy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qcy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Swy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bby2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dvy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M9y2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pty2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y7y2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bsy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K6y2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nqy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_W4y2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zoy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I3y2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T1y2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bdm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lny2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F0y2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xly2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Owq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jky2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gtp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Viy2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lbn2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dwl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tyx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Hxx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xyk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J4x2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G7x2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_R8x2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cax2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nbx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ycx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jex2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ufx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fhx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xsx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vvx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_V4d3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jwf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_O5t2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rxl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fcj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_R1w2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G9w2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_K9z2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I6z2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cyq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I2t2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qem2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U2x2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ydw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mfw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ahw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Oiw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ckw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qlw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Enw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sow2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gqw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Urw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Itw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xuw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mww2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Byw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qzw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_F1x2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_An83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Df83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_S8k2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lrx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yx73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lgi3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zpx2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nz73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Q7j2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_B6j2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kaf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ldf3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zfh3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nox2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_V883z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Llq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ka83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rr83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ll83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rdg3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G0w2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zb83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Po83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G6d3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H783z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_M1j2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Yzi2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kyi2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sg83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jw73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ft83z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Po73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_R283z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_O0o2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xeo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gdo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Rr73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qzq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_C183z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ll73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gci2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uu73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cqo2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wqd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wce3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qdj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z7i2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_An73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ft73z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Igi2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pdi2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aii3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_X9n2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_G8n2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dks2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bus2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fed3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nnc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tqc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Axm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mis2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kss2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pcd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jsc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Usl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vgs2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tqs2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_T7d3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kkb3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Gcb3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Azs2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jxs2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Svs2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tib3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pab3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cps2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lns2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uls2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qrp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aqp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uqi2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bmb3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Xdb3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H8l2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Q6l2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Z4l2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bjd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lhd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zad3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J9d3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Adt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mbt2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_C3w2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_D4g3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Wxp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Nen2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vve3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mcc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Bec3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Dpc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fhc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uic3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Jkc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ylc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_H2f3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Kop2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lz93z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Lee3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Thm2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_U5x2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Pet2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_L8t2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ffj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ark2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Sgj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_I6w2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Aok2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Fij2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Qfc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ztc3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Y9t2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vaw2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_R0t2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Ffs2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Mjl2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Vfd3z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Trq2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Uaj2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Cam2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tdp2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Idk2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Tki2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_Zei2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells u_logic_J6i2z4_reg]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells clk_gate_u_logic_R1w2z4_reg]            \
pwr_cg_gating_group 11
set_attribute -type integer [get_cells clk_gate_u_logic_H9i2z4_reg]            \
pwr_cg_gating_group 8
set_attribute -type integer [get_cells clk_gate_u_logic_V1l2z4_reg]            \
pwr_cg_gating_group 0
set_attribute -type integer [get_cells clk_gate_u_logic_Omk2z4_reg]            \
pwr_cg_gating_group 1
set_attribute -type integer [get_cells u_logic_S5b3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Tna3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_P2a3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_B1a3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Y6t2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_S4w2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Jcw2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_V1l2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Rbi3z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Rhi2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Omk2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_J0l2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ohh3z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Jux2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ogo2z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Ieh3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Ddi3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Cma3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Hak2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_S3i3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_B2i3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Xyn2z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Od83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_F473z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Wu53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Nl43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Ec33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_V223z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Ey03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_K103z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Ohv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_F8u2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Ixn2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Arn2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Psn2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Tvn2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Fi93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Eun2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Jpa3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_L8m2z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Z2h3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_I1h3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Tzg3z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_L7p2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_W5p2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_H4p2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Bnx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Zva3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_C9a3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Rkd3z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Gmd3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Rsa3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_U5a3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Ara3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_D4a3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Ym93z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Y8q2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_J7q2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Hi83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Y873z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Pz53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Gq43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Xg33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_O723z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_X213z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_D603z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Hmv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Ycu2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_U5q2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Mzp2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_B1q2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_F4q2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_No93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Q2q2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Rix2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_K7g3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_T5g3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_M5f3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_W3f3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Aze3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Kxe3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_She3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Bge3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Dhb3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Nfb3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Z8b3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_J7b3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Qxa3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Mka3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_W0b3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Wia3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_M2b3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Gha3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_C4b3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Qfa3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_F2o2z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Aea3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Uei3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Jca3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Gza3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Taa3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Iua3z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_L7a3z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Slr2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Wj83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Na73z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_E163z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Vr43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Mi33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_D923z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Kzf3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Vxf3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Wnv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Neu2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_O2g3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Hnr2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Wor2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Z0g3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Cq93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Lqr2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Tme3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Zjq2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Dkx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Plx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Foe3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_B9g3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Dq73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Ug63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_L753z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Cy33z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_To23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Kf13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Qi03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Wlz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Duu2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Ukt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Fwj2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Dtj2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Txj2z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Ruj2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_T583z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Kw63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Bn53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Sd43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_J433z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Av13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Nt03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Twz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_T9v2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_K0u2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_I7r2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_E1r2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_S2r2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_U5r2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Ka93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_G4r2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_F483z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Wu63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Nl53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Ec43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_V233z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Mt13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Zr03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Fvz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_F8v2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Wyt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Wmp2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Sgp2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Gip2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Ilp2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_W893z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Ujp2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Dq83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Ug73z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_L763z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Cy43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_To33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Kf23z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Fre3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Rpe3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Duv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Uku2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Hue3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_U2s2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_I4s2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Tse3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Cxc3z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_W5s2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_G1s2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Szr2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_I793z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_U593z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Efp2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Ovc3z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Xx93z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Jw93z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_U4z2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Iwp2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Dkr2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Uup2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_Zcn2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_Fzl2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_Nag3z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Wbf3z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Snd3z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_E0d3z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Qyc3z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Vu93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Gt93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Rr93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Jl93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Uj93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Qg93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Bf93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Md93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Yb93z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_G493z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_R293z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_C193z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Nz83z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Yx83z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Jw83z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Uu83z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Unm2z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Grl2z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Zkk2z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Xti2z4_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells u_logic_Dng3z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Xmf3z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_I0e3z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Fxv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Rvv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Psv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Arv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Lpv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Skv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Djv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Zfv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Kev2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Vcv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Hbv2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_R6v2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_C5v2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_N3v2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Y1v2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_J0v2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Uyu2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Fxu2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Rvu2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Psu2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Aru2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Lpu2z4_reg] pwr_cg_gating_group \
19
set_attribute -type integer [get_cells u_logic_Ccg3z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Hpd3z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_K7s2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Asr2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Gcr2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Anq2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Gfq2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Naq2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_A9p2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Kwo2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Rro2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Fio2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_J5o2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Yfn2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_J0n2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Ipm2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Gmm2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_T0m2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Spl2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Pbl2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Kjk2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_V0k2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Orj2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Zpj2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Koj2z4_reg] pwr_cg_gating_group \
7
set_attribute -type integer [get_cells u_logic_Sog3z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Mof3z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_X1e3z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Z8s2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Otr2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Vdr2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Poq2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Vgq2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Ccq2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Pap2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Zxo2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Gto2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Ujo2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Y6o2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Mhn2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Y1n2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Wqm2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Ejm2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_H2m2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Qml2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Edl2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Ggk2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_K2k2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Vmj2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Glj2z4_reg] pwr_cg_gating_group \
6
set_attribute -type integer [get_cells u_logic_Kig3z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Eif3z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Pvd3z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_E153z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Qz43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Ow43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Zu43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Kt43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Ro43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Cn43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Yj43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Ji43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Ug43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Gf43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Qa43z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_B943z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_M743z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_X543z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_I443z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_T243z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_E143z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Qz33z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Ow33z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Zu33z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Kt33z4_reg] pwr_cg_gating_group \
24
set_attribute -type integer [get_cells u_logic_Joi3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Cai3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_M0i3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Euh3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Wnh3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Tch3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Eyg3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Uuf3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Ibe3z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Pfz2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Aez2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Mcz2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Rds2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Eyr2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Oir2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_S2p2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Noo2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Rbo2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Cmn2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_R6n2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Mvm2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_X6m2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Xhl2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_D7k2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Umi3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_N8i3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Xyh3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Psh3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Hmh3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Ebh3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Pwg3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_U9e3z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Dcs2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Qwr2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Zgr2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_D1p2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Ymo2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Cao2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Okn2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_C5n2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Ytm2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_J5m2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Cll2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Igl2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Rek2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_O5k2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_M4j2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_X2j2z4_reg] pwr_cg_gating_group \
5
set_attribute -type integer [get_cells u_logic_Vgg3z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Pgf3z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Aud3z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Na63z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Z863z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_X563z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_I463z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_T263z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Ay53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Lw53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Ht53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Sr53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Dq53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Po53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Zj53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Ki53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Vg53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Gf53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Rd53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Cc53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Na53z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Z853z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_X553z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_I453z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_T253z4_reg] pwr_cg_gating_group \
25
set_attribute -type integer [get_cells u_logic_Qji3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_J5i3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Tvh3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Lph3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Djh3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_A8h3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Ltg3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Qrf3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Q6e3z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Kc03z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Wa03z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_H903z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_S703z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_O403z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Z203z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Vzz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Hyz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Rtz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Csz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Nqz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Yoz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Knz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Ikz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Tiz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Ehz2z4_reg] pwr_cg_gating_group \
20
set_attribute -type integer [get_cells u_logic_Gfg3z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Aff3z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Lsd3z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Wj73z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Ii73z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Gf73z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Rd73z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Cc73z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_J773z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_U573z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Q273z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_B173z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Mz63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Yx63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_It63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Tr63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Eq63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Po63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_An63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Ll63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Wj63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Ii63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Gf63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Rd63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Cc63z4_reg] pwr_cg_gating_group \
26
set_attribute -type integer [get_cells u_logic_Hqg3z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Bqf3z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_M3e3z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Wnu2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Imu2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Gju2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Rhu2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Cgu2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Jbu2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_U9u2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Q6u2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_B5u2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_M3u2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Y1u2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Ixt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Tvt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Eut2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Pst2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Art2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Lpt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Wnt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Imt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Gjt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Rht2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Cgt2z4_reg] pwr_cg_gating_group \
18
set_attribute -type integer [get_cells u_logic_Wrg3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_B5e3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Oas2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Cvr2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Kfr2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Eqq2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Kiq2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Rdq2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ecp2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ozo2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Vuo2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Jlo2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_N8o2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ajn2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_N3n2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ksm2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Skm2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_V3m2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Eol2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Tel2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Vhk2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Z3k2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_F9j2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Isi2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Fpi2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Zjg3z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Tjf3z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Exd3z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Vr33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Hq33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Fn33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Ql33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Bk33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_If33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Td33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Pa33z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_A933z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_L733z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_X533z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_H133z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Sz23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Dy23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Ow23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Zu23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Kt23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Vr23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Hq23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Fn23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Ql23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Bk23z4_reg] pwr_cg_gating_group \
23
set_attribute -type integer [get_cells u_logic_Olg3z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Ilf3z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Tyd3z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Mi23z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Yg23z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Wd23z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Hc23z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Sa23z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Z523z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_K423z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_G123z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Rz13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Cy13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Ow13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Yr13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Jq13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Uo13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Fn13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Ql13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Bk13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Mi13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Yg13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Wd13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Hc13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Sa13z4_reg] pwr_cg_gating_group \
22
set_attribute -type integer [get_cells u_logic_Fli3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Y6i3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Ixh3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Arh3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Skh3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_P9h3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Avg3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Ftf3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_F8e3z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_E913z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Q713z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_B613z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_M413z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_I113z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Tz03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Pw03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Bv03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Lq03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Wo03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Hn03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Sl03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Ek03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Ch03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Nf03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_Yd03z4_reg] pwr_cg_gating_group \
21
set_attribute -type integer [get_cells u_logic_H3d3z4_reg] pwr_cg_gating_group \
9
set_attribute -type integer [get_cells u_logic_T1d3z4_reg] pwr_cg_gating_group \
9
set_attribute -type integer [get_cells u_logic_Yaz2z4_reg] pwr_cg_gating_group \
9
set_attribute -type integer [get_cells u_logic_Svk2z4_reg] pwr_cg_gating_group \
9
set_attribute -type integer [get_cells u_logic_Auk2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_K1z2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_C3z2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Wzy2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Fgm2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Sjj2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Rni2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Wai2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_W7z2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Ufy2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_H9i2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Fey2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Hyy2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Qcy2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Swy2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Bby2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Dvy2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_M9y2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Pty2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Y7y2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Bsy2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_K6y2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Nqy2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_W4y2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Zoy2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_I3y2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_T1y2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Bdm2z4_reg] pwr_cg_gating_group \
13
set_attribute -type integer [get_cells u_logic_Lny2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_F0y2z4_reg] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells u_logic_Xly2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Owq2z4_reg] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells u_logic_Jky2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Gtp2z4_reg] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells u_logic_Viy2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Lbn2z4_reg] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells u_logic_Dwl2z4_reg] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells u_logic_Tyx2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Hxx2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Xyk2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_J4x2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_G7x2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_R8x2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Cax2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Nbx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ycx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Jex2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ufx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Fhx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Xsx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Vvx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_V4d3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Jwf3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_O5t2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Rxl2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Fcj2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_R1w2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_G9w2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_K9z2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_I6z2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Cyq2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_I2t2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Qem2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_U2x2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Ydw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Mfw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Ahw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Oiw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Ckw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Qlw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Enw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Sow2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Gqw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Urw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Itw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Xuw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Mww2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Byw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_Qzw2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_F1x2z4_reg] pwr_cg_gating_group \
30
set_attribute -type integer [get_cells u_logic_An83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Df83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_S8k2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Lrx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Yx73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Lgi3z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Zpx2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Nz73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Q7j2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_B6j2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Kaf3z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_Ldf3z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Zfh3z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Nox2z4_reg] pwr_cg_gating_group \
1
set_attribute -type integer [get_cells u_logic_V883z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Llq2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Ka83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Rr83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Ll83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Rdg3z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_G0w2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_Zb83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Po83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_G6d3z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_H783z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_M1j2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Yzi2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Kyi2z4_reg] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells u_logic_Sg83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Jw73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Ft83z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Po73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_R283z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_O0o2z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Xeo2z4_reg] pwr_cg_gating_group \
14
set_attribute -type integer [get_cells u_logic_Gdo2z4_reg] pwr_cg_gating_group \
12
set_attribute -type integer [get_cells u_logic_Rr73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Qzq2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_C183z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Ll73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Gci2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Uu73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Cqo2z4_reg] pwr_cg_gating_group \
0
set_attribute -type integer [get_cells u_logic_Wqd3z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Wce3z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Qdj2z4_reg] pwr_cg_gating_group \
8
set_attribute -type integer [get_cells u_logic_Z7i2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_An73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Ft73z4_reg] pwr_cg_gating_group \
27
set_attribute -type integer [get_cells u_logic_Igi2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Pdi2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Aii3z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_X9n2z4_reg] pwr_cg_gating_group \
2
set_attribute -type integer [get_cells u_logic_G8n2z4_reg] pwr_cg_gating_group \
10
set_attribute -type integer [get_cells u_logic_Dks2z4_reg] pwr_cg_gating_group \
15
set_attribute -type integer [get_cells u_logic_Bus2z4_reg] pwr_cg_gating_group \
16
set_attribute -type integer [get_cells u_logic_Fed3z4_reg] pwr_cg_gating_group \
28
set_attribute -type integer [get_cells u_logic_Nnc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Tqc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Axm2z4_reg] pwr_cg_gating_group \
10
set_attribute -type integer [get_cells u_logic_Mis2z4_reg] pwr_cg_gating_group \
15
set_attribute -type integer [get_cells u_logic_Kss2z4_reg] pwr_cg_gating_group \
16
set_attribute -type integer [get_cells u_logic_Pcd3z4_reg] pwr_cg_gating_group \
28
set_attribute -type integer [get_cells u_logic_Jsc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Usl2z4_reg] pwr_cg_gating_group \
10
set_attribute -type integer [get_cells u_logic_Vgs2z4_reg] pwr_cg_gating_group \
15
set_attribute -type integer [get_cells u_logic_Tqs2z4_reg] pwr_cg_gating_group \
16
set_attribute -type integer [get_cells u_logic_T7d3z4_reg] pwr_cg_gating_group \
28
set_attribute -type integer [get_cells u_logic_Kkb3z4_reg] pwr_cg_gating_group \
16
set_attribute -type integer [get_cells u_logic_Gcb3z4_reg] pwr_cg_gating_group \
16
set_attribute -type integer [get_cells u_logic_Azs2z4_reg] pwr_cg_gating_group \
16
set_attribute -type integer [get_cells u_logic_Jxs2z4_reg] pwr_cg_gating_group \
16
set_attribute -type integer [get_cells u_logic_Svs2z4_reg] pwr_cg_gating_group \
16
set_attribute -type integer [get_cells u_logic_Tib3z4_reg] pwr_cg_gating_group \
15
set_attribute -type integer [get_cells u_logic_Pab3z4_reg] pwr_cg_gating_group \
15
set_attribute -type integer [get_cells u_logic_Cps2z4_reg] pwr_cg_gating_group \
15
set_attribute -type integer [get_cells u_logic_Lns2z4_reg] pwr_cg_gating_group \
15
set_attribute -type integer [get_cells u_logic_Uls2z4_reg] pwr_cg_gating_group \
15
set_attribute -type integer [get_cells u_logic_Qrp2z4_reg] pwr_cg_gating_group \
2
set_attribute -type integer [get_cells u_logic_Aqp2z4_reg] pwr_cg_gating_group \
2
set_attribute -type integer [get_cells u_logic_Uqi2z4_reg] pwr_cg_gating_group \
2
set_attribute -type integer [get_cells u_logic_Bmb3z4_reg] pwr_cg_gating_group \
10
set_attribute -type integer [get_cells u_logic_Xdb3z4_reg] pwr_cg_gating_group \
10
set_attribute -type integer [get_cells u_logic_H8l2z4_reg] pwr_cg_gating_group \
10
set_attribute -type integer [get_cells u_logic_Q6l2z4_reg] pwr_cg_gating_group \
10
set_attribute -type integer [get_cells u_logic_Z4l2z4_reg] pwr_cg_gating_group \
10
set_attribute -type integer [get_cells u_logic_Bjd3z4_reg] pwr_cg_gating_group \
28
set_attribute -type integer [get_cells u_logic_Lhd3z4_reg] pwr_cg_gating_group \
28
set_attribute -type integer [get_cells u_logic_Zad3z4_reg] pwr_cg_gating_group \
28
set_attribute -type integer [get_cells u_logic_J9d3z4_reg] pwr_cg_gating_group \
28
set_attribute -type integer [get_cells u_logic_Adt2z4_reg] pwr_cg_gating_group \
17
set_attribute -type integer [get_cells u_logic_Mbt2z4_reg] pwr_cg_gating_group \
17
set_attribute -type integer [get_cells u_logic_C3w2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_D4g3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Wxp2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Nen2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Vve3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Mcc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Bec3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Dpc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Fhc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Uic3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Jkc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Ylc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_H2f3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Kop2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Lz93z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Lee3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Thm2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_U5x2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Pet2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_L8t2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Ffj2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Ark2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Sgj2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_I6w2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Aok2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Fij2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Qfc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Ztc3z4_reg] pwr_cg_gating_group \
29
set_attribute -type integer [get_cells u_logic_Y9t2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Vaw2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_R0t2z4_reg] pwr_cg_gating_group \
17
set_attribute -type integer [get_cells u_logic_Ffs2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Mjl2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Vfd3z4_reg] pwr_cg_gating_group \
28
set_attribute -type integer [get_cells u_logic_Trq2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_Uaj2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_Cam2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_Tdp2z4_reg] pwr_cg_gating_group \
11
set_attribute -type integer [get_cells u_logic_Idk2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Tki2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_Zei2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_J6i2z4_reg] pwr_cg_gating_group \
31
set_attribute -type integer [get_cells u_logic_clk_gate_J6i2z4_reg]            \
pwr_cg_gating_group 31
set_attribute -type integer [get_cells u_logic_clk_gate_Rni2z4_reg]            \
pwr_cg_gating_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Fpi2z4_reg]            \
pwr_cg_gating_group 1
set_attribute -type integer [get_cells u_logic_clk_gate_Uqi2z4_reg]            \
pwr_cg_gating_group 2
set_attribute -type integer [get_cells u_logic_clk_gate_Xti2z4_reg]            \
pwr_cg_gating_group 3
set_attribute -type integer [get_cells u_logic_clk_gate_Kyi2z4_reg]            \
pwr_cg_gating_group 4
set_attribute -type integer [get_cells u_logic_clk_gate_X2j2z4_reg]            \
pwr_cg_gating_group 5
set_attribute -type integer [get_cells u_logic_clk_gate_Glj2z4_reg]            \
pwr_cg_gating_group 6
set_attribute -type integer [get_cells u_logic_clk_gate_Koj2z4_reg]            \
pwr_cg_gating_group 7
set_attribute -type integer [get_cells u_logic_clk_gate_D7k2z4_reg]            \
pwr_cg_gating_group 8
set_attribute -type integer [get_cells u_logic_clk_gate_Svk2z4_reg]            \
pwr_cg_gating_group 9
set_attribute -type integer [get_cells u_logic_clk_gate_Z4l2z4_reg]            \
pwr_cg_gating_group 10
set_attribute -type integer [get_cells u_logic_clk_gate_Fzl2z4_reg]            \
pwr_cg_gating_group 11
set_attribute -type integer [get_cells u_logic_clk_gate_L8m2z4_reg]            \
pwr_cg_gating_group 12
set_attribute -type integer [get_cells u_logic_clk_gate_Bdm2z4_reg]            \
pwr_cg_gating_group 13
set_attribute -type integer [get_cells u_logic_clk_gate_O0o2z4_reg]            \
pwr_cg_gating_group 14
set_attribute -type integer [get_cells u_logic_clk_gate_Vgs2z4_reg]            \
pwr_cg_gating_group 15
set_attribute -type integer [get_cells u_logic_clk_gate_Tqs2z4_reg]            \
pwr_cg_gating_group 16
set_attribute -type integer [get_cells u_logic_clk_gate_R0t2z4_reg]            \
pwr_cg_gating_group 17
set_attribute -type integer [get_cells u_logic_clk_gate_Cgt2z4_reg]            \
pwr_cg_gating_group 18
set_attribute -type integer [get_cells u_logic_clk_gate_Lpu2z4_reg]            \
pwr_cg_gating_group 19
set_attribute -type integer [get_cells u_logic_clk_gate_Ehz2z4_reg]            \
pwr_cg_gating_group 20
set_attribute -type integer [get_cells u_logic_clk_gate_Yd03z4_reg]            \
pwr_cg_gating_group 21
set_attribute -type integer [get_cells u_logic_clk_gate_Sa13z4_reg]            \
pwr_cg_gating_group 22
set_attribute -type integer [get_cells u_logic_clk_gate_Bk23z4_reg]            \
pwr_cg_gating_group 23
set_attribute -type integer [get_cells u_logic_clk_gate_Kt33z4_reg]            \
pwr_cg_gating_group 24
set_attribute -type integer [get_cells u_logic_clk_gate_T253z4_reg]            \
pwr_cg_gating_group 25
set_attribute -type integer [get_cells u_logic_clk_gate_Cc63z4_reg]            \
pwr_cg_gating_group 26
set_attribute -type integer [get_cells u_logic_clk_gate_Ll73z4_reg]            \
pwr_cg_gating_group 27
set_attribute -type integer [get_cells u_logic_clk_gate_T7d3z4_reg]            \
pwr_cg_gating_group 28
set_attribute -type integer [get_cells u_logic_clk_gate_B1a3z4_reg]            \
pwr_cg_gating_group 29
set_attribute -type integer [get_cells u_logic_clk_gate_Ydw2z4_reg]            \
pwr_cg_gating_group 30
set_attribute -type integer [get_cells clk_gate_u_logic_R1w2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_u_logic_H9i2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_u_logic_V1l2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_u_logic_Omk2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_S5b3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tna3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_P2a3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B1a3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y6t2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_S4w2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jcw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_V1l2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rbi3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rhi2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Omk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J0l2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ohh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jux2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ogo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ieh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ddi3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cma3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hak2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_S3i3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B2i3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xyn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Od83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F473z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wu53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nl43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ec33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_V223z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ey03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K103z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ohv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F8u2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ixn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Arn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Psn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tvn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fi93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Eun2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jpa3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_L8m2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z2h3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I1h3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tzg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_L7p2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_W5p2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H4p2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bnx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zva3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_C9a3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rkd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gmd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rsa3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U5a3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ara3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_D4a3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ym93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y8q2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J7q2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hi83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y873z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pz53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gq43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xg33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_O723z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X213z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_D603z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hmv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ycu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U5q2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mzp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B1q2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F4q2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_No93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Q2q2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rix2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K7g3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T5g3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M5f3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_W3f3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aze3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kxe3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_She3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bge3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dhb3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nfb3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z8b3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J7b3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qxa3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mka3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_W0b3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wia3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M2b3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gha3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_C4b3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qfa3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F2o2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aea3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uei3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jca3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gza3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Taa3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Iua3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_L7a3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Slr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wj83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Na73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_E163z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vr43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mi33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_D923z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kzf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vxf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wnv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Neu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_O2g3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hnr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wor2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z0g3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cq93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lqr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tme3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zjq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dkx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Plx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Foe3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B9g3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dq73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ug63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_L753z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cy33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_To23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kf13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qi03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wlz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Duu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ukt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fwj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dtj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Txj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ruj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T583z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kw63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bn53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sd43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J433z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Av13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nt03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Twz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T9v2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K0u2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I7r2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_E1r2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_S2r2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U5r2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ka93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G4r2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F483z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wu63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nl53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ec43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_V233z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mt13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zr03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fvz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F8v2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wyt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wmp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sgp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gip2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ilp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_W893z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ujp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dq83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ug73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_L763z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cy43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_To33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kf23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fre3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rpe3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Duv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uku2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hue3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U2s2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I4s2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tse3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cxc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_W5s2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G1s2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Szr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I793z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U593z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Efp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ovc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xx93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jw93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U4z2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Iwp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dkr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uup2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zcn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fzl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nag3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wbf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Snd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_E0d3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qyc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vu93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gt93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rr93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jl93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uj93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qg93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bf93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Md93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yb93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G493z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_R293z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_C193z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nz83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yx83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jw83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uu83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Unm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Grl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zkk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xti2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dng3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xmf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I0e3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fxv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rvv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Psv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Arv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lpv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Skv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Djv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zfv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kev2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vcv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hbv2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_R6v2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_C5v2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_N3v2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y1v2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J0v2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uyu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fxu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rvu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Psu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aru2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lpu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ccg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hpd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K7s2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Asr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gcr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Anq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gfq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Naq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_A9p2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kwo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rro2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fio2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J5o2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yfn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J0n2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ipm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gmm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T0m2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Spl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pbl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kjk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_V0k2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Orj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zpj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Koj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sog3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mof3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X1e3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z8s2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Otr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vdr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Poq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vgq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ccq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pap2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zxo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gto2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ujo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y6o2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mhn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y1n2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wqm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ejm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H2m2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qml2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Edl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ggk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K2k2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vmj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Glj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kig3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Eif3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pvd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_E153z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qz43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ow43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zu43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kt43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ro43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cn43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yj43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ji43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ug43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gf43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qa43z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B943z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M743z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X543z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I443z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T243z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_E143z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qz33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ow33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zu33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kt33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Joi3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cai3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M0i3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Euh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wnh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tch3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Eyg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uuf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ibe3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pfz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aez2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mcz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rds2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Eyr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Oir2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_S2p2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Noo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rbo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cmn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_R6n2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mvm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X6m2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xhl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_D7k2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Umi3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_N8i3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xyh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Psh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hmh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ebh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pwg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U9e3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dcs2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qwr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zgr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_D1p2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ymo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cao2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Okn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_C5n2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ytm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J5m2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cll2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Igl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rek2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_O5k2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M4j2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X2j2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vgg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pgf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aud3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Na63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z863z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X563z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I463z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T263z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ay53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lw53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ht53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sr53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dq53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Po53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zj53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ki53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vg53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gf53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rd53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cc53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Na53z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z853z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X553z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I453z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T253z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qji3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J5i3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tvh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lph3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Djh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_A8h3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ltg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qrf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Q6e3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kc03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wa03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H903z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_S703z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_O403z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z203z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vzz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hyz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rtz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Csz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nqz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yoz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Knz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ikz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tiz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ehz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gfg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aff3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lsd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wj73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ii73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gf73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rd73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cc73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J773z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U573z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Q273z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B173z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mz63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yx63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_It63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tr63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Eq63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Po63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_An63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ll63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wj63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ii63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gf63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rd63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cc63z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hqg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bqf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M3e3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wnu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Imu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gju2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rhu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cgu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jbu2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U9u2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Q6u2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B5u2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M3u2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y1u2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ixt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tvt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Eut2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pst2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Art2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lpt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wnt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Imt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gjt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rht2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cgt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wrg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B5e3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Oas2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cvr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kfr2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Eqq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kiq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rdq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ecp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ozo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vuo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jlo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_N8o2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ajn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_N3n2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ksm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Skm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_V3m2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Eol2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tel2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vhk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z3k2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F9j2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Isi2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fpi2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zjg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tjf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Exd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vr33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hq33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fn33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ql33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bk33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_If33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Td33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pa33z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_A933z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_L733z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X533z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H133z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sz23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dy23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ow23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zu23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kt23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vr23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hq23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fn23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ql23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bk23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Olg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ilf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tyd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mi23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yg23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wd23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hc23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sa23z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z523z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K423z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G123z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rz13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cy13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ow13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yr13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jq13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uo13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fn13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ql13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bk13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mi13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yg13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wd13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hc13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sa13z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fli3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y6i3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ixh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Arh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Skh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_P9h3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Avg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ftf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F8e3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_E913z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Q713z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B613z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M413z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I113z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tz03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pw03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bv03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lq03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wo03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hn03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sl03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ek03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ch03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nf03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yd03z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H3d3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T1d3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yaz2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Svk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Auk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K1z2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_C3z2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wzy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fgm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sjj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rni2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wai2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_W7z2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ufy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H9i2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fey2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hyy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qcy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Swy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bby2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dvy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M9y2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pty2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y7y2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bsy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K6y2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nqy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_W4y2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zoy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I3y2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T1y2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bdm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lny2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F0y2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xly2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Owq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jky2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gtp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Viy2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lbn2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dwl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tyx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Hxx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xyk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J4x2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G7x2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_R8x2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cax2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nbx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ycx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jex2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ufx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fhx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xsx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vvx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_V4d3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jwf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_O5t2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rxl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fcj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_R1w2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G9w2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_K9z2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I6z2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cyq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I2t2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qem2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U2x2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ydw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mfw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ahw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Oiw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ckw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qlw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Enw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sow2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gqw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Urw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Itw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xuw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mww2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Byw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qzw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_F1x2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_An83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Df83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_S8k2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lrx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yx73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lgi3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zpx2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nz73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Q7j2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_B6j2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kaf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ldf3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zfh3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nox2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_V883z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Llq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ka83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rr83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ll83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rdg3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G0w2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zb83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Po83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G6d3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H783z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_M1j2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Yzi2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kyi2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sg83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jw73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ft83z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Po73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_R283z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_O0o2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xeo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gdo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Rr73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qzq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_C183z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ll73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gci2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uu73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cqo2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wqd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wce3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qdj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z7i2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_An73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ft73z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Igi2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pdi2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aii3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_X9n2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_G8n2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dks2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bus2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fed3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nnc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tqc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Axm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mis2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kss2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pcd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jsc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Usl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vgs2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tqs2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_T7d3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kkb3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Gcb3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Azs2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jxs2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Svs2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tib3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pab3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cps2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lns2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uls2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qrp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aqp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uqi2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bmb3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Xdb3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H8l2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Q6l2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Z4l2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bjd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lhd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zad3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J9d3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Adt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mbt2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_C3w2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_D4g3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Wxp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Nen2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vve3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mcc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Bec3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Dpc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fhc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uic3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Jkc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ylc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_H2f3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Kop2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lz93z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Lee3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Thm2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_U5x2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Pet2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_L8t2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ffj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ark2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Sgj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_I6w2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Aok2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Fij2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Qfc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ztc3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Y9t2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vaw2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_R0t2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ffs2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Mjl2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Vfd3z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Trq2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Uaj2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Cam2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tdp2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Idk2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Tki2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Zei2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_J6i2z4_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_J6i2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Rni2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Fpi2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Uqi2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Xti2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Kyi2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_X2j2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Glj2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Koj2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_D7k2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Svk2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Z4l2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Fzl2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_L8m2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Bdm2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_O0o2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Vgs2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Tqs2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_R0t2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Cgt2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Lpu2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Ehz2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Yd03z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Sa13z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Bk23z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Kt33z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_T253z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Cc63z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Ll73z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_T7d3z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_B1a3z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_clk_gate_Ydw2z4_reg]            \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells u_logic_Ypi3z4_reg]                     \
pwr_cg_non_gating_group 0
set_attribute -type integer [get_cells u_logic_V3o2z4_reg]                     \
pwr_cg_non_gating_group 107
set_attribute -type integer [get_cells u_logic_Ipn2z4_reg]                     \
pwr_cg_non_gating_group 108
set_attribute -type integer [get_cells u_logic_Qnn2z4_reg]                     \
pwr_cg_non_gating_group 109
set_attribute -type integer [get_cells u_logic_Rym2z4_reg]                     \
pwr_cg_non_gating_group 110
set_attribute -type integer [get_cells u_logic_Q4h3z4_reg]                     \
pwr_cg_non_gating_group 5
set_attribute -type integer [get_cells u_logic_Lul2z4_reg]                     \
pwr_cg_non_gating_group 115
set_attribute -type integer [get_cells u_logic_I6h3z4_reg]                     \
pwr_cg_non_gating_group 4
set_attribute -type integer [get_cells u_logic_Wuq2z4_reg]                     \
pwr_cg_non_gating_group 93
set_attribute -type integer [get_cells u_logic_Etq2z4_reg]                     \
pwr_cg_non_gating_group 94
set_attribute -type integer [get_cells u_logic_Oar2z4_reg]                     \
pwr_cg_non_gating_group 91
set_attribute -type integer [get_cells u_logic_W8r2z4_reg]                     \
pwr_cg_non_gating_group 92
set_attribute -type integer [get_cells u_logic_Ble3z4_reg]                     \
pwr_cg_non_gating_group 15
set_attribute -type integer [get_cells u_logic_Jje3z4_reg]                     \
pwr_cg_non_gating_group 16
set_attribute -type integer [get_cells u_logic_T8f3z4_reg]                     \
pwr_cg_non_gating_group 10
set_attribute -type integer [get_cells u_logic_C7f3z4_reg]                     \
pwr_cg_non_gating_group 11
set_attribute -type integer [get_cells u_logic_X0c3z4_reg]                     \
pwr_cg_non_gating_group 28
set_attribute -type integer [get_cells u_logic_Gzb3z4_reg]                     \
pwr_cg_non_gating_group 29
set_attribute -type integer [get_cells u_logic_Q0f3z4_reg]                     \
pwr_cg_non_gating_group 12
set_attribute -type integer [get_cells u_logic_N7c3z4_reg]                     \
pwr_cg_non_gating_group 24
set_attribute -type integer [get_cells u_logic_W5c3z4_reg]                     \
pwr_cg_non_gating_group 25
set_attribute -type integer [get_cells u_logic_Rnb3z4_reg]                     \
pwr_cg_non_gating_group 36
set_attribute -type integer [get_cells u_logic_F4c3z4_reg]                     \
pwr_cg_non_gating_group 26
set_attribute -type integer [get_cells u_logic_O2c3z4_reg]                     \
pwr_cg_non_gating_group 27
set_attribute -type integer [get_cells u_logic_Pxb3z4_reg]                     \
pwr_cg_non_gating_group 30
set_attribute -type integer [get_cells u_logic_Yvb3z4_reg]                     \
pwr_cg_non_gating_group 31
set_attribute -type integer [get_cells u_logic_Vac3z4_reg]                     \
pwr_cg_non_gating_group 22
set_attribute -type integer [get_cells u_logic_E9c3z4_reg]                     \
pwr_cg_non_gating_group 23
set_attribute -type integer [get_cells u_logic_Hub3z4_reg]                     \
pwr_cg_non_gating_group 32
set_attribute -type integer [get_cells u_logic_Qsb3z4_reg]                     \
pwr_cg_non_gating_group 33
set_attribute -type integer [get_cells u_logic_Zqb3z4_reg]                     \
pwr_cg_non_gating_group 34
set_attribute -type integer [get_cells u_logic_Mvi2z4_reg]                     \
pwr_cg_non_gating_group 136
set_attribute -type integer [get_cells u_logic_Jhy2z4_reg]                     \
pwr_cg_non_gating_group 56
set_attribute -type integer [get_cells u_logic_Nsk2z4_reg]                     \
pwr_cg_non_gating_group 122
set_attribute -type integer [get_cells u_logic_Emi2z4_reg]                     \
pwr_cg_non_gating_group 137
set_attribute -type integer [get_cells u_logic_U7w2z4_reg]                     \
pwr_cg_non_gating_group 79
set_attribute -type integer [get_cells u_logic_Npk2z4_reg]                     \
pwr_cg_non_gating_group 123
set_attribute -type integer [get_cells u_logic_Ipb3z4_reg]                     \
pwr_cg_non_gating_group 35
set_attribute -type integer [get_cells u_logic_Y9l2z4_reg]                     \
pwr_cg_non_gating_group 116
set_attribute -type integer [get_cells u_logic_Gxk2z4_reg]                     \
pwr_cg_non_gating_group 121
set_attribute -type integer [get_cells u_logic_Nbm2z4_reg]                     \
pwr_cg_non_gating_group 112
set_attribute -type integer [get_cells u_logic_Uyv2z4_reg]                     \
pwr_cg_non_gating_group 83
set_attribute -type integer [get_cells u_logic_Ywi2z4_reg]                     \
pwr_cg_non_gating_group 135
set_attribute -type integer [get_cells u_logic_A4t2z4_reg]                     \
pwr_cg_non_gating_group 86
set_attribute -type integer [get_cells u_logic_Hzj2z4_reg]                     \
pwr_cg_non_gating_group 128
set_attribute -type integer [get_cells u_logic_K3l2z4_reg]                     \
pwr_cg_non_gating_group 117
set_attribute -type integer [get_cells u_logic_Wbk2z4_reg]                     \
pwr_cg_non_gating_group 125
set_attribute -type integer [get_cells u_logic_Gji2z4_reg]                     \
pwr_cg_non_gating_group 138
set_register_merging [get_cells u_logic_S5b3z4_reg] 17
set_register_merging [get_cells u_logic_Tna3z4_reg] 17
set_register_merging [get_cells u_logic_P2a3z4_reg] 17
set_register_merging [get_cells u_logic_B1a3z4_reg] 17
set_register_merging [get_cells u_logic_Y6t2z4_reg] 17
set_register_merging [get_cells u_logic_S4w2z4_reg] 17
set_register_merging [get_cells u_logic_Jcw2z4_reg] 17
set_register_merging [get_cells u_logic_V1l2z4_reg] 17
set_register_merging [get_cells u_logic_Rbi3z4_reg] 17
set_register_merging [get_cells u_logic_Rhi2z4_reg] 17
set_register_merging [get_cells u_logic_Omk2z4_reg] 17
set_register_merging [get_cells u_logic_J0l2z4_reg] 17
set_register_merging [get_cells u_logic_Ohh3z4_reg] 17
set_register_merging [get_cells u_logic_Jux2z4_reg] 17
set_register_merging [get_cells u_logic_Ogo2z4_reg] 17
set_register_merging [get_cells u_logic_Ieh3z4_reg] 17
set_register_merging [get_cells u_logic_Ddi3z4_reg] 17
set_register_merging [get_cells u_logic_Cma3z4_reg] 17
set_register_merging [get_cells u_logic_Hak2z4_reg] 17
set_register_merging [get_cells u_logic_S3i3z4_reg] 17
set_register_merging [get_cells u_logic_B2i3z4_reg] 17
set_register_merging [get_cells u_logic_Xyn2z4_reg] 17
set_register_merging [get_cells u_logic_Od83z4_reg] 17
set_register_merging [get_cells u_logic_F473z4_reg] 17
set_register_merging [get_cells u_logic_Wu53z4_reg] 17
set_register_merging [get_cells u_logic_Nl43z4_reg] 17
set_register_merging [get_cells u_logic_Ec33z4_reg] 17
set_register_merging [get_cells u_logic_V223z4_reg] 17
set_register_merging [get_cells u_logic_Ey03z4_reg] 17
set_register_merging [get_cells u_logic_K103z4_reg] 17
set_register_merging [get_cells u_logic_Ohv2z4_reg] 17
set_register_merging [get_cells u_logic_F8u2z4_reg] 17
set_register_merging [get_cells u_logic_Ixn2z4_reg] 17
set_register_merging [get_cells u_logic_Arn2z4_reg] 17
set_register_merging [get_cells u_logic_Psn2z4_reg] 17
set_register_merging [get_cells u_logic_Tvn2z4_reg] 17
set_register_merging [get_cells u_logic_Fi93z4_reg] 17
set_register_merging [get_cells u_logic_Eun2z4_reg] 17
set_register_merging [get_cells u_logic_Jpa3z4_reg] 17
set_register_merging [get_cells u_logic_L8m2z4_reg] 17
set_register_merging [get_cells u_logic_Z2h3z4_reg] 17
set_register_merging [get_cells u_logic_I1h3z4_reg] 17
set_register_merging [get_cells u_logic_Tzg3z4_reg] 17
set_register_merging [get_cells u_logic_L7p2z4_reg] 17
set_register_merging [get_cells u_logic_W5p2z4_reg] 17
set_register_merging [get_cells u_logic_H4p2z4_reg] 17
set_register_merging [get_cells u_logic_Bnx2z4_reg] 17
set_register_merging [get_cells u_logic_Zva3z4_reg] 17
set_register_merging [get_cells u_logic_C9a3z4_reg] 17
set_register_merging [get_cells u_logic_Rkd3z4_reg] 17
set_register_merging [get_cells u_logic_Gmd3z4_reg] 17
set_register_merging [get_cells u_logic_Rsa3z4_reg] 17
set_register_merging [get_cells u_logic_U5a3z4_reg] 17
set_register_merging [get_cells u_logic_Ara3z4_reg] 17
set_register_merging [get_cells u_logic_D4a3z4_reg] 17
set_register_merging [get_cells u_logic_Ym93z4_reg] 17
set_register_merging [get_cells u_logic_Y8q2z4_reg] 17
set_register_merging [get_cells u_logic_J7q2z4_reg] 17
set_register_merging [get_cells u_logic_Hi83z4_reg] 17
set_register_merging [get_cells u_logic_Y873z4_reg] 17
set_register_merging [get_cells u_logic_Pz53z4_reg] 17
set_register_merging [get_cells u_logic_Gq43z4_reg] 17
set_register_merging [get_cells u_logic_Xg33z4_reg] 17
set_register_merging [get_cells u_logic_O723z4_reg] 17
set_register_merging [get_cells u_logic_X213z4_reg] 17
set_register_merging [get_cells u_logic_D603z4_reg] 17
set_register_merging [get_cells u_logic_Hmv2z4_reg] 17
set_register_merging [get_cells u_logic_Ycu2z4_reg] 17
set_register_merging [get_cells u_logic_U5q2z4_reg] 17
set_register_merging [get_cells u_logic_Mzp2z4_reg] 17
set_register_merging [get_cells u_logic_B1q2z4_reg] 17
set_register_merging [get_cells u_logic_F4q2z4_reg] 17
set_register_merging [get_cells u_logic_No93z4_reg] 17
set_register_merging [get_cells u_logic_Q2q2z4_reg] 17
set_register_merging [get_cells u_logic_Rix2z4_reg] 17
set_register_merging [get_cells u_logic_K7g3z4_reg] 17
set_register_merging [get_cells u_logic_T5g3z4_reg] 17
set_register_merging [get_cells u_logic_M5f3z4_reg] 17
set_register_merging [get_cells u_logic_W3f3z4_reg] 17
set_register_merging [get_cells u_logic_Aze3z4_reg] 17
set_register_merging [get_cells u_logic_Kxe3z4_reg] 17
set_register_merging [get_cells u_logic_She3z4_reg] 17
set_register_merging [get_cells u_logic_Bge3z4_reg] 17
set_register_merging [get_cells u_logic_Dhb3z4_reg] 17
set_register_merging [get_cells u_logic_Nfb3z4_reg] 17
set_register_merging [get_cells u_logic_Z8b3z4_reg] 17
set_register_merging [get_cells u_logic_J7b3z4_reg] 17
set_register_merging [get_cells u_logic_Qxa3z4_reg] 17
set_register_merging [get_cells u_logic_Mka3z4_reg] 17
set_register_merging [get_cells u_logic_W0b3z4_reg] 17
set_register_merging [get_cells u_logic_Wia3z4_reg] 17
set_register_merging [get_cells u_logic_M2b3z4_reg] 17
set_register_merging [get_cells u_logic_Gha3z4_reg] 17
set_register_merging [get_cells u_logic_C4b3z4_reg] 17
set_register_merging [get_cells u_logic_Qfa3z4_reg] 17
set_register_merging [get_cells u_logic_F2o2z4_reg] 17
set_register_merging [get_cells u_logic_Aea3z4_reg] 17
set_register_merging [get_cells u_logic_Uei3z4_reg] 17
set_register_merging [get_cells u_logic_Jca3z4_reg] 17
set_register_merging [get_cells u_logic_Gza3z4_reg] 17
set_register_merging [get_cells u_logic_Taa3z4_reg] 17
set_register_merging [get_cells u_logic_Iua3z4_reg] 17
set_register_merging [get_cells u_logic_L7a3z4_reg] 17
set_register_merging [get_cells u_logic_Slr2z4_reg] 17
set_register_merging [get_cells u_logic_Wj83z4_reg] 17
set_register_merging [get_cells u_logic_Na73z4_reg] 17
set_register_merging [get_cells u_logic_E163z4_reg] 17
set_register_merging [get_cells u_logic_Vr43z4_reg] 17
set_register_merging [get_cells u_logic_Mi33z4_reg] 17
set_register_merging [get_cells u_logic_D923z4_reg] 17
set_register_merging [get_cells u_logic_Kzf3z4_reg] 17
set_register_merging [get_cells u_logic_Vxf3z4_reg] 17
set_register_merging [get_cells u_logic_Wnv2z4_reg] 17
set_register_merging [get_cells u_logic_Neu2z4_reg] 17
set_register_merging [get_cells u_logic_O2g3z4_reg] 17
set_register_merging [get_cells u_logic_Hnr2z4_reg] 17
set_register_merging [get_cells u_logic_Wor2z4_reg] 17
set_register_merging [get_cells u_logic_Z0g3z4_reg] 17
set_register_merging [get_cells u_logic_Cq93z4_reg] 17
set_register_merging [get_cells u_logic_Lqr2z4_reg] 17
set_register_merging [get_cells u_logic_Tme3z4_reg] 17
set_register_merging [get_cells u_logic_Zjq2z4_reg] 17
set_register_merging [get_cells u_logic_Dkx2z4_reg] 17
set_register_merging [get_cells u_logic_Plx2z4_reg] 17
set_register_merging [get_cells u_logic_Foe3z4_reg] 17
set_register_merging [get_cells u_logic_B9g3z4_reg] 17
set_register_merging [get_cells u_logic_Dq73z4_reg] 17
set_register_merging [get_cells u_logic_Ug63z4_reg] 17
set_register_merging [get_cells u_logic_L753z4_reg] 17
set_register_merging [get_cells u_logic_Cy33z4_reg] 17
set_register_merging [get_cells u_logic_To23z4_reg] 17
set_register_merging [get_cells u_logic_Kf13z4_reg] 17
set_register_merging [get_cells u_logic_Qi03z4_reg] 17
set_register_merging [get_cells u_logic_Wlz2z4_reg] 17
set_register_merging [get_cells u_logic_Duu2z4_reg] 17
set_register_merging [get_cells u_logic_Ukt2z4_reg] 17
set_register_merging [get_cells u_logic_Fwj2z4_reg] 17
set_register_merging [get_cells u_logic_Dtj2z4_reg] 17
set_register_merging [get_cells u_logic_Txj2z4_reg] 17
set_register_merging [get_cells u_logic_Ruj2z4_reg] 17
set_register_merging [get_cells u_logic_T583z4_reg] 17
set_register_merging [get_cells u_logic_Kw63z4_reg] 17
set_register_merging [get_cells u_logic_Bn53z4_reg] 17
set_register_merging [get_cells u_logic_Sd43z4_reg] 17
set_register_merging [get_cells u_logic_J433z4_reg] 17
set_register_merging [get_cells u_logic_Av13z4_reg] 17
set_register_merging [get_cells u_logic_Nt03z4_reg] 17
set_register_merging [get_cells u_logic_Twz2z4_reg] 17
set_register_merging [get_cells u_logic_T9v2z4_reg] 17
set_register_merging [get_cells u_logic_K0u2z4_reg] 17
set_register_merging [get_cells u_logic_I7r2z4_reg] 17
set_register_merging [get_cells u_logic_E1r2z4_reg] 17
set_register_merging [get_cells u_logic_S2r2z4_reg] 17
set_register_merging [get_cells u_logic_U5r2z4_reg] 17
set_register_merging [get_cells u_logic_Ka93z4_reg] 17
set_register_merging [get_cells u_logic_G4r2z4_reg] 17
set_register_merging [get_cells u_logic_F483z4_reg] 17
set_register_merging [get_cells u_logic_Wu63z4_reg] 17
set_register_merging [get_cells u_logic_Nl53z4_reg] 17
set_register_merging [get_cells u_logic_Ec43z4_reg] 17
set_register_merging [get_cells u_logic_V233z4_reg] 17
set_register_merging [get_cells u_logic_Mt13z4_reg] 17
set_register_merging [get_cells u_logic_Zr03z4_reg] 17
set_register_merging [get_cells u_logic_Fvz2z4_reg] 17
set_register_merging [get_cells u_logic_F8v2z4_reg] 17
set_register_merging [get_cells u_logic_Wyt2z4_reg] 17
set_register_merging [get_cells u_logic_Wmp2z4_reg] 17
set_register_merging [get_cells u_logic_Sgp2z4_reg] 17
set_register_merging [get_cells u_logic_Gip2z4_reg] 17
set_register_merging [get_cells u_logic_Ilp2z4_reg] 17
set_register_merging [get_cells u_logic_W893z4_reg] 17
set_register_merging [get_cells u_logic_Ujp2z4_reg] 17
set_register_merging [get_cells u_logic_Dq83z4_reg] 17
set_register_merging [get_cells u_logic_Ug73z4_reg] 17
set_register_merging [get_cells u_logic_L763z4_reg] 17
set_register_merging [get_cells u_logic_Cy43z4_reg] 17
set_register_merging [get_cells u_logic_To33z4_reg] 17
set_register_merging [get_cells u_logic_Kf23z4_reg] 17
set_register_merging [get_cells u_logic_Fre3z4_reg] 17
set_register_merging [get_cells u_logic_Rpe3z4_reg] 17
set_register_merging [get_cells u_logic_Duv2z4_reg] 17
set_register_merging [get_cells u_logic_Uku2z4_reg] 17
set_register_merging [get_cells u_logic_Hue3z4_reg] 17
set_register_merging [get_cells u_logic_U2s2z4_reg] 17
set_register_merging [get_cells u_logic_I4s2z4_reg] 17
set_register_merging [get_cells u_logic_Tse3z4_reg] 17
set_register_merging [get_cells u_logic_Cxc3z4_reg] 17
set_register_merging [get_cells u_logic_W5s2z4_reg] 17
set_register_merging [get_cells u_logic_G1s2z4_reg] 17
set_register_merging [get_cells u_logic_Szr2z4_reg] 17
set_register_merging [get_cells u_logic_I793z4_reg] 17
set_register_merging [get_cells u_logic_U593z4_reg] 17
set_register_merging [get_cells u_logic_Efp2z4_reg] 17
set_register_merging [get_cells u_logic_Ovc3z4_reg] 17
set_register_merging [get_cells u_logic_Xx93z4_reg] 17
set_register_merging [get_cells u_logic_Jw93z4_reg] 17
set_register_merging [get_cells u_logic_U4z2z4_reg] 17
set_register_merging [get_cells u_logic_Iwp2z4_reg] 17
set_register_merging [get_cells u_logic_Dkr2z4_reg] 17
set_register_merging [get_cells u_logic_Uup2z4_reg] 17
set_register_merging [get_cells u_logic_Zcn2z4_reg] 17
set_register_merging [get_cells u_logic_Fzl2z4_reg] 17
set_register_merging [get_cells u_logic_Nag3z4_reg] 17
set_register_merging [get_cells u_logic_Wbf3z4_reg] 17
set_register_merging [get_cells u_logic_Snd3z4_reg] 17
set_register_merging [get_cells u_logic_E0d3z4_reg] 17
set_register_merging [get_cells u_logic_Qyc3z4_reg] 17
set_register_merging [get_cells u_logic_Vu93z4_reg] 17
set_register_merging [get_cells u_logic_Gt93z4_reg] 17
set_register_merging [get_cells u_logic_Rr93z4_reg] 17
set_register_merging [get_cells u_logic_Jl93z4_reg] 17
set_register_merging [get_cells u_logic_Uj93z4_reg] 17
set_register_merging [get_cells u_logic_Qg93z4_reg] 17
set_register_merging [get_cells u_logic_Bf93z4_reg] 17
set_register_merging [get_cells u_logic_Md93z4_reg] 17
set_register_merging [get_cells u_logic_Yb93z4_reg] 17
set_register_merging [get_cells u_logic_G493z4_reg] 17
set_register_merging [get_cells u_logic_R293z4_reg] 17
set_register_merging [get_cells u_logic_C193z4_reg] 17
set_register_merging [get_cells u_logic_Nz83z4_reg] 17
set_register_merging [get_cells u_logic_Yx83z4_reg] 17
set_register_merging [get_cells u_logic_Jw83z4_reg] 17
set_register_merging [get_cells u_logic_Uu83z4_reg] 17
set_register_merging [get_cells u_logic_Unm2z4_reg] 17
set_register_merging [get_cells u_logic_Grl2z4_reg] 17
set_register_merging [get_cells u_logic_Zkk2z4_reg] 17
set_register_merging [get_cells u_logic_Xti2z4_reg] 17
set_register_merging [get_cells u_logic_Dng3z4_reg] 17
set_register_merging [get_cells u_logic_Xmf3z4_reg] 17
set_register_merging [get_cells u_logic_I0e3z4_reg] 17
set_register_merging [get_cells u_logic_Fxv2z4_reg] 17
set_register_merging [get_cells u_logic_Rvv2z4_reg] 17
set_register_merging [get_cells u_logic_Psv2z4_reg] 17
set_register_merging [get_cells u_logic_Arv2z4_reg] 17
set_register_merging [get_cells u_logic_Lpv2z4_reg] 17
set_register_merging [get_cells u_logic_Skv2z4_reg] 17
set_register_merging [get_cells u_logic_Djv2z4_reg] 17
set_register_merging [get_cells u_logic_Zfv2z4_reg] 17
set_register_merging [get_cells u_logic_Kev2z4_reg] 17
set_register_merging [get_cells u_logic_Vcv2z4_reg] 17
set_register_merging [get_cells u_logic_Hbv2z4_reg] 17
set_register_merging [get_cells u_logic_R6v2z4_reg] 17
set_register_merging [get_cells u_logic_C5v2z4_reg] 17
set_register_merging [get_cells u_logic_N3v2z4_reg] 17
set_register_merging [get_cells u_logic_Y1v2z4_reg] 17
set_register_merging [get_cells u_logic_J0v2z4_reg] 17
set_register_merging [get_cells u_logic_Uyu2z4_reg] 17
set_register_merging [get_cells u_logic_Fxu2z4_reg] 17
set_register_merging [get_cells u_logic_Rvu2z4_reg] 17
set_register_merging [get_cells u_logic_Psu2z4_reg] 17
set_register_merging [get_cells u_logic_Aru2z4_reg] 17
set_register_merging [get_cells u_logic_Lpu2z4_reg] 17
set_register_merging [get_cells u_logic_Ccg3z4_reg] 17
set_register_merging [get_cells u_logic_Hpd3z4_reg] 17
set_register_merging [get_cells u_logic_K7s2z4_reg] 17
set_register_merging [get_cells u_logic_Asr2z4_reg] 17
set_register_merging [get_cells u_logic_Gcr2z4_reg] 17
set_register_merging [get_cells u_logic_Anq2z4_reg] 17
set_register_merging [get_cells u_logic_Gfq2z4_reg] 17
set_register_merging [get_cells u_logic_Naq2z4_reg] 17
set_register_merging [get_cells u_logic_A9p2z4_reg] 17
set_register_merging [get_cells u_logic_Kwo2z4_reg] 17
set_register_merging [get_cells u_logic_Rro2z4_reg] 17
set_register_merging [get_cells u_logic_Fio2z4_reg] 17
set_register_merging [get_cells u_logic_J5o2z4_reg] 17
set_register_merging [get_cells u_logic_Yfn2z4_reg] 17
set_register_merging [get_cells u_logic_J0n2z4_reg] 17
set_register_merging [get_cells u_logic_Ipm2z4_reg] 17
set_register_merging [get_cells u_logic_Gmm2z4_reg] 17
set_register_merging [get_cells u_logic_T0m2z4_reg] 17
set_register_merging [get_cells u_logic_Spl2z4_reg] 17
set_register_merging [get_cells u_logic_Pbl2z4_reg] 17
set_register_merging [get_cells u_logic_Kjk2z4_reg] 17
set_register_merging [get_cells u_logic_V0k2z4_reg] 17
set_register_merging [get_cells u_logic_Orj2z4_reg] 17
set_register_merging [get_cells u_logic_Zpj2z4_reg] 17
set_register_merging [get_cells u_logic_Koj2z4_reg] 17
set_register_merging [get_cells u_logic_Sog3z4_reg] 17
set_register_merging [get_cells u_logic_Mof3z4_reg] 17
set_register_merging [get_cells u_logic_X1e3z4_reg] 17
set_register_merging [get_cells u_logic_Z8s2z4_reg] 17
set_register_merging [get_cells u_logic_Otr2z4_reg] 17
set_register_merging [get_cells u_logic_Vdr2z4_reg] 17
set_register_merging [get_cells u_logic_Poq2z4_reg] 17
set_register_merging [get_cells u_logic_Vgq2z4_reg] 17
set_register_merging [get_cells u_logic_Ccq2z4_reg] 17
set_register_merging [get_cells u_logic_Pap2z4_reg] 17
set_register_merging [get_cells u_logic_Zxo2z4_reg] 17
set_register_merging [get_cells u_logic_Gto2z4_reg] 17
set_register_merging [get_cells u_logic_Ujo2z4_reg] 17
set_register_merging [get_cells u_logic_Y6o2z4_reg] 17
set_register_merging [get_cells u_logic_Mhn2z4_reg] 17
set_register_merging [get_cells u_logic_Y1n2z4_reg] 17
set_register_merging [get_cells u_logic_Wqm2z4_reg] 17
set_register_merging [get_cells u_logic_Ejm2z4_reg] 17
set_register_merging [get_cells u_logic_H2m2z4_reg] 17
set_register_merging [get_cells u_logic_Qml2z4_reg] 17
set_register_merging [get_cells u_logic_Edl2z4_reg] 17
set_register_merging [get_cells u_logic_Ggk2z4_reg] 17
set_register_merging [get_cells u_logic_K2k2z4_reg] 17
set_register_merging [get_cells u_logic_Vmj2z4_reg] 17
set_register_merging [get_cells u_logic_Glj2z4_reg] 17
set_register_merging [get_cells u_logic_Kig3z4_reg] 17
set_register_merging [get_cells u_logic_Eif3z4_reg] 17
set_register_merging [get_cells u_logic_Pvd3z4_reg] 17
set_register_merging [get_cells u_logic_E153z4_reg] 17
set_register_merging [get_cells u_logic_Qz43z4_reg] 17
set_register_merging [get_cells u_logic_Ow43z4_reg] 17
set_register_merging [get_cells u_logic_Zu43z4_reg] 17
set_register_merging [get_cells u_logic_Kt43z4_reg] 17
set_register_merging [get_cells u_logic_Ro43z4_reg] 17
set_register_merging [get_cells u_logic_Cn43z4_reg] 17
set_register_merging [get_cells u_logic_Yj43z4_reg] 17
set_register_merging [get_cells u_logic_Ji43z4_reg] 17
set_register_merging [get_cells u_logic_Ug43z4_reg] 17
set_register_merging [get_cells u_logic_Gf43z4_reg] 17
set_register_merging [get_cells u_logic_Qa43z4_reg] 17
set_register_merging [get_cells u_logic_B943z4_reg] 17
set_register_merging [get_cells u_logic_M743z4_reg] 17
set_register_merging [get_cells u_logic_X543z4_reg] 17
set_register_merging [get_cells u_logic_I443z4_reg] 17
set_register_merging [get_cells u_logic_T243z4_reg] 17
set_register_merging [get_cells u_logic_E143z4_reg] 17
set_register_merging [get_cells u_logic_Qz33z4_reg] 17
set_register_merging [get_cells u_logic_Ow33z4_reg] 17
set_register_merging [get_cells u_logic_Zu33z4_reg] 17
set_register_merging [get_cells u_logic_Kt33z4_reg] 17
set_register_merging [get_cells u_logic_Joi3z4_reg] 17
set_register_merging [get_cells u_logic_Cai3z4_reg] 17
set_register_merging [get_cells u_logic_M0i3z4_reg] 17
set_register_merging [get_cells u_logic_Euh3z4_reg] 17
set_register_merging [get_cells u_logic_Wnh3z4_reg] 17
set_register_merging [get_cells u_logic_Tch3z4_reg] 17
set_register_merging [get_cells u_logic_Eyg3z4_reg] 17
set_register_merging [get_cells u_logic_Uuf3z4_reg] 17
set_register_merging [get_cells u_logic_Ibe3z4_reg] 17
set_register_merging [get_cells u_logic_Pfz2z4_reg] 17
set_register_merging [get_cells u_logic_Aez2z4_reg] 17
set_register_merging [get_cells u_logic_Mcz2z4_reg] 17
set_register_merging [get_cells u_logic_Rds2z4_reg] 17
set_register_merging [get_cells u_logic_Eyr2z4_reg] 17
set_register_merging [get_cells u_logic_Oir2z4_reg] 17
set_register_merging [get_cells u_logic_S2p2z4_reg] 17
set_register_merging [get_cells u_logic_Noo2z4_reg] 17
set_register_merging [get_cells u_logic_Rbo2z4_reg] 17
set_register_merging [get_cells u_logic_Cmn2z4_reg] 17
set_register_merging [get_cells u_logic_R6n2z4_reg] 17
set_register_merging [get_cells u_logic_Mvm2z4_reg] 17
set_register_merging [get_cells u_logic_X6m2z4_reg] 17
set_register_merging [get_cells u_logic_Xhl2z4_reg] 17
set_register_merging [get_cells u_logic_D7k2z4_reg] 17
set_register_merging [get_cells u_logic_Umi3z4_reg] 17
set_register_merging [get_cells u_logic_N8i3z4_reg] 17
set_register_merging [get_cells u_logic_Xyh3z4_reg] 17
set_register_merging [get_cells u_logic_Psh3z4_reg] 17
set_register_merging [get_cells u_logic_Hmh3z4_reg] 17
set_register_merging [get_cells u_logic_Ebh3z4_reg] 17
set_register_merging [get_cells u_logic_Pwg3z4_reg] 17
set_register_merging [get_cells u_logic_U9e3z4_reg] 17
set_register_merging [get_cells u_logic_Dcs2z4_reg] 17
set_register_merging [get_cells u_logic_Qwr2z4_reg] 17
set_register_merging [get_cells u_logic_Zgr2z4_reg] 17
set_register_merging [get_cells u_logic_D1p2z4_reg] 17
set_register_merging [get_cells u_logic_Ymo2z4_reg] 17
set_register_merging [get_cells u_logic_Cao2z4_reg] 17
set_register_merging [get_cells u_logic_Okn2z4_reg] 17
set_register_merging [get_cells u_logic_C5n2z4_reg] 17
set_register_merging [get_cells u_logic_Ytm2z4_reg] 17
set_register_merging [get_cells u_logic_J5m2z4_reg] 17
set_register_merging [get_cells u_logic_Cll2z4_reg] 17
set_register_merging [get_cells u_logic_Igl2z4_reg] 17
set_register_merging [get_cells u_logic_Rek2z4_reg] 17
set_register_merging [get_cells u_logic_O5k2z4_reg] 17
set_register_merging [get_cells u_logic_M4j2z4_reg] 17
set_register_merging [get_cells u_logic_X2j2z4_reg] 17
set_register_merging [get_cells u_logic_Vgg3z4_reg] 17
set_register_merging [get_cells u_logic_Pgf3z4_reg] 17
set_register_merging [get_cells u_logic_Aud3z4_reg] 17
set_register_merging [get_cells u_logic_Na63z4_reg] 17
set_register_merging [get_cells u_logic_Z863z4_reg] 17
set_register_merging [get_cells u_logic_X563z4_reg] 17
set_register_merging [get_cells u_logic_I463z4_reg] 17
set_register_merging [get_cells u_logic_T263z4_reg] 17
set_register_merging [get_cells u_logic_Ay53z4_reg] 17
set_register_merging [get_cells u_logic_Lw53z4_reg] 17
set_register_merging [get_cells u_logic_Ht53z4_reg] 17
set_register_merging [get_cells u_logic_Sr53z4_reg] 17
set_register_merging [get_cells u_logic_Dq53z4_reg] 17
set_register_merging [get_cells u_logic_Po53z4_reg] 17
set_register_merging [get_cells u_logic_Zj53z4_reg] 17
set_register_merging [get_cells u_logic_Ki53z4_reg] 17
set_register_merging [get_cells u_logic_Vg53z4_reg] 17
set_register_merging [get_cells u_logic_Gf53z4_reg] 17
set_register_merging [get_cells u_logic_Rd53z4_reg] 17
set_register_merging [get_cells u_logic_Cc53z4_reg] 17
set_register_merging [get_cells u_logic_Na53z4_reg] 17
set_register_merging [get_cells u_logic_Z853z4_reg] 17
set_register_merging [get_cells u_logic_X553z4_reg] 17
set_register_merging [get_cells u_logic_I453z4_reg] 17
set_register_merging [get_cells u_logic_T253z4_reg] 17
set_register_merging [get_cells u_logic_Qji3z4_reg] 17
set_register_merging [get_cells u_logic_J5i3z4_reg] 17
set_register_merging [get_cells u_logic_Tvh3z4_reg] 17
set_register_merging [get_cells u_logic_Lph3z4_reg] 17
set_register_merging [get_cells u_logic_Djh3z4_reg] 17
set_register_merging [get_cells u_logic_A8h3z4_reg] 17
set_register_merging [get_cells u_logic_Ltg3z4_reg] 17
set_register_merging [get_cells u_logic_Qrf3z4_reg] 17
set_register_merging [get_cells u_logic_Q6e3z4_reg] 17
set_register_merging [get_cells u_logic_Kc03z4_reg] 17
set_register_merging [get_cells u_logic_Wa03z4_reg] 17
set_register_merging [get_cells u_logic_H903z4_reg] 17
set_register_merging [get_cells u_logic_S703z4_reg] 17
set_register_merging [get_cells u_logic_O403z4_reg] 17
set_register_merging [get_cells u_logic_Z203z4_reg] 17
set_register_merging [get_cells u_logic_Vzz2z4_reg] 17
set_register_merging [get_cells u_logic_Hyz2z4_reg] 17
set_register_merging [get_cells u_logic_Rtz2z4_reg] 17
set_register_merging [get_cells u_logic_Csz2z4_reg] 17
set_register_merging [get_cells u_logic_Nqz2z4_reg] 17
set_register_merging [get_cells u_logic_Yoz2z4_reg] 17
set_register_merging [get_cells u_logic_Knz2z4_reg] 17
set_register_merging [get_cells u_logic_Ikz2z4_reg] 17
set_register_merging [get_cells u_logic_Tiz2z4_reg] 17
set_register_merging [get_cells u_logic_Ehz2z4_reg] 17
set_register_merging [get_cells u_logic_Gfg3z4_reg] 17
set_register_merging [get_cells u_logic_Aff3z4_reg] 17
set_register_merging [get_cells u_logic_Lsd3z4_reg] 17
set_register_merging [get_cells u_logic_Wj73z4_reg] 17
set_register_merging [get_cells u_logic_Ii73z4_reg] 17
set_register_merging [get_cells u_logic_Gf73z4_reg] 17
set_register_merging [get_cells u_logic_Rd73z4_reg] 17
set_register_merging [get_cells u_logic_Cc73z4_reg] 17
set_register_merging [get_cells u_logic_J773z4_reg] 17
set_register_merging [get_cells u_logic_U573z4_reg] 17
set_register_merging [get_cells u_logic_Q273z4_reg] 17
set_register_merging [get_cells u_logic_B173z4_reg] 17
set_register_merging [get_cells u_logic_Mz63z4_reg] 17
set_register_merging [get_cells u_logic_Yx63z4_reg] 17
set_register_merging [get_cells u_logic_It63z4_reg] 17
set_register_merging [get_cells u_logic_Tr63z4_reg] 17
set_register_merging [get_cells u_logic_Eq63z4_reg] 17
set_register_merging [get_cells u_logic_Po63z4_reg] 17
set_register_merging [get_cells u_logic_An63z4_reg] 17
set_register_merging [get_cells u_logic_Ll63z4_reg] 17
set_register_merging [get_cells u_logic_Wj63z4_reg] 17
set_register_merging [get_cells u_logic_Ii63z4_reg] 17
set_register_merging [get_cells u_logic_Gf63z4_reg] 17
set_register_merging [get_cells u_logic_Rd63z4_reg] 17
set_register_merging [get_cells u_logic_Cc63z4_reg] 17
set_register_merging [get_cells u_logic_Hqg3z4_reg] 17
set_register_merging [get_cells u_logic_Bqf3z4_reg] 17
set_register_merging [get_cells u_logic_M3e3z4_reg] 17
set_register_merging [get_cells u_logic_Wnu2z4_reg] 17
set_register_merging [get_cells u_logic_Imu2z4_reg] 17
set_register_merging [get_cells u_logic_Gju2z4_reg] 17
set_register_merging [get_cells u_logic_Rhu2z4_reg] 17
set_register_merging [get_cells u_logic_Cgu2z4_reg] 17
set_register_merging [get_cells u_logic_Jbu2z4_reg] 17
set_register_merging [get_cells u_logic_U9u2z4_reg] 17
set_register_merging [get_cells u_logic_Q6u2z4_reg] 17
set_register_merging [get_cells u_logic_B5u2z4_reg] 17
set_register_merging [get_cells u_logic_M3u2z4_reg] 17
set_register_merging [get_cells u_logic_Y1u2z4_reg] 17
set_register_merging [get_cells u_logic_Ixt2z4_reg] 17
set_register_merging [get_cells u_logic_Tvt2z4_reg] 17
set_register_merging [get_cells u_logic_Eut2z4_reg] 17
set_register_merging [get_cells u_logic_Pst2z4_reg] 17
set_register_merging [get_cells u_logic_Art2z4_reg] 17
set_register_merging [get_cells u_logic_Lpt2z4_reg] 17
set_register_merging [get_cells u_logic_Wnt2z4_reg] 17
set_register_merging [get_cells u_logic_Imt2z4_reg] 17
set_register_merging [get_cells u_logic_Gjt2z4_reg] 17
set_register_merging [get_cells u_logic_Rht2z4_reg] 17
set_register_merging [get_cells u_logic_Cgt2z4_reg] 17
set_register_merging [get_cells u_logic_Wrg3z4_reg] 17
set_register_merging [get_cells u_logic_B5e3z4_reg] 17
set_register_merging [get_cells u_logic_Oas2z4_reg] 17
set_register_merging [get_cells u_logic_Cvr2z4_reg] 17
set_register_merging [get_cells u_logic_Kfr2z4_reg] 17
set_register_merging [get_cells u_logic_Eqq2z4_reg] 17
set_register_merging [get_cells u_logic_Kiq2z4_reg] 17
set_register_merging [get_cells u_logic_Rdq2z4_reg] 17
set_register_merging [get_cells u_logic_Ecp2z4_reg] 17
set_register_merging [get_cells u_logic_Ozo2z4_reg] 17
set_register_merging [get_cells u_logic_Vuo2z4_reg] 17
set_register_merging [get_cells u_logic_Jlo2z4_reg] 17
set_register_merging [get_cells u_logic_N8o2z4_reg] 17
set_register_merging [get_cells u_logic_Ajn2z4_reg] 17
set_register_merging [get_cells u_logic_N3n2z4_reg] 17
set_register_merging [get_cells u_logic_Ksm2z4_reg] 17
set_register_merging [get_cells u_logic_Skm2z4_reg] 17
set_register_merging [get_cells u_logic_V3m2z4_reg] 17
set_register_merging [get_cells u_logic_Eol2z4_reg] 17
set_register_merging [get_cells u_logic_Tel2z4_reg] 17
set_register_merging [get_cells u_logic_Vhk2z4_reg] 17
set_register_merging [get_cells u_logic_Z3k2z4_reg] 17
set_register_merging [get_cells u_logic_F9j2z4_reg] 17
set_register_merging [get_cells u_logic_Isi2z4_reg] 17
set_register_merging [get_cells u_logic_Fpi2z4_reg] 17
set_register_merging [get_cells u_logic_Zjg3z4_reg] 17
set_register_merging [get_cells u_logic_Tjf3z4_reg] 17
set_register_merging [get_cells u_logic_Exd3z4_reg] 17
set_register_merging [get_cells u_logic_Vr33z4_reg] 17
set_register_merging [get_cells u_logic_Hq33z4_reg] 17
set_register_merging [get_cells u_logic_Fn33z4_reg] 17
set_register_merging [get_cells u_logic_Ql33z4_reg] 17
set_register_merging [get_cells u_logic_Bk33z4_reg] 17
set_register_merging [get_cells u_logic_If33z4_reg] 17
set_register_merging [get_cells u_logic_Td33z4_reg] 17
set_register_merging [get_cells u_logic_Pa33z4_reg] 17
set_register_merging [get_cells u_logic_A933z4_reg] 17
set_register_merging [get_cells u_logic_L733z4_reg] 17
set_register_merging [get_cells u_logic_X533z4_reg] 17
set_register_merging [get_cells u_logic_H133z4_reg] 17
set_register_merging [get_cells u_logic_Sz23z4_reg] 17
set_register_merging [get_cells u_logic_Dy23z4_reg] 17
set_register_merging [get_cells u_logic_Ow23z4_reg] 17
set_register_merging [get_cells u_logic_Zu23z4_reg] 17
set_register_merging [get_cells u_logic_Kt23z4_reg] 17
set_register_merging [get_cells u_logic_Vr23z4_reg] 17
set_register_merging [get_cells u_logic_Hq23z4_reg] 17
set_register_merging [get_cells u_logic_Fn23z4_reg] 17
set_register_merging [get_cells u_logic_Ql23z4_reg] 17
set_register_merging [get_cells u_logic_Bk23z4_reg] 17
set_register_merging [get_cells u_logic_Olg3z4_reg] 17
set_register_merging [get_cells u_logic_Ilf3z4_reg] 17
set_register_merging [get_cells u_logic_Tyd3z4_reg] 17
set_register_merging [get_cells u_logic_Mi23z4_reg] 17
set_register_merging [get_cells u_logic_Yg23z4_reg] 17
set_register_merging [get_cells u_logic_Wd23z4_reg] 17
set_register_merging [get_cells u_logic_Hc23z4_reg] 17
set_register_merging [get_cells u_logic_Sa23z4_reg] 17
set_register_merging [get_cells u_logic_Z523z4_reg] 17
set_register_merging [get_cells u_logic_K423z4_reg] 17
set_register_merging [get_cells u_logic_G123z4_reg] 17
set_register_merging [get_cells u_logic_Rz13z4_reg] 17
set_register_merging [get_cells u_logic_Cy13z4_reg] 17
set_register_merging [get_cells u_logic_Ow13z4_reg] 17
set_register_merging [get_cells u_logic_Yr13z4_reg] 17
set_register_merging [get_cells u_logic_Jq13z4_reg] 17
set_register_merging [get_cells u_logic_Uo13z4_reg] 17
set_register_merging [get_cells u_logic_Fn13z4_reg] 17
set_register_merging [get_cells u_logic_Ql13z4_reg] 17
set_register_merging [get_cells u_logic_Bk13z4_reg] 17
set_register_merging [get_cells u_logic_Mi13z4_reg] 17
set_register_merging [get_cells u_logic_Yg13z4_reg] 17
set_register_merging [get_cells u_logic_Wd13z4_reg] 17
set_register_merging [get_cells u_logic_Hc13z4_reg] 17
set_register_merging [get_cells u_logic_Sa13z4_reg] 17
set_register_merging [get_cells u_logic_Fli3z4_reg] 17
set_register_merging [get_cells u_logic_Y6i3z4_reg] 17
set_register_merging [get_cells u_logic_Ixh3z4_reg] 17
set_register_merging [get_cells u_logic_Arh3z4_reg] 17
set_register_merging [get_cells u_logic_Skh3z4_reg] 17
set_register_merging [get_cells u_logic_P9h3z4_reg] 17
set_register_merging [get_cells u_logic_Avg3z4_reg] 17
set_register_merging [get_cells u_logic_Ftf3z4_reg] 17
set_register_merging [get_cells u_logic_F8e3z4_reg] 17
set_register_merging [get_cells u_logic_E913z4_reg] 17
set_register_merging [get_cells u_logic_Q713z4_reg] 17
set_register_merging [get_cells u_logic_B613z4_reg] 17
set_register_merging [get_cells u_logic_M413z4_reg] 17
set_register_merging [get_cells u_logic_I113z4_reg] 17
set_register_merging [get_cells u_logic_Tz03z4_reg] 17
set_register_merging [get_cells u_logic_Pw03z4_reg] 17
set_register_merging [get_cells u_logic_Bv03z4_reg] 17
set_register_merging [get_cells u_logic_Lq03z4_reg] 17
set_register_merging [get_cells u_logic_Wo03z4_reg] 17
set_register_merging [get_cells u_logic_Hn03z4_reg] 17
set_register_merging [get_cells u_logic_Sl03z4_reg] 17
set_register_merging [get_cells u_logic_Ek03z4_reg] 17
set_register_merging [get_cells u_logic_Ch03z4_reg] 17
set_register_merging [get_cells u_logic_Nf03z4_reg] 17
set_register_merging [get_cells u_logic_Yd03z4_reg] 17
set_register_merging [get_cells u_logic_H3d3z4_reg] 17
set_register_merging [get_cells u_logic_T1d3z4_reg] 17
set_register_merging [get_cells u_logic_Yaz2z4_reg] 17
set_register_merging [get_cells u_logic_Svk2z4_reg] 17
set_register_merging [get_cells u_logic_Auk2z4_reg] 17
set_register_merging [get_cells u_logic_K1z2z4_reg] 17
set_register_merging [get_cells u_logic_C3z2z4_reg] 17
set_register_merging [get_cells u_logic_Wzy2z4_reg] 17
set_register_merging [get_cells u_logic_Fgm2z4_reg] 17
set_register_merging [get_cells u_logic_Sjj2z4_reg] 17
set_register_merging [get_cells u_logic_Rni2z4_reg] 17
set_register_merging [get_cells u_logic_Wai2z4_reg] 17
set_register_merging [get_cells u_logic_W7z2z4_reg] 17
set_register_merging [get_cells u_logic_Ufy2z4_reg] 17
set_register_merging [get_cells u_logic_H9i2z4_reg] 17
set_register_merging [get_cells u_logic_Fey2z4_reg] 17
set_register_merging [get_cells u_logic_Hyy2z4_reg] 17
set_register_merging [get_cells u_logic_Qcy2z4_reg] 17
set_register_merging [get_cells u_logic_Swy2z4_reg] 17
set_register_merging [get_cells u_logic_Bby2z4_reg] 17
set_register_merging [get_cells u_logic_Dvy2z4_reg] 17
set_register_merging [get_cells u_logic_M9y2z4_reg] 17
set_register_merging [get_cells u_logic_Pty2z4_reg] 17
set_register_merging [get_cells u_logic_Y7y2z4_reg] 17
set_register_merging [get_cells u_logic_Bsy2z4_reg] 17
set_register_merging [get_cells u_logic_K6y2z4_reg] 17
set_register_merging [get_cells u_logic_Nqy2z4_reg] 17
set_register_merging [get_cells u_logic_W4y2z4_reg] 17
set_register_merging [get_cells u_logic_Zoy2z4_reg] 17
set_register_merging [get_cells u_logic_I3y2z4_reg] 17
set_register_merging [get_cells u_logic_T1y2z4_reg] 17
set_register_merging [get_cells u_logic_Bdm2z4_reg] 17
set_register_merging [get_cells u_logic_Lny2z4_reg] 17
set_register_merging [get_cells u_logic_F0y2z4_reg] 17
set_register_merging [get_cells u_logic_Xly2z4_reg] 17
set_register_merging [get_cells u_logic_Owq2z4_reg] 17
set_register_merging [get_cells u_logic_Jky2z4_reg] 17
set_register_merging [get_cells u_logic_Gtp2z4_reg] 17
set_register_merging [get_cells u_logic_Viy2z4_reg] 17
set_register_merging [get_cells u_logic_Lbn2z4_reg] 17
set_register_merging [get_cells u_logic_Dwl2z4_reg] 17
set_register_merging [get_cells u_logic_Tyx2z4_reg] 17
set_register_merging [get_cells u_logic_Hxx2z4_reg] 17
set_register_merging [get_cells u_logic_Xyk2z4_reg] 17
set_register_merging [get_cells u_logic_J4x2z4_reg] 17
set_register_merging [get_cells u_logic_G7x2z4_reg] 17
set_register_merging [get_cells u_logic_R8x2z4_reg] 17
set_register_merging [get_cells u_logic_Cax2z4_reg] 17
set_register_merging [get_cells u_logic_Nbx2z4_reg] 17
set_register_merging [get_cells u_logic_Ycx2z4_reg] 17
set_register_merging [get_cells u_logic_Jex2z4_reg] 17
set_register_merging [get_cells u_logic_Ufx2z4_reg] 17
set_register_merging [get_cells u_logic_Fhx2z4_reg] 17
set_register_merging [get_cells u_logic_Xsx2z4_reg] 17
set_register_merging [get_cells u_logic_Vvx2z4_reg] 17
set_register_merging [get_cells u_logic_V4d3z4_reg] 17
set_register_merging [get_cells u_logic_Jwf3z4_reg] 17
set_register_merging [get_cells u_logic_O5t2z4_reg] 17
set_register_merging [get_cells u_logic_Rxl2z4_reg] 17
set_register_merging [get_cells u_logic_Fcj2z4_reg] 17
set_register_merging [get_cells u_logic_R1w2z4_reg] 17
set_register_merging [get_cells u_logic_G9w2z4_reg] 17
set_register_merging [get_cells u_logic_K9z2z4_reg] 17
set_register_merging [get_cells u_logic_I6z2z4_reg] 17
set_register_merging [get_cells u_logic_Cyq2z4_reg] 17
set_register_merging [get_cells u_logic_I2t2z4_reg] 17
set_register_merging [get_cells u_logic_Qem2z4_reg] 17
set_register_merging [get_cells u_logic_U2x2z4_reg] 17
set_register_merging [get_cells u_logic_Ydw2z4_reg] 17
set_register_merging [get_cells u_logic_Mfw2z4_reg] 17
set_register_merging [get_cells u_logic_Ahw2z4_reg] 17
set_register_merging [get_cells u_logic_Oiw2z4_reg] 17
set_register_merging [get_cells u_logic_Ckw2z4_reg] 17
set_register_merging [get_cells u_logic_Qlw2z4_reg] 17
set_register_merging [get_cells u_logic_Enw2z4_reg] 17
set_register_merging [get_cells u_logic_Sow2z4_reg] 17
set_register_merging [get_cells u_logic_Gqw2z4_reg] 17
set_register_merging [get_cells u_logic_Urw2z4_reg] 17
set_register_merging [get_cells u_logic_Itw2z4_reg] 17
set_register_merging [get_cells u_logic_Xuw2z4_reg] 17
set_register_merging [get_cells u_logic_Mww2z4_reg] 17
set_register_merging [get_cells u_logic_Byw2z4_reg] 17
set_register_merging [get_cells u_logic_Qzw2z4_reg] 17
set_register_merging [get_cells u_logic_F1x2z4_reg] 17
set_register_merging [get_cells u_logic_An83z4_reg] 17
set_register_merging [get_cells u_logic_Df83z4_reg] 17
set_register_merging [get_cells u_logic_S8k2z4_reg] 17
set_register_merging [get_cells u_logic_Lrx2z4_reg] 17
set_register_merging [get_cells u_logic_Yx73z4_reg] 17
set_register_merging [get_cells u_logic_Lgi3z4_reg] 17
set_register_merging [get_cells u_logic_Zpx2z4_reg] 17
set_register_merging [get_cells u_logic_Nz73z4_reg] 17
set_register_merging [get_cells u_logic_Q7j2z4_reg] 17
set_register_merging [get_cells u_logic_B6j2z4_reg] 17
set_register_merging [get_cells u_logic_Kaf3z4_reg] 17
set_register_merging [get_cells u_logic_Ldf3z4_reg] 17
set_register_merging [get_cells u_logic_Zfh3z4_reg] 17
set_register_merging [get_cells u_logic_Nox2z4_reg] 17
set_register_merging [get_cells u_logic_V883z4_reg] 17
set_register_merging [get_cells u_logic_Llq2z4_reg] 17
set_register_merging [get_cells u_logic_Ka83z4_reg] 17
set_register_merging [get_cells u_logic_Rr83z4_reg] 17
set_register_merging [get_cells u_logic_Ll83z4_reg] 17
set_register_merging [get_cells u_logic_Rdg3z4_reg] 17
set_register_merging [get_cells u_logic_G0w2z4_reg] 17
set_register_merging [get_cells u_logic_Zb83z4_reg] 17
set_register_merging [get_cells u_logic_Po83z4_reg] 17
set_register_merging [get_cells u_logic_G6d3z4_reg] 17
set_register_merging [get_cells u_logic_H783z4_reg] 17
set_register_merging [get_cells u_logic_M1j2z4_reg] 17
set_register_merging [get_cells u_logic_Yzi2z4_reg] 17
set_register_merging [get_cells u_logic_Kyi2z4_reg] 17
set_register_merging [get_cells u_logic_Sg83z4_reg] 17
set_register_merging [get_cells u_logic_Jw73z4_reg] 17
set_register_merging [get_cells u_logic_Ft83z4_reg] 17
set_register_merging [get_cells u_logic_Po73z4_reg] 17
set_register_merging [get_cells u_logic_R283z4_reg] 17
set_register_merging [get_cells u_logic_O0o2z4_reg] 17
set_register_merging [get_cells u_logic_Xeo2z4_reg] 17
set_register_merging [get_cells u_logic_Gdo2z4_reg] 17
set_register_merging [get_cells u_logic_Rr73z4_reg] 17
set_register_merging [get_cells u_logic_Qzq2z4_reg] 17
set_register_merging [get_cells u_logic_C183z4_reg] 17
set_register_merging [get_cells u_logic_Ll73z4_reg] 17
set_register_merging [get_cells u_logic_Gci2z4_reg] 17
set_register_merging [get_cells u_logic_Uu73z4_reg] 17
set_register_merging [get_cells u_logic_Cqo2z4_reg] 17
set_register_merging [get_cells u_logic_Wqd3z4_reg] 17
set_register_merging [get_cells u_logic_Wce3z4_reg] 17
set_register_merging [get_cells u_logic_Qdj2z4_reg] 17
set_register_merging [get_cells u_logic_Z7i2z4_reg] 17
set_register_merging [get_cells u_logic_An73z4_reg] 17
set_register_merging [get_cells u_logic_Ft73z4_reg] 17
set_register_merging [get_cells u_logic_Igi2z4_reg] 17
set_register_merging [get_cells u_logic_Pdi2z4_reg] 17
set_register_merging [get_cells u_logic_Aii3z4_reg] 17
set_register_merging [get_cells u_logic_Ypi3z4_reg] 17
set_register_merging [get_cells u_logic_V3o2z4_reg] 17
set_register_merging [get_cells u_logic_X9n2z4_reg] 17
set_register_merging [get_cells u_logic_G8n2z4_reg] 17
set_register_merging [get_cells u_logic_Dks2z4_reg] 17
set_register_merging [get_cells u_logic_Bus2z4_reg] 17
set_register_merging [get_cells u_logic_Fed3z4_reg] 17
set_register_merging [get_cells u_logic_Ipn2z4_reg] 17
set_register_merging [get_cells u_logic_Qnn2z4_reg] 17
set_register_merging [get_cells u_logic_Nnc3z4_reg] 17
set_register_merging [get_cells u_logic_Rym2z4_reg] 17
set_register_merging [get_cells u_logic_Q4h3z4_reg] 17
set_register_merging [get_cells u_logic_Tqc3z4_reg] 17
set_register_merging [get_cells u_logic_Axm2z4_reg] 17
set_register_merging [get_cells u_logic_Mis2z4_reg] 17
set_register_merging [get_cells u_logic_Kss2z4_reg] 17
set_register_merging [get_cells u_logic_Pcd3z4_reg] 17
set_register_merging [get_cells u_logic_Lul2z4_reg] 17
set_register_merging [get_cells u_logic_I6h3z4_reg] 17
set_register_merging [get_cells u_logic_Jsc3z4_reg] 17
set_register_merging [get_cells u_logic_Usl2z4_reg] 17
set_register_merging [get_cells u_logic_Vgs2z4_reg] 17
set_register_merging [get_cells u_logic_Tqs2z4_reg] 17
set_register_merging [get_cells u_logic_T7d3z4_reg] 17
set_register_merging [get_cells u_logic_Wuq2z4_reg] 17
set_register_merging [get_cells u_logic_Etq2z4_reg] 17
set_register_merging [get_cells u_logic_Oar2z4_reg] 17
set_register_merging [get_cells u_logic_W8r2z4_reg] 17
set_register_merging [get_cells u_logic_Ble3z4_reg] 17
set_register_merging [get_cells u_logic_Jje3z4_reg] 17
set_register_merging [get_cells u_logic_T8f3z4_reg] 17
set_register_merging [get_cells u_logic_C7f3z4_reg] 17
set_register_merging [get_cells u_logic_X0c3z4_reg] 17
set_register_merging [get_cells u_logic_Gzb3z4_reg] 17
set_register_merging [get_cells u_logic_Q0f3z4_reg] 17
set_register_merging [get_cells u_logic_N7c3z4_reg] 17
set_register_merging [get_cells u_logic_W5c3z4_reg] 17
set_register_merging [get_cells u_logic_Rnb3z4_reg] 17
set_register_merging [get_cells u_logic_F4c3z4_reg] 17
set_register_merging [get_cells u_logic_O2c3z4_reg] 17
set_register_merging [get_cells u_logic_Pxb3z4_reg] 17
set_register_merging [get_cells u_logic_Yvb3z4_reg] 17
set_register_merging [get_cells u_logic_Vac3z4_reg] 17
set_register_merging [get_cells u_logic_E9c3z4_reg] 17
set_register_merging [get_cells u_logic_Hub3z4_reg] 17
set_register_merging [get_cells u_logic_Qsb3z4_reg] 17
set_register_merging [get_cells u_logic_Zqb3z4_reg] 17
set_register_merging [get_cells u_logic_Kkb3z4_reg] 17
set_register_merging [get_cells u_logic_Gcb3z4_reg] 17
set_register_merging [get_cells u_logic_Azs2z4_reg] 17
set_register_merging [get_cells u_logic_Jxs2z4_reg] 17
set_register_merging [get_cells u_logic_Svs2z4_reg] 17
set_register_merging [get_cells u_logic_Tib3z4_reg] 17
set_register_merging [get_cells u_logic_Pab3z4_reg] 17
set_register_merging [get_cells u_logic_Cps2z4_reg] 17
set_register_merging [get_cells u_logic_Lns2z4_reg] 17
set_register_merging [get_cells u_logic_Uls2z4_reg] 17
set_register_merging [get_cells u_logic_Qrp2z4_reg] 17
set_register_merging [get_cells u_logic_Aqp2z4_reg] 17
set_register_merging [get_cells u_logic_Uqi2z4_reg] 17
set_register_merging [get_cells u_logic_Bmb3z4_reg] 17
set_register_merging [get_cells u_logic_Xdb3z4_reg] 17
set_register_merging [get_cells u_logic_H8l2z4_reg] 17
set_register_merging [get_cells u_logic_Q6l2z4_reg] 17
set_register_merging [get_cells u_logic_Z4l2z4_reg] 17
set_register_merging [get_cells u_logic_Bjd3z4_reg] 17
set_register_merging [get_cells u_logic_Lhd3z4_reg] 17
set_register_merging [get_cells u_logic_Zad3z4_reg] 17
set_register_merging [get_cells u_logic_J9d3z4_reg] 17
set_register_merging [get_cells u_logic_Adt2z4_reg] 17
set_register_merging [get_cells u_logic_Mbt2z4_reg] 17
set_register_merging [get_cells u_logic_C3w2z4_reg] 17
set_register_merging [get_cells u_logic_D4g3z4_reg] 17
set_register_merging [get_cells u_logic_Wxp2z4_reg] 17
set_register_merging [get_cells u_logic_Nen2z4_reg] 17
set_register_merging [get_cells u_logic_Vve3z4_reg] 17
set_register_merging [get_cells u_logic_Mcc3z4_reg] 17
set_register_merging [get_cells u_logic_Bec3z4_reg] 17
set_register_merging [get_cells u_logic_Dpc3z4_reg] 17
set_register_merging [get_cells u_logic_Fhc3z4_reg] 17
set_register_merging [get_cells u_logic_Uic3z4_reg] 17
set_register_merging [get_cells u_logic_Jkc3z4_reg] 17
set_register_merging [get_cells u_logic_Ylc3z4_reg] 17
set_register_merging [get_cells u_logic_H2f3z4_reg] 17
set_register_merging [get_cells u_logic_Kop2z4_reg] 17
set_register_merging [get_cells u_logic_Lz93z4_reg] 17
set_register_merging [get_cells u_logic_Lee3z4_reg] 17
set_register_merging [get_cells u_logic_Thm2z4_reg] 17
set_register_merging [get_cells u_logic_Mvi2z4_reg] 17
set_register_merging [get_cells u_logic_Jhy2z4_reg] 17
set_register_merging [get_cells u_logic_U5x2z4_reg] 17
set_register_merging [get_cells u_logic_Pet2z4_reg] 17
set_register_merging [get_cells u_logic_L8t2z4_reg] 17
set_register_merging [get_cells u_logic_Ffj2z4_reg] 17
set_register_merging [get_cells u_logic_Ark2z4_reg] 17
set_register_merging [get_cells u_logic_Sgj2z4_reg] 17
set_register_merging [get_cells u_logic_I6w2z4_reg] 17
set_register_merging [get_cells u_logic_Nsk2z4_reg] 17
set_register_merging [get_cells u_logic_Aok2z4_reg] 17
set_register_merging [get_cells u_logic_Fij2z4_reg] 17
set_register_merging [get_cells u_logic_Emi2z4_reg] 17
set_register_merging [get_cells u_logic_U7w2z4_reg] 17
set_register_merging [get_cells u_logic_Qfc3z4_reg] 17
set_register_merging [get_cells u_logic_Ztc3z4_reg] 17
set_register_merging [get_cells u_logic_Y9t2z4_reg] 17
set_register_merging [get_cells u_logic_Npk2z4_reg] 17
set_register_merging [get_cells u_logic_Vaw2z4_reg] 17
set_register_merging [get_cells u_logic_R0t2z4_reg] 17
set_register_merging [get_cells u_logic_Ffs2z4_reg] 17
set_register_merging [get_cells u_logic_Mjl2z4_reg] 17
set_register_merging [get_cells u_logic_Vfd3z4_reg] 17
set_register_merging [get_cells u_logic_Ipb3z4_reg] 17
set_register_merging [get_cells u_logic_Y9l2z4_reg] 17
set_register_merging [get_cells u_logic_Trq2z4_reg] 17
set_register_merging [get_cells u_logic_Gxk2z4_reg] 17
set_register_merging [get_cells u_logic_Uaj2z4_reg] 17
set_register_merging [get_cells u_logic_Nbm2z4_reg] 17
set_register_merging [get_cells u_logic_Uyv2z4_reg] 17
set_register_merging [get_cells u_logic_Cam2z4_reg] 17
set_register_merging [get_cells u_logic_Ywi2z4_reg] 17
set_register_merging [get_cells u_logic_A4t2z4_reg] 17
set_register_merging [get_cells u_logic_Hzj2z4_reg] 17
set_register_merging [get_cells u_logic_K3l2z4_reg] 17
set_register_merging [get_cells u_logic_Tdp2z4_reg] 17
set_register_merging [get_cells u_logic_Wbk2z4_reg] 17
set_register_merging [get_cells u_logic_Idk2z4_reg] 17
set_register_merging [get_cells u_logic_Tki2z4_reg] 17
set_register_merging [get_cells u_logic_Gji2z4_reg] 17
set_register_merging [get_cells u_logic_Zei2z4_reg] 17
set_register_merging [get_cells u_logic_J6i2z4_reg] 17
set_fix_hold [get_clocks HCLK]
set compile_inbound_cell_optimization false
set compile_inbound_max_cell_percentage 10.0
