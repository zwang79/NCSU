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
    out.write("date,target_util,route_auto_util,route_auto_len,route_auto_viol,route_auto_time\n")



# write date
d = open('flow_date.txt')
for line in d:
  m = re.search(r"(.+)",line)
  if m:
     out.write(m.group())
     break

out.write(",")

# target utilization
tar_u = open('dcrm/rm_dc_scripts/dc.tcl','r')
for line in tar_u:
  m = re.search(r"set_utilization\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break

# final utilization
final_u = open('icc2rm/rpts_icc2/route_auto.report_utilization','r')
for line in final_u:
  m = re.search(r"Utilization Ratio:\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break

# wire length(micron)
wire_len = open('icc2rm/rpts_icc2/route_auto.check_routes','r')
for line in wire_len:
  m = re.search(r"Total Routed Wire Length =\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break

# Num of violations
viol = open('icc2rm/rpts_icc2/route_auto.check_routes','r')
for line in viol:
  m = re.search(r"	@@@@@@@ TOTAL VIOLATIONS =\s+([0-9\.]+)",line)
  if m:
     out.write(m.group(1))
     out.write(",")
     break


# time for auto route
t1 = os.path.getmtime('icc2rm/clock_opt_opto')
t2 = os.path.getmtime('icc2rm/route_auto')
time = str(t2-t1)
out.write(time)
out.write("\n")
out.close()



















