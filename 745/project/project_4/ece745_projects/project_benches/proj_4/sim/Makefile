export ECE745_PROJECT_HOME ?= $(PWD)/../../..
export ECE745_COMMON_HOME ?= /afs/eos.ncsu.edu/lockers/workspace/ece/ece745/001/common/project_2_provided_files
export NCSU_PKG_HOME ?= ECE745_COMMON_HOME/project_2_provided_files/ncsu_pkg

include $(ECE745_PROJECT_HOME)/verification_ip/interface_packages/wb_pkg/Makefile
include $(ECE745_PROJECT_HOME)/verification_ip/interface_packages/i2c_pkg/Makefile
include $(ECE745_PROJECT_HOME)/verification_ip/environment_packages/i2cmb_env_pkg/Makefile
include $(ECE745_COMMON_HOME)/ncsu_pkg/Makefile

GEN_TRANS_TYPE ?= wb_transaction
GEN_SEQ_TYPE_1 ?= sequence_base
GEN_SEQ_TYPE_2 ?= sequence_two
GEN_SEQ_TYPE_3 ?= sequence_one

TEST_SEED_1 ?= 1
TEST_SEED_2 ?= 2
TEST_SEED_3 ?= 3

clean: 
	rm -rf work *.wlf transcript

comp_I2C_MB:
	vcom +cover=bcesft ../rtl/iicmb_int_pkg.vhd
	vcom +cover=bcesft ../rtl/iicmb_pkg.vhd
	vcom +cover=bcesft ../rtl/mbyte.vhd
	vcom +cover=bcesft ../rtl/mbit.vhd
	vcom +cover=bcesft ../rtl/bus_state.vhd
	vcom +cover=bcesft ../rtl/filter.vhd
	vcom +cover=bcesft ../rtl/conditioner.vhd
	vcom +cover=bcesft ../rtl/conditioner_mux.vhd
	vcom +cover=bcesft ../rtl/iicmb_m.vhd
	vcom +cover=bcesft ../rtl/regblock.vhd
	vcom +cover=bcesft ../rtl/wishbone.vhd
	vcom +cover=bcesft ../rtl/iicmb_m_wb.vhd


comp_bench: comp_ncsu_pkg comp_i2c_pkg comp_wb_pkg comp_i2cmb_env_pkg 
	vlog ../testbench/top.sv

optimize:
	vopt +acc top -o optimized_debug_top_tb

compile: comp_I2C_MB comp_bench optimize

cli:
	vsim  -c -sv_seed $(TEST_SEED_1) -do "set NoQuitOnFinish 1; run -a;coverage attribute -name TESTNAME -value $(GEN_SEQ_TYPE_1); coverage save $(GEN_SEQ_TYPE_1).$(TEST_SEED_1).ucdb; quit -f" +GEN_TRANS_TYPE=wb_transaction +GEN_TRANS_TYPE=i2c_transaction +GEN_SEQ_TYPE=$(GEN_SEQ_TYPE_1) optimized_debug_top_tb -coverage
	vsim  -c -sv_seed $(TEST_SEED_2) -do "set NoQuitOnFinish 1; run -a;coverage attribute -name TESTNAME -value $(GEN_SEQ_TYPE_2); coverage save $(GEN_SEQ_TYPE_2).$(TEST_SEED_2).ucdb; quit -f" +GEN_TRANS_TYPE=wb_transaction +GEN_TRANS_TYPE=i2c_transaction +GEN_SEQ_TYPE=$(GEN_SEQ_TYPE_2) optimized_debug_top_tb -coverage
	vsim  -c -sv_seed $(TEST_SEED_3) -do "set NoQuitOnFinish 1; run -a;coverage attribute -name TESTNAME -value $(GEN_SEQ_TYPE_3); coverage save $(GEN_SEQ_TYPE_3).$(TEST_SEED_3).ucdb; quit -f" +GEN_TRANS_TYPE=wb_transaction +GEN_TRANS_TYPE=i2c_transaction +GEN_SEQ_TYPE=$(GEN_SEQ_TYPE_3) optimized_debug_top_tb -coverage


run_gui:
	vsim  -i -classdebug -msgmode both  -do "do wave.do;" +GEN_TRANS_TYPE=wb_transaction +GEN_TRANS_TYPE=i2c_transaction   +GEN_SEQ_TYPE=$(GEN_SEQ_TYPE) optimized_debug_top_tb -coverage

simulate:
	vsim  -i -classdebug -msgmode both -do "do wave.do;" optimized_debug_top_tb

debug  : clean convert_testplan debug_2 merge_coverage report_coverage
 
debug_2: clean compile optimize cli

debug_1: clean compile optimize run_gui

convert_testplan:
	xml2ucdb -format Excel ./i2cmb_test_plan.xls ./i2cmb_test_plan.ucdb
	add testbrowser ./*.ucdb
merge_coverage:
	vcover merge -stats=none -strip 0 -totals sim_and_testplan_merged.ucdb ./*.ucdb

report_coverage:
	vcover report -details -html -htmldir covhtmlreport -assert -directive -cvg -code bcefst -threshL 50 -threshH 90 ./sim_and_testplan_merged.ucdb

my_debug: clean convert_testplan debug_2 merge_coverage report_coverage
