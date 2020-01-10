#*************************************************
#  Created by Design Compiler Topographical write_floorplan
#  Version: P-2019.03-SP1
#  Date: Tue Oct 15 17:42:12 2019
#*************************************************
undo_config -disable
set oldSnapState [set_object_snap_type -enabled false]



#*************************************************
#   SECTION: Core Area
#*************************************************

remove_base_array -all



#*************************************************
#   SECTION: Site Rows, with number: 0
#*************************************************
cut_row -all 

update_floorplan



#*************************************************
#   SECTION: Preroutes, with number: 0
#*************************************************

remove_net_shape *
remove_via *
remove_user_shape *

set_object_snap_type -enabled $oldSnapState

undo_config -enable
