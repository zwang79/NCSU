#Copy per mode balance points 
# balance points for the primary corner 
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_32_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_32_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_16_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_16_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_10_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_10_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_26_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_26_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_14_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_14_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_12_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_12_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_27_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_27_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_19_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_19_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_51_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_51_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_35_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_35_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_50_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_50_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_28_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_28_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_20_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_20_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_13_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_13_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_48_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_48_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_29_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_29_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_21_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_21_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_30_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_30_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_22_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_22_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_31_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_31_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_23_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_23_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_63_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_63_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -40 -balance_points [get_pin remainder_reg_129_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -40 -balance_points [get_pin remainder_reg_129_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_49_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_49_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_25_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_25_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_41_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_41_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_33_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_33_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_121_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_121_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_122_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_122_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_123_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_123_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_124_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_124_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_125_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_125_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -40 -balance_points [get_pin remainder_reg_126_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -40 -balance_points [get_pin remainder_reg_126_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -40 -balance_points [get_pin remainder_reg_127_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -40 -balance_points [get_pin remainder_reg_127_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -40 -balance_points [get_pin remainder_reg_128_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -40 -balance_points [get_pin remainder_reg_128_/CLK]
