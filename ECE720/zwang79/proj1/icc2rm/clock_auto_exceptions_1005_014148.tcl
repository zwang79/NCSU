#Copy per mode balance points 
# balance points for the primary corner 
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_16_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_16_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_34_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_43_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_43_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_62_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_62_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_63_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_63_/CLK]
current_mode mode_norm.slow.RCmax
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_33_/CLK]
current_mode mode_norm.fast.RCmin_bc
set_clock_tree_balance_point   -corners mode_norm.worst_low.RCmax  -rise  -clock { clock } -delay -20 -balance_points [get_pin remainder_reg_33_/CLK]
