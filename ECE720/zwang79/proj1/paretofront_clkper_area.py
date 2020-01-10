import numpy as np
import pandas as pd

from ece720.pareto import plotfront

out_origin = pd.read_csv('out.csv')
out_voi_fixed = out_origin[out_origin.route_opt_viol == 0]
out_fixed = out_voi_fixed[out_voi_fixed.route_opt_wnhs + out_voi_fixed.clk_uncert > out_voi_fixed.route_opt_max_trans]
out = out_fixed[out_fixed.tgt_clk_per - out_fixed.route_opt_wns < 1000] # I'm filtering this because I have some data that does not include positive setup slack and makes the min. clk period very large


df = pd.DataFrame({'x':out.tgt_clk_per - out.route_opt_wns,'y':out.core_area})
import matplotlib.pyplot as plt 
with plt.rc_context({'axes.edgecolor':'orange', 'xtick.color':'red', 'ytick.color':'green', 'figure.facecolor':'white'}):
     plt.plot(df.x,df.y,'b.')
xlabel = plt.xlabel('Min. Clock Period (ps)')
xlabel.set_color('red')
ylabel = plt.ylabel('Area (mm^2)')
ylabel.set_color('green')
plt.title('Clkperiod verses Area\n')
plotfront(df,'x','y',xmax=max(df.x),ymax=max(df.y))
plt.savefig('./pareto_image/Clkperiod_Area.png',dpi=1000)
#plt.show()



