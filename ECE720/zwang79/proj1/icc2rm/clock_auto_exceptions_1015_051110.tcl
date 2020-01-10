#Copy per mode balance points 
# balance points for the primary corner 
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_32_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_32_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_8_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_8_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_10_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_10_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_2_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_2_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_18_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_18_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_11_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_11_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_3_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_3_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_14_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_14_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_6_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_6_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_12_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_12_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_4_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_4_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_19_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_19_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_35_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_35_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_59_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_59_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_20_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_20_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_36_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_36_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_13_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_13_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_5_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_5_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_15_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_15_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_7_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_7_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_62_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_62_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_63_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_63_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_129_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_129_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_17_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_17_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_1_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_1_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_33_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_33_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_9_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_9_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_126_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_126_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_127_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_127_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_128_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_128_/CLK]
