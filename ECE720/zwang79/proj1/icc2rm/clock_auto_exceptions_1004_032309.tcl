#Copy per mode balance points 
# balance points for the primary corner 
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_32_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_32_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_18_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_18_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_19_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_19_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_35_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_35_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_60_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_60_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_36_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_36_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_40_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_40_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_37_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_37_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_38_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_38_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_39_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_39_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_17_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_17_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_41_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_41_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_33_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_33_/CLK]
