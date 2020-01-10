import re,os

# see if the cvs file is empty
f = open('out.csv')

file_not_empty = f.read(1)


if file_not_empty:
    f.close()
    out = open('out.csv','a')
else:
    f.close()
    out = open('out.csv','w')    
    out.write("date,tgt_util,tgt_max_layer,tgt_max_trans,clk_uncert,route_opt_wnhs,route_opt_tnhs,route_opt_max_trans,route_opt_util,pnr_time\n")


# write date
d = open('flow_date.txt')
for line in d:
  m = re.search(r"(.+)",line)
  if m:
     out.write(m.group())
     break

out.write(",")


# target utilization
tar_u = open('icc2rm/rm_setup/floorplan.tcl','r')
for line in tar_u:
  m = re.search(r"set CORE_UTILIZATION\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break
tar_u.close()


# Max routing layer
max_l = open('dcrm/rm_setup/common_setup.tcl','r')
for line in max_l:
  m = re.search(r'set MAX_ROUTING_LAYER            "([A-Z0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break
max_l.close()

# Target transition
t_tran = open('icc2rm/rm_icc2_pnr_scripts/settings.place_opt.tcl','r')
for line in t_tran:
  m = re.search(r'set_max_transition -clock_path\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break
t_tran.close()

# Clock Uncertainty
c_unce = open('icc2rm/rm_icc2_pnr_scripts/clock_opt_cts.tcl','r')
for line in c_unce:
  m = re.search(r'set_clock_uncertainty -hold\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break
c_unce.close()


# Worst negative hold slack
wns = open('icc2rm/rpts_icc2/clock_opt_cts.report_global_timing','r')
for line in wns:
  m = re.search(r'WNS\s+([\-?0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break
wns.close()

# Total negative hold slack
tns = open('icc2rm/rpts_icc2/clock_opt_cts.report_global_timing','r')
for line in tns:
  m = re.search(r'TNS\s+([\-?0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break
wns.close()

# Max transition
max_t = open('icc2rm/rpts_icc2/route_opt.report_clock_timing','r')
for line in max_t:
  m = re.search(r"Maximum active transition",line)
  if m:
     max_t_1 = next(max_t)
     n = re.search(r"\s+\w+/CLK\s+([0-9\.]+)",max_t_1)
     out.write(n.group(1))
     out.write(",")
     break
max_t.close()

# final utilization
final_u = open('icc2rm/rpts_icc2/route_auto.report_utilization','r')
for line in final_u:
  m = re.search(r"Utilization Ratio:\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break
final_u.close()

# time for auto route
t1 = os.path.getmtime('icc2rm/init_design')
t2 = os.path.getmtime('icc2rm/route_opt')
time = str(t2-t1)
out.write(time)
out.write("\n")
out.close()



















