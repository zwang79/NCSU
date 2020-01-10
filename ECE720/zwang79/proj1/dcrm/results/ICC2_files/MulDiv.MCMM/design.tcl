if { [namespace current] != {::5DA63D9D} } { error {This script [file tail [info script]] should not be sourced directly}; }
###################################################################

# Created by write_script -format dctcl for global constraints on Tue Oct 15   \
17:43:58 2019

###################################################################

# Set the current_design #
current_design MulDiv

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
set_attribute -type integer [current_design] pwr_cg_gating_group_count 5
set_attribute -type boolean [get_cells clk_gate_remainder_reg]                 \
clock_gating_logic true
set_attribute -type boolean [get_cells clk_gate_state_reg] clock_gating_logic  \
true
set_attribute -type boolean [get_cells clk_gate_count_reg] clock_gating_logic  \
true
set_attribute -type boolean [get_cells clk_gate_req_dw_reg] clock_gating_logic \
true
set_attribute -type boolean [get_cells clk_gate_divisor_reg]                   \
clock_gating_logic true
set_compile_directives [get_pins clk_gate_remainder_reg/CLK]                   \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_remainder_reg/EN]                    \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_remainder_reg/TE]                    \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_state_reg/CLK] -constant_propagation \
false 
set_compile_directives [get_pins clk_gate_state_reg/EN] -constant_propagation  \
false 
set_compile_directives [get_pins clk_gate_state_reg/TE] -constant_propagation  \
false 
set_compile_directives [get_pins clk_gate_count_reg/CLK] -constant_propagation \
false 
set_compile_directives [get_pins clk_gate_count_reg/EN] -constant_propagation  \
false 
set_compile_directives [get_pins clk_gate_count_reg/TE] -constant_propagation  \
false 
set_compile_directives [get_pins clk_gate_req_dw_reg/CLK]                      \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_req_dw_reg/EN] -constant_propagation \
false 
set_compile_directives [get_pins clk_gate_req_dw_reg/TE] -constant_propagation \
false 
set_compile_directives [get_pins clk_gate_divisor_reg/CLK]                     \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_divisor_reg/EN]                      \
-constant_propagation false 
set_compile_directives [get_pins clk_gate_divisor_reg/TE]                      \
-constant_propagation false 
set_attribute -type boolean [get_cells clk_gate_remainder_reg]                 \
hpower_inv_cg_cell false
set_attribute -type boolean [get_cells clk_gate_state_reg] hpower_inv_cg_cell  \
false
set_attribute -type boolean [get_cells clk_gate_count_reg] hpower_inv_cg_cell  \
false
set_attribute -type boolean [get_cells clk_gate_req_dw_reg] hpower_inv_cg_cell \
false
set_attribute -type boolean [get_cells clk_gate_divisor_reg]                   \
hpower_inv_cg_cell false
set_attribute -type integer [get_cells resHi_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_64_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_0_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_1_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_2_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_3_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_4_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_5_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_6_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_7_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_8_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_9_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_10_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_11_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_12_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_13_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_14_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_15_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_16_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_17_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_18_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_19_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_20_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_21_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_22_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_23_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_24_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_25_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_26_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_27_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_28_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_29_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_30_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_31_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_32_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_33_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_34_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_35_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_36_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_37_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_38_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_39_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_40_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_41_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_42_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_43_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_44_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_45_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_46_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_47_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_48_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_49_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_50_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_51_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_52_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_53_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_54_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_55_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_56_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_57_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_58_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_59_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_60_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_61_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_62_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells divisor_reg_63_]                        \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_128_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_127_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_126_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_125_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_124_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_123_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_122_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_121_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_120_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_119_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_118_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_9_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_84_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_83_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_82_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_81_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_91_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_90_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_89_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_80_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_79_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_78_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_77_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_76_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_75_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_74_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_33_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_103_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_71_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_99_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_41_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_73_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_25_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_109_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_107_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_106_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_105_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_98_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_97_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_49_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_1_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_17_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_66_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_115_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_57_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_114_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_113_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_112_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_111_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_110_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_96_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_129_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_63_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_88_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_87_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_86_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_85_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_62_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_95_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_94_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_93_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_92_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_61_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_102_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_101_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_39_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_55_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_23_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_31_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_47_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_104_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_46_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_54_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_22_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_30_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_38_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_37_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_53_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_21_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_29_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_45_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_7_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_15_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_72_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_40_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_56_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_24_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_48_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_65_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_64_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells count_reg_6_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells count_reg_5_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells count_reg_4_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells count_reg_3_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells count_reg_2_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells count_reg_0_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells count_reg_1_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells state_reg_2_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells state_reg_1_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells neg_out_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells req_tag_reg_0_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells req_tag_reg_1_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells req_tag_reg_2_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells req_tag_reg_3_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells req_tag_reg_4_]                         \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells isHi_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells req_dw_reg] pwr_cg_count_for_register 1
set_attribute -type integer [get_cells state_reg_0_] pwr_cg_count_for_register \
1
set_attribute -type integer [get_cells remainder_reg_5_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_13_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_70_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_69_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_68_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_36_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_52_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_20_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_28_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_44_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_60_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_117_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_116_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_59_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_108_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_50_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_67_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_35_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_51_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_19_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_27_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_4_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_12_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_6_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_14_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_3_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_11_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_43_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_100_]                     \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_42_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_58_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_26_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_34_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_18_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_2_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_10_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_8_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_16_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_32_]                      \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells remainder_reg_0_]                       \
pwr_cg_count_for_register 1
set_attribute -type integer [get_cells resHi_reg] pwr_cg_gating_group 3
set_attribute -type integer [get_cells divisor_reg_64_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_0_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_1_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_2_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_3_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_4_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_5_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_6_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_7_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_8_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_9_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_10_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_11_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_12_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_13_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_14_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_15_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_16_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_17_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_18_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_19_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_20_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_21_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_22_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_23_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_24_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_25_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_26_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_27_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_28_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_29_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_30_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_31_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_32_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_33_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_34_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_35_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_36_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_37_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_38_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_39_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_40_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_41_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_42_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_43_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_44_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_45_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_46_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_47_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_48_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_49_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_50_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_51_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_52_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_53_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_54_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_55_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_56_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_57_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_58_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_59_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_60_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_61_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_62_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells divisor_reg_63_] pwr_cg_gating_group 0
set_attribute -type integer [get_cells remainder_reg_128_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_127_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_126_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_125_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_124_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_123_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_122_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_121_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_120_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_119_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_118_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_9_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_84_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_83_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_82_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_81_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_91_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_90_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_89_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_80_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_79_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_78_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_77_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_76_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_75_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_74_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_33_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_103_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_71_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_99_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_41_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_73_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_25_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_109_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_107_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_106_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_105_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_98_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_97_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_49_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_1_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_17_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_66_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_115_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_57_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_114_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_113_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_112_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_111_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_110_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_96_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_129_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_63_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_88_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_87_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_86_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_85_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_62_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_95_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_94_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_93_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_92_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_61_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_102_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_101_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_39_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_55_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_23_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_31_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_47_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_104_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_46_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_54_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_22_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_30_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_38_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_37_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_53_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_21_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_29_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_45_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_7_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_15_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_72_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_40_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_56_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_24_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_48_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_65_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_64_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells count_reg_6_] pwr_cg_gating_group 2
set_attribute -type integer [get_cells count_reg_5_] pwr_cg_gating_group 2
set_attribute -type integer [get_cells count_reg_4_] pwr_cg_gating_group 2
set_attribute -type integer [get_cells count_reg_3_] pwr_cg_gating_group 2
set_attribute -type integer [get_cells count_reg_2_] pwr_cg_gating_group 2
set_attribute -type integer [get_cells count_reg_0_] pwr_cg_gating_group 2
set_attribute -type integer [get_cells count_reg_1_] pwr_cg_gating_group 2
set_attribute -type integer [get_cells state_reg_2_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells state_reg_1_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells neg_out_reg] pwr_cg_gating_group 2
set_attribute -type integer [get_cells req_tag_reg_0_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells req_tag_reg_1_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells req_tag_reg_2_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells req_tag_reg_3_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells req_tag_reg_4_] pwr_cg_gating_group 1
set_attribute -type integer [get_cells isHi_reg] pwr_cg_gating_group 1
set_attribute -type integer [get_cells req_dw_reg] pwr_cg_gating_group 1
set_attribute -type integer [get_cells state_reg_0_] pwr_cg_gating_group 3
set_attribute -type integer [get_cells remainder_reg_5_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_13_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_70_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_69_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_68_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_36_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_52_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_20_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_28_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_44_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_60_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_117_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_116_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_59_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_108_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_50_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_67_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_35_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_51_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_19_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_27_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_4_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_12_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_6_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_14_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_3_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_11_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_43_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_100_] pwr_cg_gating_group \
4
set_attribute -type integer [get_cells remainder_reg_42_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_58_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_26_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_34_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_18_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_2_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_10_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_8_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_16_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_32_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells remainder_reg_0_] pwr_cg_gating_group 4
set_attribute -type integer [get_cells clk_gate_remainder_reg]                 \
pwr_cg_gating_group 4
set_attribute -type integer [get_cells clk_gate_state_reg] pwr_cg_gating_group \
3
set_attribute -type integer [get_cells clk_gate_count_reg] pwr_cg_gating_group \
2
set_attribute -type integer [get_cells clk_gate_req_dw_reg]                    \
pwr_cg_gating_group 1
set_attribute -type integer [get_cells clk_gate_divisor_reg]                   \
pwr_cg_gating_group 0
set_attribute -type integer [get_cells resHi_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_64_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_0_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_1_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_2_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_3_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_4_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_5_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_6_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_7_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_8_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_9_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells divisor_reg_10_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_11_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_12_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_13_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_14_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_15_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_16_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_17_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_18_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_19_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_20_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_21_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_22_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_23_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_24_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_25_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_26_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_27_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_28_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_29_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_30_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_31_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_32_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_33_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_34_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_35_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_36_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_37_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_38_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_39_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_40_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_41_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_42_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_43_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_44_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_45_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_46_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_47_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_48_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_49_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_50_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_51_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_52_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_53_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_54_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_55_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_56_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_57_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_58_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_59_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_60_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_61_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_62_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells divisor_reg_63_]                        \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_128_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_127_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_126_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_125_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_124_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_123_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_122_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_121_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_120_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_119_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_118_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_9_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_84_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_83_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_82_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_81_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_91_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_90_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_89_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_80_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_79_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_78_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_77_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_76_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_75_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_74_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_33_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_103_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_71_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_99_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_41_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_73_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_25_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_109_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_107_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_106_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_105_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_98_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_97_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_49_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_1_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_17_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_66_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_115_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_57_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_114_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_113_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_112_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_111_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_110_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_96_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_129_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_63_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_88_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_87_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_86_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_85_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_62_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_95_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_94_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_93_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_92_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_61_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_102_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_101_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_39_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_55_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_23_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_31_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_47_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_104_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_46_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_54_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_22_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_30_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_38_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_37_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_53_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_21_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_29_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_45_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_7_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_15_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_72_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_40_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_56_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_24_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_48_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_65_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_64_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells count_reg_6_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells count_reg_5_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells count_reg_4_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells count_reg_3_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells count_reg_2_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells count_reg_0_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells count_reg_1_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells state_reg_2_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells state_reg_1_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells neg_out_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells req_tag_reg_0_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells req_tag_reg_1_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells req_tag_reg_2_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells req_tag_reg_3_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells req_tag_reg_4_] pwr_cg_gating_sub_group \
0
set_attribute -type integer [get_cells isHi_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells req_dw_reg] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells state_reg_0_] pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_5_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_13_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_70_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_69_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_68_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_36_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_52_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_20_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_28_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_44_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_60_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_117_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_116_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_59_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_108_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_50_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_67_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_35_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_51_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_19_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_27_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_4_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_12_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_6_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_14_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_3_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_11_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_43_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_100_]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_42_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_58_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_26_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_34_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_18_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_2_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_10_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_8_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_16_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_32_]                      \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells remainder_reg_0_]                       \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_remainder_reg]                 \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_state_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_count_reg]                     \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_req_dw_reg]                    \
pwr_cg_gating_sub_group 0
set_attribute -type integer [get_cells clk_gate_divisor_reg]                   \
pwr_cg_gating_sub_group 0
set_register_merging [get_cells resHi_reg] 17
set_register_merging [get_cells divisor_reg_64_] 17
set_register_merging [get_cells divisor_reg_0_] 17
set_register_merging [get_cells divisor_reg_1_] 17
set_register_merging [get_cells divisor_reg_2_] 17
set_register_merging [get_cells divisor_reg_3_] 17
set_register_merging [get_cells divisor_reg_4_] 17
set_register_merging [get_cells divisor_reg_5_] 17
set_register_merging [get_cells divisor_reg_6_] 17
set_register_merging [get_cells divisor_reg_7_] 17
set_register_merging [get_cells divisor_reg_8_] 17
set_register_merging [get_cells divisor_reg_9_] 17
set_register_merging [get_cells divisor_reg_10_] 17
set_register_merging [get_cells divisor_reg_11_] 17
set_register_merging [get_cells divisor_reg_12_] 17
set_register_merging [get_cells divisor_reg_13_] 17
set_register_merging [get_cells divisor_reg_14_] 17
set_register_merging [get_cells divisor_reg_15_] 17
set_register_merging [get_cells divisor_reg_16_] 17
set_register_merging [get_cells divisor_reg_17_] 17
set_register_merging [get_cells divisor_reg_18_] 17
set_register_merging [get_cells divisor_reg_19_] 17
set_register_merging [get_cells divisor_reg_20_] 17
set_register_merging [get_cells divisor_reg_21_] 17
set_register_merging [get_cells divisor_reg_22_] 17
set_register_merging [get_cells divisor_reg_23_] 17
set_register_merging [get_cells divisor_reg_24_] 17
set_register_merging [get_cells divisor_reg_25_] 17
set_register_merging [get_cells divisor_reg_26_] 17
set_register_merging [get_cells divisor_reg_27_] 17
set_register_merging [get_cells divisor_reg_28_] 17
set_register_merging [get_cells divisor_reg_29_] 17
set_register_merging [get_cells divisor_reg_30_] 17
set_register_merging [get_cells divisor_reg_31_] 17
set_register_merging [get_cells divisor_reg_32_] 17
set_register_merging [get_cells divisor_reg_33_] 17
set_register_merging [get_cells divisor_reg_34_] 17
set_register_merging [get_cells divisor_reg_35_] 17
set_register_merging [get_cells divisor_reg_36_] 17
set_register_merging [get_cells divisor_reg_37_] 17
set_register_merging [get_cells divisor_reg_38_] 17
set_register_merging [get_cells divisor_reg_39_] 17
set_register_merging [get_cells divisor_reg_40_] 17
set_register_merging [get_cells divisor_reg_41_] 17
set_register_merging [get_cells divisor_reg_42_] 17
set_register_merging [get_cells divisor_reg_43_] 17
set_register_merging [get_cells divisor_reg_44_] 17
set_register_merging [get_cells divisor_reg_45_] 17
set_register_merging [get_cells divisor_reg_46_] 17
set_register_merging [get_cells divisor_reg_47_] 17
set_register_merging [get_cells divisor_reg_48_] 17
set_register_merging [get_cells divisor_reg_49_] 17
set_register_merging [get_cells divisor_reg_50_] 17
set_register_merging [get_cells divisor_reg_51_] 17
set_register_merging [get_cells divisor_reg_52_] 17
set_register_merging [get_cells divisor_reg_53_] 17
set_register_merging [get_cells divisor_reg_54_] 17
set_register_merging [get_cells divisor_reg_55_] 17
set_register_merging [get_cells divisor_reg_56_] 17
set_register_merging [get_cells divisor_reg_57_] 17
set_register_merging [get_cells divisor_reg_58_] 17
set_register_merging [get_cells divisor_reg_59_] 17
set_register_merging [get_cells divisor_reg_60_] 17
set_register_merging [get_cells divisor_reg_61_] 17
set_register_merging [get_cells divisor_reg_62_] 17
set_register_merging [get_cells divisor_reg_63_] 17
set_register_merging [get_cells remainder_reg_128_] 17
set_register_merging [get_cells remainder_reg_127_] 17
set_register_merging [get_cells remainder_reg_126_] 17
set_register_merging [get_cells remainder_reg_125_] 17
set_register_merging [get_cells remainder_reg_124_] 17
set_register_merging [get_cells remainder_reg_123_] 17
set_register_merging [get_cells remainder_reg_122_] 17
set_register_merging [get_cells remainder_reg_121_] 17
set_register_merging [get_cells remainder_reg_120_] 17
set_register_merging [get_cells remainder_reg_119_] 17
set_register_merging [get_cells remainder_reg_118_] 17
set_register_merging [get_cells remainder_reg_9_] 17
set_register_merging [get_cells remainder_reg_84_] 17
set_register_merging [get_cells remainder_reg_83_] 17
set_register_merging [get_cells remainder_reg_82_] 17
set_register_merging [get_cells remainder_reg_81_] 17
set_register_merging [get_cells remainder_reg_91_] 17
set_register_merging [get_cells remainder_reg_90_] 17
set_register_merging [get_cells remainder_reg_89_] 17
set_register_merging [get_cells remainder_reg_80_] 17
set_register_merging [get_cells remainder_reg_79_] 17
set_register_merging [get_cells remainder_reg_78_] 17
set_register_merging [get_cells remainder_reg_77_] 17
set_register_merging [get_cells remainder_reg_76_] 17
set_register_merging [get_cells remainder_reg_75_] 17
set_register_merging [get_cells remainder_reg_74_] 17
set_register_merging [get_cells remainder_reg_33_] 17
set_register_merging [get_cells remainder_reg_103_] 17
set_register_merging [get_cells remainder_reg_71_] 17
set_register_merging [get_cells remainder_reg_99_] 17
set_register_merging [get_cells remainder_reg_41_] 17
set_register_merging [get_cells remainder_reg_73_] 17
set_register_merging [get_cells remainder_reg_25_] 17
set_register_merging [get_cells remainder_reg_109_] 17
set_register_merging [get_cells remainder_reg_107_] 17
set_register_merging [get_cells remainder_reg_106_] 17
set_register_merging [get_cells remainder_reg_105_] 17
set_register_merging [get_cells remainder_reg_98_] 17
set_register_merging [get_cells remainder_reg_97_] 17
set_register_merging [get_cells remainder_reg_49_] 17
set_register_merging [get_cells remainder_reg_1_] 17
set_register_merging [get_cells remainder_reg_17_] 17
set_register_merging [get_cells remainder_reg_66_] 17
set_register_merging [get_cells remainder_reg_115_] 17
set_register_merging [get_cells remainder_reg_57_] 17
set_register_merging [get_cells remainder_reg_114_] 17
set_register_merging [get_cells remainder_reg_113_] 17
set_register_merging [get_cells remainder_reg_112_] 17
set_register_merging [get_cells remainder_reg_111_] 17
set_register_merging [get_cells remainder_reg_110_] 17
set_register_merging [get_cells remainder_reg_96_] 17
set_register_merging [get_cells remainder_reg_129_] 17
set_register_merging [get_cells remainder_reg_63_] 17
set_register_merging [get_cells remainder_reg_88_] 17
set_register_merging [get_cells remainder_reg_87_] 17
set_register_merging [get_cells remainder_reg_86_] 17
set_register_merging [get_cells remainder_reg_85_] 17
set_register_merging [get_cells remainder_reg_62_] 17
set_register_merging [get_cells remainder_reg_95_] 17
set_register_merging [get_cells remainder_reg_94_] 17
set_register_merging [get_cells remainder_reg_93_] 17
set_register_merging [get_cells remainder_reg_92_] 17
set_register_merging [get_cells remainder_reg_61_] 17
set_register_merging [get_cells remainder_reg_102_] 17
set_register_merging [get_cells remainder_reg_101_] 17
set_register_merging [get_cells remainder_reg_39_] 17
set_register_merging [get_cells remainder_reg_55_] 17
set_register_merging [get_cells remainder_reg_23_] 17
set_register_merging [get_cells remainder_reg_31_] 17
set_register_merging [get_cells remainder_reg_47_] 17
set_register_merging [get_cells remainder_reg_104_] 17
set_register_merging [get_cells remainder_reg_46_] 17
set_register_merging [get_cells remainder_reg_54_] 17
set_register_merging [get_cells remainder_reg_22_] 17
set_register_merging [get_cells remainder_reg_30_] 17
set_register_merging [get_cells remainder_reg_38_] 17
set_register_merging [get_cells remainder_reg_37_] 17
set_register_merging [get_cells remainder_reg_53_] 17
set_register_merging [get_cells remainder_reg_21_] 17
set_register_merging [get_cells remainder_reg_29_] 17
set_register_merging [get_cells remainder_reg_45_] 17
set_register_merging [get_cells remainder_reg_7_] 17
set_register_merging [get_cells remainder_reg_15_] 17
set_register_merging [get_cells remainder_reg_72_] 17
set_register_merging [get_cells remainder_reg_40_] 17
set_register_merging [get_cells remainder_reg_56_] 17
set_register_merging [get_cells remainder_reg_24_] 17
set_register_merging [get_cells remainder_reg_48_] 17
set_register_merging [get_cells remainder_reg_65_] 17
set_register_merging [get_cells remainder_reg_64_] 17
set_register_merging [get_cells count_reg_6_] 17
set_register_merging [get_cells count_reg_5_] 17
set_register_merging [get_cells count_reg_4_] 17
set_register_merging [get_cells count_reg_3_] 17
set_register_merging [get_cells count_reg_2_] 17
set_register_merging [get_cells count_reg_0_] 17
set_register_merging [get_cells count_reg_1_] 17
set_register_merging [get_cells state_reg_2_] 17
set_register_merging [get_cells state_reg_1_] 17
set_register_merging [get_cells neg_out_reg] 17
set_register_merging [get_cells req_tag_reg_0_] 17
set_register_merging [get_cells req_tag_reg_1_] 17
set_register_merging [get_cells req_tag_reg_2_] 17
set_register_merging [get_cells req_tag_reg_3_] 17
set_register_merging [get_cells req_tag_reg_4_] 17
set_register_merging [get_cells isHi_reg] 17
set_register_merging [get_cells req_dw_reg] 17
set_register_merging [get_cells state_reg_0_] 17
set_register_merging [get_cells remainder_reg_5_] 17
set_register_merging [get_cells remainder_reg_13_] 17
set_register_merging [get_cells remainder_reg_70_] 17
set_register_merging [get_cells remainder_reg_69_] 17
set_register_merging [get_cells remainder_reg_68_] 17
set_register_merging [get_cells remainder_reg_36_] 17
set_register_merging [get_cells remainder_reg_52_] 17
set_register_merging [get_cells remainder_reg_20_] 17
set_register_merging [get_cells remainder_reg_28_] 17
set_register_merging [get_cells remainder_reg_44_] 17
set_register_merging [get_cells remainder_reg_60_] 17
set_register_merging [get_cells remainder_reg_117_] 17
set_register_merging [get_cells remainder_reg_116_] 17
set_register_merging [get_cells remainder_reg_59_] 17
set_register_merging [get_cells remainder_reg_108_] 17
set_register_merging [get_cells remainder_reg_50_] 17
set_register_merging [get_cells remainder_reg_67_] 17
set_register_merging [get_cells remainder_reg_35_] 17
set_register_merging [get_cells remainder_reg_51_] 17
set_register_merging [get_cells remainder_reg_19_] 17
set_register_merging [get_cells remainder_reg_27_] 17
set_register_merging [get_cells remainder_reg_4_] 17
set_register_merging [get_cells remainder_reg_12_] 17
set_register_merging [get_cells remainder_reg_6_] 17
set_register_merging [get_cells remainder_reg_14_] 17
set_register_merging [get_cells remainder_reg_3_] 17
set_register_merging [get_cells remainder_reg_11_] 17
set_register_merging [get_cells remainder_reg_43_] 17
set_register_merging [get_cells remainder_reg_100_] 17
set_register_merging [get_cells remainder_reg_42_] 17
set_register_merging [get_cells remainder_reg_58_] 17
set_register_merging [get_cells remainder_reg_26_] 17
set_register_merging [get_cells remainder_reg_34_] 17
set_register_merging [get_cells remainder_reg_18_] 17
set_register_merging [get_cells remainder_reg_2_] 17
set_register_merging [get_cells remainder_reg_10_] 17
set_register_merging [get_cells remainder_reg_8_] 17
set_register_merging [get_cells remainder_reg_16_] 17
set_register_merging [get_cells remainder_reg_32_] 17
set_register_merging [get_cells remainder_reg_0_] 17
set compile_inbound_cell_optimization false
set compile_inbound_max_cell_percentage 10.0
