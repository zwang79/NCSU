pattern = report_qor

all : dc icc date cvs

dc  :
	cd dcrm;\
	dc_shell -topographical_mode -f rm_dc_scripts/dc.tcl |& tee dc.log

icc :
	cd icc2rm;\
	make -f rm_setup/Makefile_pnr clean |& tee make_pnr.log;\
	make -f rm_setup/Makefile_pnr all |& tee make_pnr.log

pattern_count :
	grep -lri "$(pattern)" dcrm icc2rm |wc -l


timing :
	time --format="DC and ICC flow totally took %E" make all

date :
	date > flow_date.txt

cvs :
	python print.py

test :
	python p.py
