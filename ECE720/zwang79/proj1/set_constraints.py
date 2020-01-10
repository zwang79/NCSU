import re, sys

clk_per    = sys.argv[1]
util       = sys.argv[2]
max_lyr    = sys.argv[3]
max_trans  = sys.argv[4]
clk_uncert = sys.argv[5]



# set clock period
src  = open('template/MulDiv.constraints.tcl')
dest = open('src/rtl/proj1/MulDiv.constraints.tcl','w')
for line in src:
  m = re.search(r'set CLK_PER',line)
  if m:
    dest.write(' set CLK_PER  '+clk_per+'\n')
  else:
    dest.write(line)
src.close()
dest.close()


# set utilization
src  = open('template/floorplan.tcl')
dest = open('icc2rm/rm_setup/floorplan.tcl','w')
for line in src:
  m = re.search(r'set CORE_UTILIZATION',line)
  if m:
    dest.write('set CORE_UTILIZATION '+util+'\n')
  else:
    dest.write(line)
src.close()
dest.close()


# set max routing layer
src  = open('template/icc2_common_setup.tcl')
dest = open('icc2rm/rm_setup/icc2_common_setup.tcl','w')
for line in src:
  m = re.search(r'set MAX_ROUTING_LAYER',line)
  if m:
    dest.write('set MAX_ROUTING_LAYER		"'+max_lyr+'"'+'\n')
  else:
    dest.write(line)
src.close()
dest.close()



# set max transition
src  = open('template/settings.place_opt.tcl')
dest = open('icc2rm/rm_icc2_pnr_scripts/settings.place_opt.tcl','w')
for line in src:
  m = re.search(r'set_max_transition',line)
  if m:
    dest.write('  set_max_transition -clock_path '+max_trans+' [get_clocks -mode $m] -scenarios [get_scenarios -mode $m]\n')
  else:
    dest.write(line)
src.close()
dest.close()


# set clock uncertainty
src  = open('template/clock_opt_cts.tcl')
dest = open('icc2rm/rm_icc2_pnr_scripts/clock_opt_cts.tcl','w')
for line in src:
  m = re.search(r'		set_clock_uncertainty -hold',line)
  if m:
    dest.write('		set_clock_uncertainty -hold '+clk_uncert+' -from [get_clocks -mode $mode] -to [get_clocks -mode $mode] -scenarios [get_scenarios -of $mode]\n')
  else:
    dest.write(line)
src.close()
dest.close()





