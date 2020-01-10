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
    out.write("date,tgt_util,route_opt_cells,core_area,route_opt_util,tgt_max_layer,route_opt_len_m1,route_opt_len_mint1,route_opt_len_mint2,route_opt_len_mint3,route_opt_len_mint4,route_opt_len_mint5,route_opt_len_msmg1,route_opt_len_msmg2,route_opt_len_msmg3,route_opt_len_msmg4,route_opt_len_msmg5,route_opt_len_mg1,route_opt_len_mg2,route_opt_viol,tgt_clk_per,route_opt_wns,route_opt_wnhs,route_opt_tns,route_opt_tnhs,tgt_max_trans,clk_uncert,route_opt_max_trans,route_opt_min_trans,route_opt_clk_depth,route_opt_pow_int,route_opt_pow_sw,route_opt_pow_leak,man_opt,pnr_time\n")


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
     break
out.write(",")
tar_u.close()


# route_opt_cells
t_cells = open('icc2rm/rpts_icc2/route_opt.report_design','r')
for line in t_cells:
  m = re.search(r"TOTAL LEAF CELLS\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
t_cells.close()


# core_area
c_area = open('icc2rm/rpts_icc2/route_opt.report_utilization','r')
for line in c_area:
  m = re.search(r"Total Area:\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
c_area.close()


# route_opt_util
r_util = open('icc2rm/rpts_icc2/route_opt.report_utilization','r')
for line in r_util:
  m = re.search(r"Utilization Ratio:\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
r_util.close()


# Max routing layer
max_l = open('icc2rm/rm_setup/icc2_common_setup.tcl','r')
for line in max_l:
  m = re.search(r'set MAX_ROUTING_LAYER		"([A-Z0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
max_l.close()


# route_opt_len_m1
l_m1 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_m1:
  m = re.search(r'Layer               M1 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_m1.close()


# route_opt_len_mint1
l_mint1 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_mint1:
  m = re.search(r'Layer            MINT1 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_mint1.close()


# route_opt_len_mint2
l_mint2 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_mint2:
  m = re.search(r'Layer            MINT2 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_mint2.close()


# route_opt_len_mint3
l_mint3 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_mint3:
  m = re.search(r'Layer            MINT3 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_mint3.close()

# route_opt_len_mint4
l_mint4 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_mint4:
  m = re.search(r'Layer            MINT4 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_mint4.close()


# route_opt_len_mint5
l_mint5 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_mint5:
  m = re.search(r'Layer            MINT5 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_mint5.close()


# route_opt_len_msmg1
l_msmg1 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_msmg1:
  m = re.search(r'Layer            MSMG1 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_msmg1.close()


# route_opt_len_msmg2
l_msmg2 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_msmg2:
  m = re.search(r'Layer            MSMG2 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_msmg2.close()


# route_opt_len_msmg3
l_msmg3 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_msmg3:
  m = re.search(r'Layer            MSMG3 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_msmg3.close()

# route_opt_len_msmg4
l_msmg4 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_msmg4:
  m = re.search(r'Layer            MSMG4 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_msmg4.close()


# route_opt_len_msmg5
l_msmg5 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_msmg5:
  m = re.search(r'Layer            MSMG5 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_msmg5.close()


# route_opt_len_mg1
l_mg1 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_mg1:
  m = re.search(r'Layer              MG1 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_mg1.close()


# route_opt_len_mg2
l_mg2 = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in l_mg2:
  m = re.search(r'Layer              MG2 :\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
l_mg2.close()


# route_opt_viol
viol = open('icc2rm/rpts_icc2/route_opt.check_routes','r')
for line in viol:
  m = re.search(r'@@@@@@@ TOTAL VIOLATIONS =\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
viol.close()


# tgt_clk_per
t_per = open('src/rtl/proj1/MulDiv.constraints.tcl','r')
for line in t_per:
  m = re.search(r'set CLK_PER\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
t_per.close()


# route_opt_wns
wns_max=None
wns = open('icc2rm/rpts_icc2/route_opt.report_timing.max','r')
for line in wns:
  m = re.search(r"slack+\s+\S+\s+([\-?0-9\.]+)",line)
  if m:
     if not wns_max or float(m.group(1))>float(wns_max):
        wns_max=m.group(1)
     continue
out.write(wns_max)
out.write(",")
wns.close()


# find the last line in global timing report
find = open('icc2rm/rpts_icc2/route_opt.report_global_timing','r')
for line in find:
    pass
last = line
find.close()


# route_opt_wnhs
wnhs = open('icc2rm/rpts_icc2/route_opt.report_global_timing','r')
for line in wnhs:
  m = re.search(r'Hold violations',line)
  if m:
     next(wnhs)
     next(wnhs)
     next(wnhs)
     for line in wnhs:
       m = re.search(r'WNS\s+([\-?0-9\.]+)',line)
       if m:
          out.write(m.group(1))
          break
  else:
     if (line == last):
        out.write("0")
out.write(",")
wnhs.close()


# route_opt_tns
tns = open('icc2rm/rpts_icc2/route_opt.report_global_timing','r')
for line in tns:
  m = re.search(r'Setup violations',line)
  if m:
     next(tns)
     next(tns)
     next(tns)
     for line in tns:
       m = re.search(r'TNS\s+([\-?0-9\.]+)',line)
       if m:
          out.write(m.group(1))
          break
  else:
     if (line == last):
        out.write("0")
out.write(",")
tns.close()


# route_opt_tnhs
tnhs = open('icc2rm/rpts_icc2/route_opt.report_global_timing','r')
for line in tnhs:
  m = re.search(r'Hold violations',line)
  if m:
     next(tnhs)
     next(tnhs)
     next(tnhs)
     for line in tnhs:
       m = re.search(r'TNS\s+([\-?0-9\.]+)',line)
       if m:
          out.write(m.group(1))
          break
  else:
     if (line == last):
        out.write("0")
out.write(",")
tnhs.close()


# tgt_max_trans
t_tran = open('icc2rm/rm_icc2_pnr_scripts/settings.place_opt.tcl','r')
for line in t_tran:
  m = re.search(r'set_max_transition -clock_path\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
t_tran.close()


# clk_uncert
c_unce = open('icc2rm/rm_icc2_pnr_scripts/clock_opt_cts.tcl','r')
for line in c_unce:
  m = re.search(r'set_clock_uncertainty -hold\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
c_unce.close()


# route_opt_max_trans
route_opt_max_trans=None
max_t = open('icc2rm/rpts_icc2/route_opt.report_clock_timing','r')
for line in max_t:
  m = re.search(r"Maximum active transition",line)
  if m:
     max_t_1 = next(max_t)
     n = re.search(r"\s+\w+/CLK\s+([0-9\.]+)",max_t_1)
     if n:
        if not route_opt_max_trans or float(n.group(1))>float(route_opt_max_trans):
           route_opt_max_trans=n.group(1)
        continue
out.write(route_opt_max_trans)
out.write(",")
max_t.close()


# route_opt_min_trans
route_opt_min_trans=None
min_t = open('icc2rm/rpts_icc2/route_opt.report_clock_timing','r')
for line in min_t:
  m = re.search(r"Minimum active transition",line)
  if m:
     min_t_1 = next(min_t)
     n = re.search(r"\s+\w+/CLK\s+([0-9\.]+)",min_t_1)
     if n:
        if not route_opt_min_trans or float(n.group(1))<float(route_opt_min_trans):
           route_opt_min_trans=n.group(1)
        continue
out.write(route_opt_min_trans)
out.write(",")
min_t.close()


# route_opt_clk_depth
clk_d = open('icc2rm/rpts_icc2/route_opt.report_clock_qor.summary','r')
for line in clk_d:
  m = re.search(r'All Clocks\s+[0-9\.]+\s+([0-9\.]+)',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
clk_d.close()


# route_opt_pow_int
p_int = open('icc2rm/rpts_icc2/route_opt.report_power','r')
for line in p_int:
  m = re.search(r'Cell Internal Power    =\s+(\S+)\s+pW',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
p_int.close()


# route_opt_pow_sw
p_sw = open('icc2rm/rpts_icc2/route_opt.report_power','r')
for line in p_sw:
  m = re.search(r"Net Switching Power    =\s+(\S+)\s+pW",line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
p_sw.close()


# route_opt_pow_leak
p_leak = open('icc2rm/rpts_icc2/route_opt.report_power','r')
for line in p_leak:
  m = re.search(r'Cell Leakage Power       =\s+(\S+)\s+pW',line)
  if m:
     out.write(m.group(1))
     break
out.write(",")
p_leak.close()


# man_opt
# out.write("")
out.write(",")


# pnr_time
t1 = os.path.getmtime('icc2rm/init_design')
t2 = os.path.getmtime('icc2rm/route_opt')
time = str(t2-t1)
out.write(time)
out.write("\n")


out.close()



















