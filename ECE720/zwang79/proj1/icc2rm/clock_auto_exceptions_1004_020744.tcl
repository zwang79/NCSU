#Copy per mode balance points 
# balance points for the primary corner 
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.5557 -balance_points [get_pin remainder_reg_0_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.5557 -balance_points [get_pin remainder_reg_0_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.99259 -balance_points [get_pin remainder_reg_16_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.99259 -balance_points [get_pin remainder_reg_16_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.564 -balance_points [get_pin remainder_reg_8_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.564 -balance_points [get_pin remainder_reg_8_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.4449 -balance_points [get_pin remainder_reg_10_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.4449 -balance_points [get_pin remainder_reg_10_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 15.2372 -balance_points [get_pin remainder_reg_2_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 15.2372 -balance_points [get_pin remainder_reg_2_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.1317 -balance_points [get_pin remainder_reg_18_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.1317 -balance_points [get_pin remainder_reg_18_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.29765 -balance_points [get_pin remainder_reg_26_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.29765 -balance_points [get_pin remainder_reg_26_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.4925 -balance_points [get_pin remainder_reg_58_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.4925 -balance_points [get_pin remainder_reg_58_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.96641 -balance_points [get_pin remainder_reg_11_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.96641 -balance_points [get_pin remainder_reg_11_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.0973 -balance_points [get_pin remainder_reg_3_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.0973 -balance_points [get_pin remainder_reg_3_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.8257 -balance_points [get_pin remainder_reg_14_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.8257 -balance_points [get_pin remainder_reg_14_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 20.0529 -balance_points [get_pin remainder_reg_6_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 20.0529 -balance_points [get_pin remainder_reg_6_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.66187 -balance_points [get_pin remainder_reg_12_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.66187 -balance_points [get_pin remainder_reg_12_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.9424 -balance_points [get_pin remainder_reg_4_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.9424 -balance_points [get_pin remainder_reg_4_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.65886 -balance_points [get_pin remainder_reg_27_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.65886 -balance_points [get_pin remainder_reg_27_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.93283 -balance_points [get_pin remainder_reg_19_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.93283 -balance_points [get_pin remainder_reg_19_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.8168 -balance_points [get_pin remainder_reg_60_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.8168 -balance_points [get_pin remainder_reg_60_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.23144 -balance_points [get_pin remainder_reg_28_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.23144 -balance_points [get_pin remainder_reg_28_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.816 -balance_points [get_pin remainder_reg_20_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.816 -balance_points [get_pin remainder_reg_20_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.16033 -balance_points [get_pin remainder_reg_70_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.16033 -balance_points [get_pin remainder_reg_70_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.70942 -balance_points [get_pin remainder_reg_13_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.70942 -balance_points [get_pin remainder_reg_13_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.8332 -balance_points [get_pin remainder_reg_5_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.8332 -balance_points [get_pin remainder_reg_5_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.0169 -balance_points [get_pin req_dw_reg/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.0169 -balance_points [get_pin req_dw_reg/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.82356 -balance_points [get_pin isHi_reg/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.82356 -balance_points [get_pin isHi_reg/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -0.755385 -balance_points [get_pin req_tag_reg_4_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -0.755385 -balance_points [get_pin req_tag_reg_4_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 0.65504 -balance_points [get_pin req_tag_reg_3_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 0.65504 -balance_points [get_pin req_tag_reg_3_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.06616 -balance_points [get_pin req_tag_reg_2_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.06616 -balance_points [get_pin req_tag_reg_2_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.64205 -balance_points [get_pin req_tag_reg_1_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.64205 -balance_points [get_pin req_tag_reg_1_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 0.657529 -balance_points [get_pin req_tag_reg_0_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 0.657529 -balance_points [get_pin req_tag_reg_0_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 30.9463 -balance_points [get_pin state_reg_1_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 30.9463 -balance_points [get_pin state_reg_1_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.4234 -balance_points [get_pin remainder_reg_64_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.4234 -balance_points [get_pin remainder_reg_64_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 1.50302 -balance_points [get_pin remainder_reg_24_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 1.50302 -balance_points [get_pin remainder_reg_24_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.5563 -balance_points [get_pin remainder_reg_56_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.5563 -balance_points [get_pin remainder_reg_56_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.0409 -balance_points [get_pin remainder_reg_15_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.0409 -balance_points [get_pin remainder_reg_15_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.2741 -balance_points [get_pin remainder_reg_7_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.2741 -balance_points [get_pin remainder_reg_7_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.06683 -balance_points [get_pin remainder_reg_29_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.06683 -balance_points [get_pin remainder_reg_29_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.21646 -balance_points [get_pin remainder_reg_21_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.21646 -balance_points [get_pin remainder_reg_21_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.59459 -balance_points [get_pin remainder_reg_30_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.59459 -balance_points [get_pin remainder_reg_30_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.38487 -balance_points [get_pin remainder_reg_22_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.38487 -balance_points [get_pin remainder_reg_22_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.3138 -balance_points [get_pin remainder_reg_31_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.3138 -balance_points [get_pin remainder_reg_31_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.40034 -balance_points [get_pin remainder_reg_23_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.40034 -balance_points [get_pin remainder_reg_23_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.1654 -balance_points [get_pin remainder_reg_93_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.1654 -balance_points [get_pin remainder_reg_93_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.3308 -balance_points [get_pin remainder_reg_94_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.3308 -balance_points [get_pin remainder_reg_94_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 22.6652 -balance_points [get_pin remainder_reg_63_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 22.6652 -balance_points [get_pin remainder_reg_63_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.6 -balance_points [get_pin remainder_reg_111_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.6 -balance_points [get_pin remainder_reg_111_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.71805 -balance_points [get_pin remainder_reg_57_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.71805 -balance_points [get_pin remainder_reg_57_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.86713 -balance_points [get_pin remainder_reg_17_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.86713 -balance_points [get_pin remainder_reg_17_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.3847 -balance_points [get_pin remainder_reg_1_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.3847 -balance_points [get_pin remainder_reg_1_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.5637 -balance_points [get_pin remainder_reg_49_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.5637 -balance_points [get_pin remainder_reg_49_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.0194 -balance_points [get_pin remainder_reg_25_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.0194 -balance_points [get_pin remainder_reg_25_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 1.41889 -balance_points [get_pin remainder_reg_73_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 1.41889 -balance_points [get_pin remainder_reg_73_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.97726 -balance_points [get_pin remainder_reg_80_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.97726 -balance_points [get_pin remainder_reg_80_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.6931 -balance_points [get_pin remainder_reg_89_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.6931 -balance_points [get_pin remainder_reg_89_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 17.5954 -balance_points [get_pin remainder_reg_90_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 17.5954 -balance_points [get_pin remainder_reg_90_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.6527 -balance_points [get_pin remainder_reg_91_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.6527 -balance_points [get_pin remainder_reg_91_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.01976 -balance_points [get_pin remainder_reg_81_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.01976 -balance_points [get_pin remainder_reg_81_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.56652 -balance_points [get_pin remainder_reg_82_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.56652 -balance_points [get_pin remainder_reg_82_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.69543 -balance_points [get_pin remainder_reg_83_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.69543 -balance_points [get_pin remainder_reg_83_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.2516 -balance_points [get_pin remainder_reg_9_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.2516 -balance_points [get_pin remainder_reg_9_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.6821 -balance_points [get_pin divisor_reg_63_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.6821 -balance_points [get_pin divisor_reg_63_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.51237 -balance_points [get_pin divisor_reg_62_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.51237 -balance_points [get_pin divisor_reg_62_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.338 -balance_points [get_pin divisor_reg_61_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.338 -balance_points [get_pin divisor_reg_61_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.9132 -balance_points [get_pin divisor_reg_60_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.9132 -balance_points [get_pin divisor_reg_60_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.6703 -balance_points [get_pin divisor_reg_57_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.6703 -balance_points [get_pin divisor_reg_57_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.22851 -balance_points [get_pin divisor_reg_56_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.22851 -balance_points [get_pin divisor_reg_56_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.29969 -balance_points [get_pin divisor_reg_55_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.29969 -balance_points [get_pin divisor_reg_55_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.42612 -balance_points [get_pin divisor_reg_54_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.42612 -balance_points [get_pin divisor_reg_54_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.64002 -balance_points [get_pin divisor_reg_53_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.64002 -balance_points [get_pin divisor_reg_53_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.57222 -balance_points [get_pin divisor_reg_52_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.57222 -balance_points [get_pin divisor_reg_52_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 1.75104 -balance_points [get_pin divisor_reg_51_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 1.75104 -balance_points [get_pin divisor_reg_51_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.8538 -balance_points [get_pin divisor_reg_47_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.8538 -balance_points [get_pin divisor_reg_47_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.31129 -balance_points [get_pin divisor_reg_42_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.31129 -balance_points [get_pin divisor_reg_42_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.4237 -balance_points [get_pin divisor_reg_35_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.4237 -balance_points [get_pin divisor_reg_35_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.52553 -balance_points [get_pin divisor_reg_34_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.52553 -balance_points [get_pin divisor_reg_34_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.3352 -balance_points [get_pin divisor_reg_33_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.3352 -balance_points [get_pin divisor_reg_33_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 15.389 -balance_points [get_pin divisor_reg_32_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 15.389 -balance_points [get_pin divisor_reg_32_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 17.0235 -balance_points [get_pin divisor_reg_31_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 17.0235 -balance_points [get_pin divisor_reg_31_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.6031 -balance_points [get_pin divisor_reg_30_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.6031 -balance_points [get_pin divisor_reg_30_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.1724 -balance_points [get_pin divisor_reg_29_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.1724 -balance_points [get_pin divisor_reg_29_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.5978 -balance_points [get_pin divisor_reg_28_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.5978 -balance_points [get_pin divisor_reg_28_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.3392 -balance_points [get_pin divisor_reg_27_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 16.3392 -balance_points [get_pin divisor_reg_27_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.9469 -balance_points [get_pin divisor_reg_26_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.9469 -balance_points [get_pin divisor_reg_26_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.9961 -balance_points [get_pin divisor_reg_25_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.9961 -balance_points [get_pin divisor_reg_25_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.9756 -balance_points [get_pin divisor_reg_24_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.9756 -balance_points [get_pin divisor_reg_24_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.2252 -balance_points [get_pin divisor_reg_23_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.2252 -balance_points [get_pin divisor_reg_23_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.0104 -balance_points [get_pin divisor_reg_22_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.0104 -balance_points [get_pin divisor_reg_22_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.7071 -balance_points [get_pin divisor_reg_21_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.7071 -balance_points [get_pin divisor_reg_21_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.2871 -balance_points [get_pin divisor_reg_20_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.2871 -balance_points [get_pin divisor_reg_20_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.5133 -balance_points [get_pin divisor_reg_19_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.5133 -balance_points [get_pin divisor_reg_19_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.4783 -balance_points [get_pin divisor_reg_18_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.4783 -balance_points [get_pin divisor_reg_18_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.5684 -balance_points [get_pin divisor_reg_17_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.5684 -balance_points [get_pin divisor_reg_17_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.76738 -balance_points [get_pin divisor_reg_16_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.76738 -balance_points [get_pin divisor_reg_16_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.48441 -balance_points [get_pin divisor_reg_15_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.48441 -balance_points [get_pin divisor_reg_15_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.1314 -balance_points [get_pin divisor_reg_14_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.1314 -balance_points [get_pin divisor_reg_14_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.3407 -balance_points [get_pin divisor_reg_13_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.3407 -balance_points [get_pin divisor_reg_13_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.94618 -balance_points [get_pin divisor_reg_12_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.94618 -balance_points [get_pin divisor_reg_12_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.08756 -balance_points [get_pin divisor_reg_11_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.08756 -balance_points [get_pin divisor_reg_11_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.2047 -balance_points [get_pin divisor_reg_10_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.2047 -balance_points [get_pin divisor_reg_10_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.48313 -balance_points [get_pin divisor_reg_9_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.48313 -balance_points [get_pin divisor_reg_9_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.79991 -balance_points [get_pin divisor_reg_8_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.79991 -balance_points [get_pin divisor_reg_8_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.92249 -balance_points [get_pin divisor_reg_7_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.92249 -balance_points [get_pin divisor_reg_7_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.50892 -balance_points [get_pin divisor_reg_6_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.50892 -balance_points [get_pin divisor_reg_6_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.62503 -balance_points [get_pin divisor_reg_5_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.62503 -balance_points [get_pin divisor_reg_5_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.13693 -balance_points [get_pin divisor_reg_4_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.13693 -balance_points [get_pin divisor_reg_4_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.02544 -balance_points [get_pin divisor_reg_3_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.02544 -balance_points [get_pin divisor_reg_3_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.2773 -balance_points [get_pin divisor_reg_2_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.2773 -balance_points [get_pin divisor_reg_2_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.2003 -balance_points [get_pin divisor_reg_1_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.2003 -balance_points [get_pin divisor_reg_1_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.12288 -balance_points [get_pin divisor_reg_0_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.12288 -balance_points [get_pin divisor_reg_0_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.0475 -balance_points [get_pin divisor_reg_64_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.0475 -balance_points [get_pin divisor_reg_64_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 30.9463 -balance_points [get_pin resHi_reg/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 30.9463 -balance_points [get_pin resHi_reg/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.66135 -balance_points [get_pin divisor_reg_50_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.66135 -balance_points [get_pin divisor_reg_50_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.9203 -balance_points [get_pin divisor_reg_59_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.9203 -balance_points [get_pin divisor_reg_59_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.88863 -balance_points [get_pin divisor_reg_58_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.88863 -balance_points [get_pin divisor_reg_58_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.34615 -balance_points [get_pin remainder_reg_33_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.34615 -balance_points [get_pin remainder_reg_33_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.3777 -balance_points [get_pin remainder_reg_53_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.3777 -balance_points [get_pin remainder_reg_53_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 18.6784 -balance_points [get_pin remainder_reg_61_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 18.6784 -balance_points [get_pin remainder_reg_61_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.63822 -balance_points [get_pin remainder_reg_32_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.63822 -balance_points [get_pin remainder_reg_32_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.32333 -balance_points [get_pin remainder_reg_52_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.32333 -balance_points [get_pin remainder_reg_52_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 15.8586 -balance_points [get_pin remainder_reg_55_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 15.8586 -balance_points [get_pin remainder_reg_55_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.36594 -balance_points [get_pin remainder_reg_51_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.36594 -balance_points [get_pin remainder_reg_51_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.11813 -balance_points [get_pin remainder_reg_50_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.11813 -balance_points [get_pin remainder_reg_50_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.01062 -balance_points [get_pin remainder_reg_48_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.01062 -balance_points [get_pin remainder_reg_48_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.10448 -balance_points [get_pin remainder_reg_47_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.10448 -balance_points [get_pin remainder_reg_47_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.2409 -balance_points [get_pin remainder_reg_46_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.2409 -balance_points [get_pin remainder_reg_46_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.85302 -balance_points [get_pin remainder_reg_45_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.85302 -balance_points [get_pin remainder_reg_45_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.46979 -balance_points [get_pin remainder_reg_43_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.46979 -balance_points [get_pin remainder_reg_43_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.88452 -balance_points [get_pin remainder_reg_42_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.88452 -balance_points [get_pin remainder_reg_42_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.0999 -balance_points [get_pin remainder_reg_41_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.0999 -balance_points [get_pin remainder_reg_41_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.44228 -balance_points [get_pin remainder_reg_39_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.44228 -balance_points [get_pin remainder_reg_39_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.2283 -balance_points [get_pin remainder_reg_38_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.2283 -balance_points [get_pin remainder_reg_38_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.98909 -balance_points [get_pin divisor_reg_49_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.98909 -balance_points [get_pin divisor_reg_49_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.9494 -balance_points [get_pin divisor_reg_48_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.9494 -balance_points [get_pin divisor_reg_48_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.13098 -balance_points [get_pin divisor_reg_46_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.13098 -balance_points [get_pin divisor_reg_46_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.35354 -balance_points [get_pin divisor_reg_45_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.35354 -balance_points [get_pin divisor_reg_45_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.0495 -balance_points [get_pin divisor_reg_39_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.0495 -balance_points [get_pin divisor_reg_39_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.06321 -balance_points [get_pin divisor_reg_44_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.06321 -balance_points [get_pin divisor_reg_44_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.8419 -balance_points [get_pin divisor_reg_43_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.8419 -balance_points [get_pin divisor_reg_43_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.24865 -balance_points [get_pin divisor_reg_41_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.24865 -balance_points [get_pin divisor_reg_41_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.24539 -balance_points [get_pin divisor_reg_40_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.24539 -balance_points [get_pin divisor_reg_40_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.43881 -balance_points [get_pin divisor_reg_38_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.43881 -balance_points [get_pin divisor_reg_38_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.47472 -balance_points [get_pin divisor_reg_37_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.47472 -balance_points [get_pin divisor_reg_37_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.23866 -balance_points [get_pin divisor_reg_36_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.23866 -balance_points [get_pin divisor_reg_36_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.7105 -balance_points [get_pin remainder_reg_62_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 14.7105 -balance_points [get_pin remainder_reg_62_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.6605 -balance_points [get_pin remainder_reg_44_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 13.6605 -balance_points [get_pin remainder_reg_44_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.85902 -balance_points [get_pin remainder_reg_40_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 4.85902 -balance_points [get_pin remainder_reg_40_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.67845 -balance_points [get_pin remainder_reg_37_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 9.67845 -balance_points [get_pin remainder_reg_37_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.99626 -balance_points [get_pin remainder_reg_36_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.99626 -balance_points [get_pin remainder_reg_36_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.3478 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.3478 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.42741 -balance_points [get_pin remainder_reg_59_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 7.42741 -balance_points [get_pin remainder_reg_59_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 30.9463 -balance_points [get_pin state_reg_0_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 30.9463 -balance_points [get_pin state_reg_0_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 30.9463 -balance_points [get_pin state_reg_2_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 30.9463 -balance_points [get_pin state_reg_2_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.72996 -balance_points [get_pin remainder_reg_119_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.72996 -balance_points [get_pin remainder_reg_119_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.11782 -balance_points [get_pin remainder_reg_106_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.11782 -balance_points [get_pin remainder_reg_106_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.22994 -balance_points [get_pin remainder_reg_107_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.22994 -balance_points [get_pin remainder_reg_107_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.52582 -balance_points [get_pin remainder_reg_105_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 3.52582 -balance_points [get_pin remainder_reg_105_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 21.3877 -balance_points [get_pin remainder_reg_128_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 21.3877 -balance_points [get_pin remainder_reg_128_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.29014 -balance_points [get_pin remainder_reg_109_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.29014 -balance_points [get_pin remainder_reg_109_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.64173 -balance_points [get_pin remainder_reg_108_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 6.64173 -balance_points [get_pin remainder_reg_108_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.66351 -balance_points [get_pin remainder_reg_120_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 5.66351 -balance_points [get_pin remainder_reg_120_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.0936 -balance_points [get_pin remainder_reg_104_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.0936 -balance_points [get_pin remainder_reg_104_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.0949 -balance_points [get_pin remainder_reg_98_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.0949 -balance_points [get_pin remainder_reg_98_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.9179 -balance_points [get_pin remainder_reg_97_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 12.9179 -balance_points [get_pin remainder_reg_97_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.58907 -balance_points [get_pin remainder_reg_100_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 8.58907 -balance_points [get_pin remainder_reg_100_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 1.08857 -balance_points [get_pin remainder_reg_102_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 1.08857 -balance_points [get_pin remainder_reg_102_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.9275 -balance_points [get_pin remainder_reg_96_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 19.9275 -balance_points [get_pin remainder_reg_96_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.8934 -balance_points [get_pin remainder_reg_103_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 10.8934 -balance_points [get_pin remainder_reg_103_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.32686 -balance_points [get_pin remainder_reg_112_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 2.32686 -balance_points [get_pin remainder_reg_112_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.6167 -balance_points [get_pin remainder_reg_35_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay 11.6167 -balance_points [get_pin remainder_reg_35_/CLK]
