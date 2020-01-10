import numpy as np
import pandas as pd

from ece720.pareto import plotfront

out_origin = pd.read_csv('out.csv')
out_voi_fixed = out_origin[out_origin.route_opt_viol == 0]
out_fixed = out_voi_fixed[out_voi_fixed.route_opt_wnhs + out_voi_fixed.clk_uncert > out_voi_fixed.route_opt_max_trans]
out = out_fixed[out_fixed.tgt_clk_per - out_fixed.route_opt_wns < 1000] # I'm filtering this because I have some data that does not include positive setup slack and makes the min. clk period very large


df = pd.DataFrame({'a':out.route_opt_clk_depth,'b':out.route_opt_pow_int})
import matplotlib.pyplot as plt 
with plt.rc_context({'axes.edgecolor':'orange', 'xtick.color':'red', 'ytick.color':'green', 'figure.facecolor':'white'}):
     plt.plot(df.a,df.b,'b.')
xlabel = plt.xlabel('Clock Depth')
xlabel.set_color('red')
ylabel = plt.ylabel('Dynamic Power')
ylabel.set_color('green')
plt.title('Clock Depth verses Dynamic Power\n')
plotfront(df,'a','b',xmax=max(df.a),ymax=max(df.b))
plt.savefig('./pareto_image/Clkdepth_Power.png',dpi=1000)
#plt.show()



