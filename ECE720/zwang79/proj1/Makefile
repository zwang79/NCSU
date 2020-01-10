.PHONY: all set

CLKPER=400
UTIL=0.5
MAXLYR=MSMG5
MAXTRANS=10
CLKUNCERT=12



all : set dc icc date result

set :
	python set_constraints.py $(CLKPER) $(UTIL) $(MAXLYR) $(MAXTRANS) $(CLKUNCERT)

dc  :
	cd dcrm;\
	dc_shell -topographical_mode -f rm_dc_scripts/dc.tcl |& tee dc.log

icc :
	cd icc2rm;\
	make -f rm_setup/Makefile_pnr clean |& tee make_pnr.log;\
	make -f rm_setup/Makefile_pnr all |& tee make_pnr.log

timing :
	time --format="DC and ICC flow totally took %E" make all

date :
	date > flow_date.txt

result :
	python print.py

#SHELL := /bin/bash

#pareto_set:
#	@source /afs/eos.ncsu.edu/lockers/research/ece/wdavis/tools/anaconda3/setup.sh

#source /afs/eos.ncsu.edu/lockers/research/ece/wdavis/tools/anaconda3/setup.sh
pareto: pareto1 pareto2 pareto3

pareto1:
	python paretofront_clkper_area.py

pareto2:
	python paretofront_clkdepth_power.py

pareto3:
	python paretofront_tgtclkper_power.py

